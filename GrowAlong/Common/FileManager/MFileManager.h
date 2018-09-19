//
//  MFileManager.h
//  GrowAlong
//
//  Created by 刘斌 on 2018/9/19.
//  Copyright © 2018年 no. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MFileManager : NSObject

+ (instancetype)sharedInstance;

- (NSString *)documentPath;

- (NSString *)cachePath;

@end
