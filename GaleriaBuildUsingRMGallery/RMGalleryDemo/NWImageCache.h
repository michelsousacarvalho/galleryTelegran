//
//  NWImageCache.h
//  News
//
//  Created by Michel de Sousa Carvalho on 02/12/14.
//  Copyright (c) 2014 Michel de Sousa Carvalho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NWImageRequest.h"


@interface NWImageCache : NSObject

+(NWImageCache *) sharedInstance;

@property(nonatomic, strong) NWImageRequest *imageRequest;

@end
