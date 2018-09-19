//
//  MFileManager.m
//  GrowAlong
//
//  Created by 刘斌 on 2018/9/19.
//  Copyright © 2018年 no. All rights reserved.
//

#import "MFileManager.h"

static NSString * const kUserPath = @"user";
static NSString * const kFilePath = @"file";

@implementation MFileManager

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static MFileManager *instance = nil;
    dispatch_once(&onceToken,^{
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedInstance];
}

- (NSString *)documentPath
{
    NSString *path =   [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) objectAtIndex:0];
    NSString * userPath = [path stringByAppendingPathComponent:kUserPath];
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        BOOL isDir = NO;
        BOOL existed = [fileManager fileExistsAtPath:userPath isDirectory:&isDir];
        if (!isDir || !existed) {
            [fileManager createDirectoryAtPath:userPath withIntermediateDirectories:YES attributes:nil error:nil];
        }
    });
   
    return userPath;
}

- (NSString *)cachePath
{
    NSString *path =   [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES) objectAtIndex:0];
    NSString * cachePath = [path stringByAppendingPathComponent:kFilePath];
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        BOOL isDir = NO;
        BOOL existed = [fileManager fileExistsAtPath:cachePath isDirectory:&isDir];
        if (!isDir || !existed) {
            [fileManager createDirectoryAtPath:cachePath withIntermediateDirectories:YES attributes:nil error:nil];
        }
    });

    return cachePath;
}

@end
