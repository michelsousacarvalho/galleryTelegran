#import "TGRemoteImageView.h"

#import <QuartzCore/QuartzCore.h>

#import "TGCache.h"

#import "SGraphObjectNode.h"

#import "TGViewRecycler.h"

static TGCache *sharedCache = nil;

@interface TGRemoteImageView ()

@property (atomic, strong) NSString *path;

@property (nonatomic, strong) UIImageView *placeholderView;

@end

@implementation TGRemoteImageView

+ (NSMutableDictionary *)imageProcessors
{
    static NSMutableDictionary *dictionary = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
    {
        dictionary = [[NSMutableDictionary alloc] init];
    });
    return dictionary;
}

+ (NSMutableDictionary *)universalImageProcessors
{
    static NSMutableDictionary *dictionary = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
    {
        dictionary = [[NSMutableDictionary alloc] init];
    });
    return dictionary;
}

+ (void)throttleDownProcessing
{
    
}

+ (void)registerImageUniversalProcessor:(TGImageUniversalProcessor)universalProcessor withBaseName:(NSString *)baseName
{
    [[TGRemoteImageView universalImageProcessors] setObject:[universalProcessor copy] forKey:baseName];
}

+ (void)registerImageProcessor:(TGImageProcessor)imageProcessor withName:(NSString *)name
{
    [[TGRemoteImageView imageProcessors] setObject:[imageProcessor copy] forKey:name];
}

+ (TGImageProcessor)imageProcessorForName:(NSString *)name
{
    TGImageProcessor processor = [[TGRemoteImageView imageProcessors] objectForKey:name];
    if (processor != nil)
        return processor;
    
    NSRange range = [name rangeOfString:@":"];
    if (range.location != NSNotFound)
    {
        NSString *baseName = [name substringToIndex:range.location];
        TGImageUniversalProcessor universalProcessor = [[TGRemoteImageView universalImageProcessors] objectForKey:baseName];
        if (universalProcessor != nil)
        {
            return ^UIImage *(UIImage *source)
            {
                return universalProcessor(name, source);
            };
        }
    }
    
    return nil;
}

+ (void)setSharedCache:(TGCache *)cache
{
    sharedCache = cache;
}

+ (TGCache *)sharedCache
{
    return sharedCache;
}

#pragma mark - Implementation

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
//        _actionHandle = [[ASHandle alloc] initWithDelegate:self releaseOnMainThread:true];
        _fadeTransitionDuration = 0.14;
        _useCache = true;
    }
    return self;
}

- (void)dealloc
{
//    [_actionHandle reset];
    [self cancelLoading];
}

- (void)addGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
{
    self.userInteractionEnabled = true;
    
    [super addGestureRecognizer:gestureRecognizer];
}

- (void)setFadeTransition:(bool)fadeTransition
{
    if (fadeTransition != _fadeTransition)
    {
        if (fadeTransition && _placeholderView == nil)
        {
            _placeholderView = [[UIImageView alloc] init];
            _placeholderView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
            _placeholderView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            [_placeholderView setContentMode:self.contentMode];
            [self addSubview:_placeholderView];
        }
        else if (!fadeTransition && _placeholderView != nil)
        {
            [_placeholderView removeFromSuperview];
            _placeholderView = nil;
        }
        
        _fadeTransition = fadeTransition;
    }
}

- (void)setContentMode:(UIViewContentMode)contentMode
{
    if (_placeholderView != nil)
        [_placeholderView setContentMode:contentMode];
    
    [super setContentMode:contentMode];
}

- (void)setPlaceholderOverlay:(UIView<TGReusableView> *)placeholderOverlay
{
    if (_placeholderOverlay != nil)
    {
        [_placeholderOverlay removeFromSuperview];
        _placeholderOverlay = nil;
    }
    
    _placeholderOverlay = placeholderOverlay;
    [_placeholderView addSubview:placeholderOverlay];
}

- (void)prepareForRecycle:(TGViewRecycler *)recycler
{
    [self cancelLoading];
#if TGRemoteImageUseContents
    self.layer.contents = nil;
#else
    self.image = nil;
#endif
    
    if (_placeholderOverlay != nil)
    {
        [_placeholderOverlay removeFromSuperview];
        [recycler recycleView:_placeholderOverlay];
        _placeholderOverlay = nil;
    }
}

