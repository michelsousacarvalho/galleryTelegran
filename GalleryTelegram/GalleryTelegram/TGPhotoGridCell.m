#import "TGPhotoGridCell.h"

#import "TGRemoteImageView.h"

//#import "TGInterfaceAssets.h"

#import "TGVideoMediaAttachment.h"

#import "NWImageCache.h"
#import "TGMidia.h"
#import "TGImageView.h"

#define TGStretchableImageInCenterWithName(s,t) { UIImage *rawImage = [UIImage imageNamed:s]; t = [rawImage stretchableImageWithLeftCapWidth:(int)((rawImage.size.width / 2)) topCapHeight:(int)((rawImage.size.height / 2))]; }

@interface TGPhotoGridCell ()

@property (nonatomic, strong) NSMutableArray *imageViews;
@property (nonatomic, strong) NSMutableArray *imageShadows;


@end

@implementation TGPhotoGridCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.imageViews = [[NSMutableArray alloc] init];
        self.imageShadows = [[NSMutableArray alloc] init];
        self.imageUrls = [[NSMutableArray alloc] init];
        self.imageTags = [[NSMutableArray alloc] init];
        self.imageAttachments = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)collectCachedPhotos:(NSMutableDictionary *)dict
{
//    for (TGRemoteImageView *imageView in _imageViews)
//    {
//        [imageView tryFillCache:dict];
//    }
}

- (CGRect)rectForImageWithTag:(id)tag
{
    for (int i = 0; i < (int)_imageTags.count; i++)
    {
        if ([[_imageTags objectAtIndex:i] isEqual:tag])
        {
            if (i < (int)_imageViews.count)
            {
//                TGRemoteImageView *imageView = [_imageViews objectAtIndex:i];
//                return imageView.frame;
                UIImageView *image  = [[UIImageView alloc] init];
                return image.frame;
            }
            break;
        }
    }
    
    return CGRectZero;
}

- (UIView *)viewForImageWithTag:(id)tag
{
    for (int i = 0; i < (int)_imageTags.count; i++)
    {
        if ([[_imageTags objectAtIndex:i] isEqual:tag])
        {
            if (i < (int)_imageViews.count)
            {
                UIImageView *imageView = [[UIImageView alloc] init];
//                TGRemoteImageView *imageView = [_imageViews objectAtIndex:i];
                return imageView;
            }
            break;
        }
    }
    
    return nil;
}

- (void)reloadImagesWithUrl:(NSString *)url
{
//    for (TGRemoteImageView *imageView in _imageViews)
//    {
//        if ([imageView.currentUrl isEqualToString:url])
//        {
//            UIImage *image = imageView.currentImage;
//            if (image == nil)
//                image = [imageView currentPlaceholderImage];
//            
//            imageView.placeholderOverlay.hidden = image != nil;
//            [imageView loadImage:url filter:imageView.currentFilter placeholder:image forceFade:image != nil];
//        }
//    }
}

//- (void)layoutSubviews
//{
//    [super layoutSubviews];
//    
//    CGSize imageSize = CGSizeMake(75, 75);
//    int widthSpacing = 4;
//    float currentX = (int)((self.frame.size.width - (_numberOfImagePlaces * imageSize.width + (_numberOfImagePlaces - 1) * widthSpacing)) / 2);
//    
////    UIImage *placeholder = [TGInterfaceAssets mediaGridImagePlaceholder];
////    UIImage *shadowImage = [TGInterfaceAssets mediaGridImageShadow];
//    
//    int urlCount = self.imageUrls.count;
//    int count = self.imageViews.count;
//    int limit = MAX(_numberOfImagePlaces, count);
////    for (int i = 0; i < limit; i++)
////    {
////        TGRemoteImageView *imageView = nil;
//        self.imageViewMidia = nil;
////        UIImageView *imageView = nil;
//       __block UIView *shadowView = nil;
////        if (i >= count)
////        {
//            self.imageViewMidia = [[UIImageView alloc] initWithFrame:CGRectZero];
//            self.imageViewMidia.clipsToBounds = true;
//            self.imageViewMidia.contentMode = UIViewContentModeScaleAspectFill;
//            [self.imageViewMidia addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewTapped:)]];
//            NWImageCache *imageCache = [NWImageCache sharedInstance];
//                [imageCache.imageRequest fetchImageWithUrl:self.midia.urlMidiaFull andNameImage:@"ImageName" withcompletionBlock:^(UIImage *image) {
//                    self.imageViewMidia.image = image;
//                    [self.contentView addSubview:self.imageViewMidia];
//                    self.imageViewMidia.userInteractionEnabled = true;
//                    shadowView = [[UIImageView alloc] initWithImage:image];
//                    [self.imageViewMidia addSubview:shadowView];
//                }];

//            [[TGRemoteImageView alloc] initWithFrame:CGRectZero];

//            imageView.fadeTransition = true;
            
