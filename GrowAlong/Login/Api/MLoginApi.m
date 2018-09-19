//
//  MLoginApi.m
//  GrowAlong
//
//  Created by 李佳群 on 2018/9/17.
//  Copyright © 2018年 no. All rights reserved.
//

#import "MLoginApi.h"

@implementation MLoginApi

- (NSString *)requestUrl
{
    return @"geograph/province";
}

- (YTKRequestMethod)requestMethod
{
    return YTKRequestMethodPOST;
}

@end
