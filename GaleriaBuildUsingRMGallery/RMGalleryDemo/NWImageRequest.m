//
//  NWImageRequest.m
//  News
//
//  Created by Michel de Sousa Carvalho on 02/12/14.
//  Copyright (c) 2014 Michel de Sousa Carvalho. All rights reserved.
//

#import "NWImageRequest.h"
#import "NWImageCache.h"
#import "NWImageSaveDisk.h"

@interface NWImageRequest()




@end

@implementation NWImageRequest

-(id) init
{
    self = [super init];
    if(self)
    {
        self.imagesCache = [[NSMutableDictionary alloc] init];
        self.operationCache = [[NSMutableDictionary alloc] init];
        self.queue = [[NSOperationQueue alloc]init];
    }
    return self;
}

-(void) fetchImageWithUrl:(NSString *)url andNameImage:(NSString*)nameImage withcompletionBlock:(NWImageRequestBlock)completionBlock
{
    
//    NSLog(@"%@", url);
    UIImage *imageOfCache = self.imagesCache[nameImage];
    if(imageOfCache) {
        completionBlock(imageOfCache);
    } else {
        NSBlockOperation *retrievalBlock = [[NSBlockOperation alloc] init];
        __weak NSBlockOperation *weakOperation = retrievalBlock;
        [retrievalBlock addExecutionBlock:^{
            NSString *pathImage = [NWImageSaveDisk filePathForImage:nameImage];
            NSData *imageData;
            UIImage *image;
            // se não existir imagem no device realizar request e armazenar imagem
            if(![NWImageSaveDisk imageExistsAtPath:pathImage]){
                NSURL *urlImage = [NSURL URLWithString:url];
                imageData = [NSData dataWithContentsOfURL:urlImage];
                if(imageData) {
                    [NWImageSaveDisk saveImageDisk:imageData andName:pathImage];
                   
                }
                image = [UIImage imageWithData:imageData];
            } else {
                imageData = [NWImageSaveDisk getImageByName:pathImage];
                image = [UIImage imageWithData:imageData];
            }
            if(image) {
                [self.imagesCache setObject:image forKey:nameImage];
            }
            if(![weakOperation isCancelled]){
                NSBlockOperation *block = [[NSBlockOperation alloc] init];
                [block addExecutionBlock:^{
                    completionBlock(image);
                }];
                [[NSOperationQueue mainQueue] addOperation:block];
            }
        }];
        if(retrievalBlock && url){
            [self.operationCache setObject:retrievalBlock forKey:url];
            [self.queue addOperation:retrievalBlock];
        }
    }
}


-(void)cancelImageDownloadWithURL:(NSString *)url withCompletionBlock:(void (^)(void))completionBlock
{
    NSBlockOperation *blockOperation = self.operationCache[url];
    if(blockOperation){
        [blockOperation cancel];
        completionBlock();
    }
}
@end