- (void)prepareForReuse
{
    [self cancelLoading];
#if TGRemoteImageUseContents
    self.layer.contents = nil;
#else
    self.image = nil;
#endif
}

- (UIImage *)currentImage
{
    if (_manualParentView != nil)
        return self.image;
#if TGRemoteImageUseContents
    else if (self.layer.contents != nil)
        return [UIImage imageWithCGImage:(CGImageRef)self.layer.contents];
#else
    else
        return self.image;
#endif
    return nil;
}

- (UIImage *)currentPlaceholderImage
{
    return _placeholderView.image;
}

- (void)tryFillCache:(NSMutableDictionary *)dict
{
    if (_currentUrl == nil)
        return;
    
    UIImage *currentImage = [self currentImage];
    if (currentImage != nil)
    {
        NSString *key = _currentFilter == nil ? _currentUrl : [[NSString alloc] initWithFormat:@"{filter:%@}%@", _currentFilter, _currentUrl];
        
        if (key != nil)
            [dict setObject:currentImage forKey:key];
    }
}

- (void)loadImage:(UIImage *)image
{
    [self cancelLoading];
    
    if (_manualParentView != nil)
    {
        self.image = image;
        [_manualParentView setNeedsDisplayInRect:self.frame];
    }
    else
    {
#if TGRemoteImageUseContents
        self.layer.contents = (id)(image.CGImage);
#else
        self.image = image;
#endif
    }
    
    if (_placeholderView != nil)
    {
        [_placeholderView.layer removeAllAnimations];
        _placeholderView.image = nil;
        _placeholderView.hidden = true;
        _placeholderView.alpha = 0.0f;
    }
}

- (void)loadImage:(NSString *)url filter:(NSString *)filter placeholder:(UIImage *)placeholder
{
    [self loadImage:url filter:filter placeholder:placeholder forceFade:false];
}

- (void)loadImage:(NSString *)url filter:(NSString *)filter placeholder:(UIImage *)placeholder forceFade:(bool)forceFade
{
    [self cancelLoading];
    
    self.currentUrl = url;
    self.currentFilter = filter;
    
    TGCache *cache = _cache != nil ? _cache : [TGRemoteImageView sharedCache];
    
    NSString *cacheUrl = filter == nil ? url : [[NSString alloc] initWithFormat:@"{filter:%@}%@", filter, url];
    
    UIImage *image = [cache cachedImage:cacheUrl availability:TGCacheMemory | ((_contentHints & TGRemoteImageContentHintLoadFromDiskSynchronously) ? TGCacheDisk : 0)];
    
    if (image == nil && (_contentHints & TGRemoteImageContentHintLoadFromDiskSynchronously) && filter != nil)
    {
        UIImage *rawImage = [cache cachedImage:url availability:TGCacheDisk];
        
        if (rawImage != nil)
        {
            TGImageProcessor procesor = [TGRemoteImageView imageProcessorForName:filter];
            if (procesor != nil)
                image = procesor(rawImage);
        }
    }
    
    if (image != nil)
    {
        if (_contentHints & TGRemoteImageContentHintSaveToGallery)
        {
//            [ActionStageInstance() requestActor:[[NSString alloc] initWithFormat:@"/tg/checkImageStored/(%d)", [url hash]] options:[[NSDictionary alloc] initWithObjectsAndKeys:url, @"url", nil] watcher:self];
        }
        
        if (forceFade)
        {
            if (_manualParentView != nil)
            {
                self.image = image;
                [_manualParentView setNeedsDisplayInRect:self.frame];
            }
            else
            {
#if TGRemoteImageUseContents
                self.layer.contents = (id)(image.CGImage);
#else
                self.image = image;
#endif
            }
            
            if (_placeholderView != nil)
            {   
                [_placeholderView.layer removeAllAnimations];
                UIView *placeholderView = _placeholderView;
                _placeholderView.alpha = 1.0f;
                _placeholderView.hidden = false;
                if (placeholder != nil)
                    _placeholderView.image = placeholder;
                [UIView animateWithDuration:_fadeTransitionDuration animations:^{
                    placeholderView.alpha = 0.0f;
                } completion:^(BOOL finished)
                {
                    if (finished)
                        placeholderView.hidden = true;
                }];
            }
        }
        else
        {
            if (_manualParentView != nil)
            {
                self.image = image;
                [_manualParentView setNeedsDisplayInRect:self.frame];
            }
            else
            {
#if TGRemoteImageUseContents
                self.layer.contents = (id)(image.CGImage);
#else
                self.image = image;
#endif
            }
            
            if (_placeholderView != nil)
            {
                [_placeholderView.layer removeAllAnimations];
                _placeholderView.image = nil;
                _placeholderView.hidden = true;
                _placeholderView.alpha = 0.0f;
            }
        }
        
        if (_progressHandler)
            _progressHandler(self, 1.0f);
    }
    else
    {
        if (_allowThumbnailCache)
        {
            UIImage *thumbnail = [cache cachedThumbnail:cacheUrl];
            if (thumbnail != nil)
                placeholder = thumbnail;
        }
        
        if (_placeholderView != nil)
        {
#if TGRemoteImageUseContents
            self.layer.contents = nil;
#else
            self.image = nil;
#endif
            [_placeholderView.layer removeAllAnimations];
            _placeholderView.image = placeholder;
            _placeholderView.hidden = false;
            _placeholderView.alpha = 1.0f;
        }
        else
        {
            if (_manualParentView != nil)
            {
                self.image = placeholder;
                [_manualParentView setNeedsDisplayInRect:self.frame];
            }
            else
            {
#if TGRemoteImageUseContents
                self.layer.contents = (id)(placeholder.CGImage);
#else
                self.image = placeholder;
#endif
            }
        }
        
        if (filter != nil)
            self.path = [NSString stringWithFormat:@"/img/({filter:%@}%@)", filter, url];
        else
            self.path = [NSString stringWithFormat:@"/img/(%@)", url];
        
        NSMutableDictionary *options = [[NSMutableDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithInt:_cancelTimeout], @"cancelTimeout", cache, @"cache", [NSNumber numberWithBool:_useCache], @"useCache", [NSNumber numberWithBool:_allowThumbnailCache], @"allowThumbnailCache", [[NSNumber alloc] initWithInt:_contentHints], @"contentHints", nil];
        if (_userProperties != nil)
            [options setObject:_userProperties forKey:@"userProperties"];
//        [ActionStageInstance() requestActor:self.path options:options watcher:self];
    }
}

