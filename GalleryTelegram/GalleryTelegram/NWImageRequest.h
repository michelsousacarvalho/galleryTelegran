//
//  NWImageRequest.h
//  News
//
//  Created by Michel de Sousa Carvalho on 02/12/14.
//  Copyright (c) 2014 Michel de Sousa Carvalho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^NWImageRequestBlock)(UIImage* image);



@interface NWImageRequest : NSObject

@property (nonatomic, strong) NSMutableDictionary *imagesCache;
@property (nonatomic, strong) NSMutableDictionary *operationCache;
@property (nonatomic, strong) NSOperationQueue *queue;

-(void) fetchImageWithUrl:(NSString *)url andNameImage:(NSString*)nameImage withcompletionBlock:(NWImageRequestBlock)completionBlock;
-(void) cancelImageDownloadWithURL:(NSString *)url withCompletionBlock:(void (^)(void))completionBlock;


@end
