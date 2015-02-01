//
//  NWImageCache.m
//  News
//
//  Created by Michel de Sousa Carvalho on 02/12/14.
//  Copyright (c) 2014 Michel de Sousa Carvalho. All rights reserved.
//

#import "NWImageCache.h"

@implementation NWImageCache

static NWImageCache *sharedInstance;



+(NWImageCache *)sharedInstance
{
    if(!sharedInstance){
        sharedInstance = [[super allocWithZone:nil] init];
    }
    return sharedInstance;
}

+(id)allocWithZone:(struct _NSZone *)zone
{
    return [NWImageCache sharedInstance];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.imageRequest = [[NWImageRequest alloc] init];
    }
    return self;
}

@end