//            [self.contentView addSubview:self.imageViewMidia];
//            [_imageViews addObject:imageView];
//            self.imageViewMidia.userInteractionEnabled = true;
    
            
//            shadowView = [[UIImageView alloc] initWithImage:shadowImage];

//            [imageView addSubview:shadowView];
            
//            count++;
//        }
//        else
//            imageView = [_imageViews objectAtIndex:i];
//        
//        imageView.frame = CGRectMake(currentX, 4, imageSize.width, imageSize.height);
//        currentX += imageSize.width + widthSpacing;
//        
//        if (i >= urlCount)
//        {
//            [imageView loadImage:nil];
//            imageView.hidden = true;
//        }
//        else
//        {
//            imageView.hidden = false;
//            if (imageView.currentUrl == nil || ![imageView.currentUrl isEqualToString:[_imageUrls objectAtIndex:i]])
//            {
////                [imageView loadImage:[_imageUrls objectAtIndex:i] filter:@"mediaGridImage" placeholder:placeholder];
//                
//                UIView *mediaBar = [imageView viewWithTag:201];
//                
//                TGMediaAttachment *attachment = [_imageAttachments objectAtIndex:i];
//                if (attachment.type == TGVideoMediaAttachmentType)
//                {
//                    TGVideoMediaAttachment *videoAttachment = (TGVideoMediaAttachment *)attachment;
//                    if (mediaBar == nil)
//                    {
//                        static UIImage *videoIconImage = nil;
//                        static UIFont *labelFont = nil;
//                        static UIColor *barColor = nil;
//                        if (videoIconImage == nil)
//                        {
//                            videoIconImage = [UIImage imageNamed:@"MessageInlineVideoIcon.png"];
//                            labelFont = [UIFont boldSystemFontOfSize:10];
////                            barColor = UIColorRGB(0x000000, 0.6f);
//                        }
//                        
//                        mediaBar = [[UIView alloc] initWithFrame:CGRectMake(0, 75 - 19, 75, 19)];
//                        mediaBar.userInteractionEnabled = false;
//                        mediaBar.tag = 201;
//                        mediaBar.backgroundColor = barColor;
//                        
//                        UIImageView *iconView = [[UIImageView alloc] initWithImage:videoIconImage];
//                        iconView.frame = CGRectOffset(iconView.frame, 4, 5);
//                        [mediaBar addSubview:iconView];
//                        
//                        UILabel *videoLabel = [[UILabel alloc] initWithFrame:CGRectMake(75 - 56 - 3, 0, 56, 19)];
//                        videoLabel.tag = 202;
//                        videoLabel.backgroundColor = [UIColor clearColor];
//                        videoLabel.textColor = [UIColor whiteColor];
//                        videoLabel.font = labelFont;
//                        videoLabel.textAlignment = UITextAlignmentRight;
//                        [mediaBar addSubview:videoLabel];
//                        
//                        [imageView addSubview:mediaBar];
//                    }
//                    
//                    mediaBar.hidden = false;
//                    mediaBar.alpha = 1.0f;
//                    UILabel *videoLabel = (UILabel *)[mediaBar viewWithTag:202];
//                    
//                    int minutes = videoAttachment.duration / 60;
//                    int seconds = videoAttachment.duration % 60;
//                    videoLabel.text = [[NSString alloc] initWithFormat:@"%d:%02d", minutes, seconds];
//                }
//                else
//                {
//                    mediaBar.hidden = true;
//                }
//            }
//        }
//    }
//}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGSize imageSize = CGSizeMake(75, 75);
    int widthSpacing = 4;
    float currentX = (int)((self.frame.size.width - (self.numberOfImagePlaces * imageSize.width + (self.numberOfImagePlaces - 1) * widthSpacing)) / 2);
    
    UIImage *placeholder = [TGPhotoGridCell mediaGridImagePlaceholder];
    UIImage *shadowImage = [TGPhotoGridCell mediaGridImageShadow];
    
    NSInteger urlCount = self.imageUrls.count;
    NSInteger count = self.imageViews.count;
    NSInteger limit = MAX(self.numberOfImagePlaces, count);
    for (int i = 0; i < limit; i++)
    {
        TGImageView *imageView = nil;
        UIView *shadowView = nil;
        if (i >= count)
        {
            imageView = [[TGImageView alloc] initWithFrame:CGRectZero];
            imageView.fadeTransition = true;
            imageView.clipsToBounds = true;
            imageView.contentMode = UIViewContentModeScaleAspectFill;
            [self.contentView addSubview:imageView];
            [self.imageViews addObject:imageView];
            imageView.userInteractionEnabled = true;
            [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewTapped:)]];
            
            shadowView = [[UIImageView alloc] initWithImage:shadowImage];
            [imageView addSubview:shadowView];
            
            count++;
        }
        else
            imageView = [self.imageViews objectAtIndex:i];
        
        imageView.frame = CGRectMake(currentX, 4, imageSize.width, imageSize.height);
        currentX += imageSize.width + widthSpacing;
        
        [imageView loadImageUsingUrl:[self.imageUrls objectAtIndex:i]];
        
