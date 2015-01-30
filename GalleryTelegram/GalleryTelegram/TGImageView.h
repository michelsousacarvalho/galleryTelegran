//
//  TGImageView.h
//  GalleryTelegram
//
//  Created by Michel de Sousa Carvalho on 29/01/15.
//  Copyright (c) 2015 Michel de Sousa Carvalho. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TGImageView : UIImageView

@property (nonatomic, strong) UIImage *image;
@property (nonatomic) bool fadeTransition;
@property (nonatomic, strong) UIView *manualParentView;

- (void)loadImageUsingUrl:(NSString*) urlImage;
- (UIImage *)currentImage;


@end
