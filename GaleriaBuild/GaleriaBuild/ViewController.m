//
//  ViewController.m
//  GaleriaBuild
//
//  Created by Michel de Sousa Carvalho on 31/01/15.
//  Copyright (c) 2015 Michel de Sousa Carvalho. All rights reserved.
//

#import "ViewController.h"
#import "NWImageCache.h"
#import "GBCollectionViewCell.h"

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) NSMutableArray *urlsPhotos;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.urlsPhotos  = [[NSMutableArray alloc] init];
    [self.urlsPhotos addObject:@"http://s2.glbimg.com/5vNTs5PfL4Z0AiMhc_wMZiRz1TU=/90x68/s.glbimg.com/jo/g1/f/original/2015/01/19/acidente_fatal_trevo_de_perdizes_homem_de_29_anos.16-01-1.jpg"];
    [self.urlsPhotos addObject:@"http://s2.glbimg.com/K4ApGSfN_qcJnHVR1yui5Y5Z-tY=/90x68/s.glbimg.com/jo/g1/f/original/2015/01/19/detento.jpg"];
    [self.urlsPhotos addObject:@"http://s2.glbimg.com/ZGUwiIcYaf5eJpiqbDsQdxaQrRE=/90x68/s.glbimg.com/jo/g1/f/original/2015/01/19/raiva.jpg"];
    [self.urlsPhotos addObject:@"http://s2.glbimg.com/kVx8OrhMdxVM_HQZT8jdcT3aADc=/90x68/s.glbimg.com/jo/g1/f/original/2015/01/17/imagem_de_sao_sebastiao_igreja_de_sao_sebastiao_juiz_de_fora_2.jpg"];
    [self.urlsPhotos addObject:@"http://s2.glbimg.com/slE90JQotBLILb55gajkV8aEoqo=/90x68/s.glbimg.com/jo/g1/f/original/2015/01/19/coach.jpg"];
    [self.urlsPhotos addObject:@"http://s2.glbimg.com/bFzjr2Ddft0OLRh8ATJfIKoNImY=/90x68/s.glbimg.com/jo/g1/f/original/2015/01/19/620_01.jpg"];

    
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.urlsPhotos.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *identifier = @"cell";
    
    GBCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];

    NWImageCache *imageCache = [NWImageCache sharedInstance];
    
    [imageCache.imageRequest fetchImageWithUrl:[self.urlsPhotos objectAtIndex:indexPath.row] andNameImage:[self.urlsPhotos objectAtIndex:indexPath.row] withcompletionBlock:^(UIImage *image) {
        cell.photo.image = image;
    }];
    return cell;

    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
