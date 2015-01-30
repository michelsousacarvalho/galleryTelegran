//
//  TGImageView.m
//  GalleryTelegram
//
//  Created by Michel de Sousa Carvalho on 29/01/15.
//  Copyright (c) 2015 Michel de Sousa Carvalho. All rights reserved.
//

#import "TGImageView.h"
#import "NWImageCache.h"

@interface TGImageView()
@property (nonatomic, strong) UIImageView *placeholderView;

@end


@implementation TGImageView

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
            self.placeholderView = [[UIImageView alloc] init];
            self.placeholderView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
            self.placeholderView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            [self.placeholderView setContentMode:self.contentMode];
            [self addSubview:self.placeholderView];
        }
        else if (!fadeTransition && _placeholderView != nil)
        {
            [self.placeholderView removeFromSuperview];
            self.placeholderView = nil;
        }
        
//        self.fadeTransition = fadeTransition;
    }
}

- (void)loadImageUsingUrl:(NSString*) urlImage
{
    NWImageCache *imageCache = [NWImageCache sharedInstance];
    
    [imageCache.imageRequest fetchImageWithUrl:urlImage andNameImage:urlImage withcompletionBlock: ^(UIImage *image) {
        self.image = image;
    }];
 
    if (self.placeholderView != nil)
    {
        [self.placeholderView.layer removeAllAnimations];
        self.placeholderView.image = nil;
        self.placeholderView.hidden = true;
        self.placeholderView.alpha = 0.0f;
    }
}


- (UIImage *)currentImage
{
//    if (_manualParentView != nil)
//        return self.image;
//#if TGRemoteImageUseContents
//    else if (self.layer.contents != nil)
//        return [UIImage imageWithCGImage:(CGImageRef)self.layer.contents];
//#else
//    else
//        return self.image;
//#endif
//    return nil;

    return self.image;
}





@end