- (void)loadPlaceholder:(UIImage *)placeholder
{
    if (!_placeholderView.hidden)
        _placeholderView.image = placeholder;
}

- (void)cancelLoading
{
    if (self.path != nil)
    {
//        ASHandle *actionHandle = _actionHandle;
        NSString *path = self.path;
//        [ActionStageInstance() dispatchOnStageQueue:^
//        {
//            [ActionStageInstance() removeWatcherByHandle:actionHandle fromPath:path];
//        }];
        
        if (_manualParentView != nil)
        {
            if (self.image != nil)
            {
                self.image = nil;
                [_manualParentView setNeedsDisplayInRect:self.frame];
            }
        }
        else
        {
#if TGRemoteImageUseContents
            self.layer.contents = nil;
#else
            self.image = nil;
#endif
        }
        if (_placeholderView != nil)
        {
            [_placeholderView.layer removeAllAnimations];
        }
        
        self.path = nil;
    }
    
    self.currentUrl = nil;
    self.currentFilter = nil;
}

+ (UIImage *)imageFromCache:(NSString *)url filter:(NSString *)filter cache:(TGCache *)cache
{
    TGCache *usingCache = cache != nil ? cache : [TGRemoteImageView sharedCache];
    
    UIImage *image = nil;
    if (filter == nil)
        image = [usingCache cachedImage:url availability:TGCacheMemory];
    else
        image = [usingCache cachedImage:[[NSString alloc] initWithFormat:@"{filter:%@}%@", filter, url] availability:TGCacheMemory];
    
    return image;
}

