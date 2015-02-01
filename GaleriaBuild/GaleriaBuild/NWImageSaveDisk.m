//
//  NWImageSaveDisk.m
//  News
//
//  Created by Michel de Sousa Carvalho on 02/12/14.
//  Copyright (c) 2014 Michel de Sousa Carvalho. All rights reserved.
//

#import "NWImageSaveDisk.h"

@implementation NWImageSaveDisk

+(NSString *)filePathForImage:(NSString *)nameImage
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [[[documentsDirectory stringByAppendingString:@"/"] stringByAppendingString:nameImage] stringByAppendingString:@".jpg"];
    return filePath;
}


+(NSData*) getImageByName:(NSString*) nameImage{
    return [NSData dataWithContentsOfFile:nameImage];
}


+(BOOL)imageExistsAtPath:(NSString *)pathImage
{
     if(![[NSFileManager defaultManager] fileExistsAtPath:pathImage]){
         return false;
     } else {
         return true;
     }
    
}

+(void)saveImageDisk:(NSData *)imageData andName:(NSString *)nameImage
{
    [imageData writeToFile:nameImage atomically:YES];
    
}




@end
