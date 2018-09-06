//
//  ImageTool.m
//  GrowAlong
//
//  Created by mistak on 2018/8/7.
//  Copyright © 2018年 no. All rights reserved.
//

#import "ImageTool.h"

@implementation ImageTool

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static ImageTool *instance = nil;
    dispatch_once(&onceToken,^{
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedInstance];
}


- (UIImage *)imageWithName:(NSString *)imageName
{
    if (isEmpty(imageName))
    {
        return nil;
    }
    return [UIImage imageNamed:imageName];
}

@end