//+ (NSString *)preloadImage:(NSString *)url filter:(NSString *)filter cache:(TGCache *)cache allowThumbnailCache:(bool)allowThumbnailCache watcher:(id<ASWatcher>)watcher
//{
//    TGCache *usingCache = cache != nil ? cache : [TGRemoteImageView sharedCache];
//    
//    UIImage *image = nil;
//    if (filter == nil)
//        image = [usingCache cachedImage:url availability:TGCacheMemory];
//    else
//        image = [usingCache cachedImage:[[NSString alloc] initWithFormat:@"{filter:%@}%@", filter, url] availability:TGCacheMemory];
//    
//    if (image == nil)
//    {
//        NSString *path = nil;
//        if (filter != nil)
//            path = [NSString stringWithFormat:@"/img/({filter:%@}%@)", filter, url];
//        else
//            path = [NSString stringWithFormat:@"/img/(%@)", url];
//        
//        NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:0], @"cancelTimeout", usingCache, @"cache", [NSNumber numberWithBool:allowThumbnailCache], @"forceMemoryCache", @(TG_CACHE_INPLACE), @"allowThumbnailCache", nil];
//        [ActionStageInstance() requestActor:path options:options watcher:watcher];
//        
//        return path;
//    }
//    
//    return nil;
//}

- (void)actorMessageReceived:(NSString *)path messageType:(NSString *)messageType message:(id)message
{
    if ([messageType isEqualToString:@"progress"])
    {
        dispatch_async(dispatch_get_main_queue(), ^
        {
            if (_progressHandler == nil)
                return;
            
            if (self.path != nil && [path isEqualToString:self.path])
            {
                if (_progressHandler)
                    _progressHandler(self, [message floatValue]);
            }
        });
    }
}

- (void)actorReportedProgress:(NSString *)path progress:(float)progress
{
    dispatch_async(dispatch_get_main_queue(), ^
    {
        if (_progressHandler == nil)
            return;
        
        if (self.path != nil && [path isEqualToString:self.path])
        {
            if (_progressHandler)
                _progressHandler(self, progress);
        }
    });
}

//- (void)actorCompleted:(int)resultCode path:(NSString *)path result:(id)result
//{
//    dispatch_async(dispatch_get_main_queue(), ^
//    {
//        if (self.path != nil && [path isEqualToString:self.path])
//        {
//            if (resultCode == ASStatusSuccess && result != nil)
//            {
//                if (_contentHints & TGRemoteImageContentHintSaveToGallery)
//                {
////                    [ActionStageInstance() requestActor:[[NSString alloc] initWithFormat:@"/tg/checkImageStored/(%d)", [self.currentUrl hash]] options:[[NSDictionary alloc] initWithObjectsAndKeys:self.currentUrl, @"url", nil] watcher:self];
//                }
//                
//                UIImage *image = ((SGraphObjectNode *)result).object;
//                if (image != nil)
//                {
//#if TG_CACHE_INPLACE
//                    if (_useCache)
//                    {
//                        TGCache *cache = _cache != nil ? _cache : [TGRemoteImageView sharedCache];
//                        [cache cacheImage:image withData:nil url:self.currentUrl availability:TGCacheMemory];
//                    }
//#endif
//                    
//                    if (_manualParentView != nil)
//                    {
//                        self.image = image;
//                        [_manualParentView setNeedsDisplayInRect:self.frame];
//                    }
//                    else
//                    {
//#if TGRemoteImageUseContents
//                        self.layer.contents = (id)(image.CGImage);
//#else
//                        self.image = image;
//#endif
//                    }
//                    
//                    if (_placeholderView != nil)
//                    {
//                        //[_placeholderView.layer removeAllAnimations];
//                        if (_fadeTransitionDuration < FLT_EPSILON)
//                        {
//                            _placeholderView.alpha = 0.0f;
//                            _placeholderView.hidden = true;
//                        }
//                        else
//                        {
//                            UIView *placeholderView = _placeholderView;
//                            [UIView animateWithDuration:_fadeTransitionDuration animations:^
//                            {
//                                placeholderView.alpha = 0.0f;
//                            } completion:^(BOOL finished)
//                            {
//                                if (finished)
//                                    placeholderView.hidden = true;
//                            }];
//                        }
//                    }
//                }
//            }
//            else
//            {
//                self.currentUrl = nil;
//                self.currentFilter = nil;
//            }
//            
//            if (_progressHandler)
//                _progressHandler(self, 1.0f);
//            
//            self.path = nil;
//        }
//        /*else if (self.path != nil && ![path isEqualToString:self.path])
//        {
//            TGLog(@"Received wrong path: <<<%@>>> vs <<<%@>>>", self.path, path);
//        }*/
//    });
//}

@end