//        if (i >= urlCount)
//        {
////            [imageView loadImage:nil];
////            imageView.hidden = true;
//        }
//        else
//        {
//            imageView.hidden = false;
//            if (imageView.currentUrl == nil || ![imageView.currentUrl isEqualToString:[_imageUrls objectAtIndex:i]])
//            {
//                [imageView loadImage:[_imageUrls objectAtIndex:i] filter:@"mediaGridImage" placeholder:placeholder];
//                
//                UIView *mediaBar = [imageView viewWithTag:201];
//                
//                TGMediaAttachment *attachment = [_imageAttachments objectAtIndex:i];
//                if (attachment.type == TGVideoMediaAttachmentType)
//                {
//                    TGVideoMediaAttachment *videoAttachment = (TGVideoMediaAttachment *)attachment;
//                    if (mediaBar == nil)
//                    {
//                        static UIImage *videoIconImage = nil;
//                        static UIFont *labelFont = nil;
//                        static UIColor *barColor = nil;
//                        if (videoIconImage == nil)
//                        {
//                            videoIconImage = [UIImage imageNamed:@"MessageInlineVideoIcon.png"];
//                            labelFont = [UIFont boldSystemFontOfSize:10];
//                            barColor = UIColorRGBA(0x000000, 0.6f);
//                        }
//                        
//                        mediaBar = [[UIView alloc] initWithFrame:CGRectMake(0, 75 - 19, 75, 19)];
//                        mediaBar.userInteractionEnabled = false;
//                        mediaBar.tag = 201;
//                        mediaBar.backgroundColor = barColor;
//                        
//                        UIImageView *iconView = [[UIImageView alloc] initWithImage:videoIconImage];
//                        iconView.frame = CGRectOffset(iconView.frame, 4, 5);
//                        [mediaBar addSubview:iconView];
//                        
//                        UILabel *videoLabel = [[UILabel alloc] initWithFrame:CGRectMake(75 - 56 - 3, 0, 56, 19)];
//                        videoLabel.tag = 202;
//                        videoLabel.backgroundColor = [UIColor clearColor];
//                        videoLabel.textColor = [UIColor whiteColor];
//                        videoLabel.font = labelFont;
//                        videoLabel.textAlignment = UITextAlignmentRight;
//                        [mediaBar addSubview:videoLabel];
//                        
//                        [imageView addSubview:mediaBar];
//                    }
//                    
//                    mediaBar.hidden = false;
//                    mediaBar.alpha = 1.0f;
//                    UILabel *videoLabel = (UILabel *)[mediaBar viewWithTag:202];
//                    
//                    int minutes = videoAttachment.duration / 60;
//                    int seconds = videoAttachment.duration % 60;
//                    videoLabel.text = [[NSString alloc] initWithFormat:@"%d:%02d", minutes, seconds];
//                }
//                else
//                {
//                    mediaBar.hidden = true;
//                }
//            }
//        }
    }
}



- (void)imageViewTapped:(UITapGestureRecognizer *)recognizer
{
    if (recognizer.state == UIGestureRecognizerStateRecognized)
    {
//        TGRemoteImageView *remoteImageView = (TGRemoteImageView *)recognizer.view;
        TGImageView *imageView  = (TGImageView*) recognizer.view;
        if (![imageView isKindOfClass:[TGImageView class]])
            return;
        
        UIImage *currentImage = [imageView currentImage];
        if (currentImage == nil)
            return;
        
        int imageIndex = [self.imageViews indexOfObject:recognizer.view];
        id tag = nil;
        if (imageIndex >= 0 && imageIndex < (int)_imageTags.count)
            tag = [_imageTags objectAtIndex:imageIndex];
        
        if (imageIndex >= 0 && imageIndex < (int)_imageUrls.count && tag != nil)
        {
            
//            id<ASWatcher> watcher = _watcherHandle.delegate;
//            if (watcher != nil && [watcher respondsToSelector:@selector(actionStageActionRequested:options:)])
//            {
//                [watcher actionStageActionRequested:@"openImage" options:[[NSDictionary alloc] initWithObjectsAndKeys:currentImage, @"image", [NSValue valueWithCGRect:[remoteImageView convertRect:remoteImageView.bounds toView:self.window]], @"rectInWindowCoords", tag, @"tag", nil]];
//            }
        }
    }
}


+ (UIImage *)mediaGridImagePlaceholder
{
    static UIImage *image = nil;
    if (image == nil)
        image = [UIImage imageNamed:@"FlatImagePlaceholder.png"];
    return image;
}

+ (UIImage *)mediaGridImageShadow
{
    static UIImage *image = nil;
    if (image == nil)
        TGStretchableImageInCenterWithName(@"MediaGridImageShadow.png", image);
    return image;
}



@end
