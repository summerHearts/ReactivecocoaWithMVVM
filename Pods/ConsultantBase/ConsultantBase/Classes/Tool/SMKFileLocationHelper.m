//
//  SMKFileLocationHelper.m
//  SMKKit
//
//  Created by Kenvin on 15/4/12.
//  Copyright (c) 2015年 Kenvin. All rights reserved.
//

#import "SMKFileLocationHelper.h"
#import <sys/stat.h>

#define RDVideo    (@"video")
#define RDImage    (@"image")

@interface SMKFileLocationHelper ()

@end


@implementation SMKFileLocationHelper

+ (BOOL)addSkipBackupAttributeToItemAtURL:(NSURL *)URL{
    assert([[NSFileManager defaultManager] fileExistsAtPath: [URL path]]);
    
    
    NSError *error = nil;
    BOOL success = [URL setResourceValue:@(YES)
                                  forKey:NSURLIsExcludedFromBackupKey
                                   error:&error];
    if(!success){
    }
    return success;
    
}
+ (NSString *)getAppDocumentPath{
    static NSString *appDocumentPath = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *appKey =@"asdfasf";
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        appDocumentPath= [[NSString alloc]initWithFormat:@"%@/%@/",[paths objectAtIndex:0],appKey];
        if (![[NSFileManager defaultManager] fileExistsAtPath:appDocumentPath]){
            [[NSFileManager defaultManager] createDirectoryAtPath:appDocumentPath
                                      withIntermediateDirectories:NO
                                                       attributes:nil
                                                            error:nil];
        }
        [SMKFileLocationHelper addSkipBackupAttributeToItemAtURL:[NSURL fileURLWithPath:appDocumentPath]];
    });
    return appDocumentPath;
    
}

+ (NSString *)getAppTempPath{
    return NSTemporaryDirectory();
}

@end
