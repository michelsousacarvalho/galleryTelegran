//
//  RMDemoOriginViewController.m
//  RMGallery
//
//  Created by Hermés Piqué on 16/04/14.
//  Copyright (c) 2014 Robot Media. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//   http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "RMDemoOriginViewController.h"
#import "RMDemoGalleryViewController.h"
#import "RMGalleryTransition.h"
#import "NWImageCache.h"

#define RM_NAVIGATION_CONTROLLER 1

@interface RMDemoOriginViewController()<UIViewControllerTransitioningDelegate, RMGalleryTransitionDelegate>

@property(retain) IBOutletCollection(UIImageView) NSArray *imageViews;
@property (nonatomic, strong) NSMutableArray *urlsPhotos;

@end

@implementation RMDemoOriginViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.urlsPhotos  = [[NSMutableArray alloc] init];
    [self.urlsPhotos addObject:@"http://s2.glbimg.com/5vNTs5PfL4Z0AiMhc_wMZiRz1TU=/90x68/s.glbimg.com/jo/g1/f/original/2015/01/19/acidente_fatal_trevo_de_perdizes_homem_de_29_anos.16-01-1.jpg"];
    [self.urlsPhotos addObject:@"http://s2.glbimg.com/K4ApGSfN_qcJnHVR1yui5Y5Z-tY=/90x68/s.glbimg.com/jo/g1/f/original/2015/01/19/detento.jpg"];
    [self.urlsPhotos addObject:@"http://s2.glbimg.com/ZGUwiIcYaf5eJpiqbDsQdxaQrRE=/90x68/s.glbimg.com/jo/g1/f/original/2015/01/19/raiva.jpg"];
    [self.urlsPhotos addObject:@"http://s2.glbimg.com/kVx8OrhMdxVM_HQZT8jdcT3aADc=/90x68/s.glbimg.com/jo/g1/f/original/2015/01/17/imagem_de_sao_sebastiao_igreja_de_sao_sebastiao_juiz_de_fora_2.jpg"];
    [self.urlsPhotos addObject:@"http://s2.glbimg.com/slE90JQotBLILb55gajkV8aEoqo=/90x68/s.glbimg.com/jo/g1/f/original/2015/01/19/coach.jpg"];
    [self.urlsPhotos addObject:@"http://s2.glbimg.com/bFzjr2Ddft0OLRh8ATJfIKoNImY=/90x68/s.glbimg.com/jo/g1/f/original/2015/01/19/620_01.jpg"];
   
    for (NSString *url in self.urlsPhotos) {
        NWImageCache *imageCache = [NWImageCache sharedInstance];
        [imageCache.imageRequest fetchImageWithUrl:url andNameImage:[NSString stringWithFormat: @"%ld", (long)[self.urlsPhotos indexOfObject:url]] withcompletionBlock:^(UIImage *image) {
            UIImageView *imageView = [self.imageViews objectAtIndex:[self.urlsPhotos indexOfObject:url]];
            imageView.image = image;
//            imagePhoto = image;
//             int index = 0;
//            imagePhot∫∫o= [imagePhoto demo_imageByScalingByFactor:0.75];
//            for (UIImageView *imageView in self.imageViews) {
//                if(imageView.image == nil){
//                    imageView.image = image;
//                    break;
//                }
                
//            }
//            UIImage *imageOfArrayImageViews = [self.imageViews ]
//            [[self.imageViews objectAtIndex:index] setImage:image];
//            index = index+1;
        }];
        
       
    }
    
}

- (void)presentGalleryWithImageAtIndex:(NSUInteger)index

{
    
    
    RMDemoGalleryViewController *galleryViewController = [RMDemoGalleryViewController new];
    galleryViewController.galleryIndex = index;
    
// The gallery is designed to be presented in a navigation controller or on its own.
    UIViewController *viewControllerToPresent;
#if RM_NAVIGATION_CONTROLLER
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:galleryViewController];
    navigationController.toolbarHidden = NO;
    
    // When using a navigation controller the tap gesture toggles the navigation bar and toolbar. A way to dismiss the gallery must be provided.
    galleryViewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissGallery:)];
    
    viewControllerToPresent = navigationController;
#else
    viewControllerToPresent = galleryViewController;
#endif
    
    // Set the transitioning delegate. This is only necessary if you want to use RMGalleryTransition.
    viewControllerToPresent.transitioningDelegate = self;
    viewControllerToPresent.modalPresentationStyle = UIModalPresentationFullScreen;
    
    [self presentViewController:viewControllerToPresent animated:YES completion:nil];
}

#pragma mark Actions

- (void)dismissGallery:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)thumbnailTapGestureRecognized:(UIGestureRecognizer*)gestureRecognizer
{
    UIView *imageView = gestureRecognizer.view;
    NSUInteger index = [self.imageViews indexOfObject:imageView];
    [self presentGalleryWithImageAtIndex:index];
}

#pragma mark UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    RMGalleryTransition *transition = [RMGalleryTransition new];
    transition.delegate = self;
    return transition;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    RMGalleryTransition *transition = [RMGalleryTransition new];
    transition.delegate = self;
    return transition;
}

#pragma mark RMGalleryTransitionDelegate

- (UIImageView*)galleryTransition:(RMGalleryTransition*)transition transitionImageViewForIndex:(NSUInteger)index
{
    return self.imageViews[index];
}

- (CGSize)galleryTransition:(RMGalleryTransition*)transition estimatedSizeForIndex:(NSUInteger)index
{ // If the transition image is different than the one displayed in the gallery we need to provide its size
    UIImageView *imageView = self.imageViews[index];
    const CGSize thumbnailSize = imageView.image.size;
    
    // In this example the final images are about 25 times bigger than the thumbnail
    const CGSize estimatedSize = CGSizeMake(thumbnailSize.width * 25, thumbnailSize.height * 25);
    return estimatedSize;
}

@end
