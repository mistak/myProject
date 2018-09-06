//
//  FontTool.m
//  GrowAlong
//
//  Created by mistak on 2018/8/7.
//  Copyright © 2018年 no. All rights reserved.
//

#import "FontTool.h"

@implementation FontTool

+ (UIFont *)fontWithSize:(CGFloat)size
{
    return [UIFont systemFontOfSize:size];
}

+ (UIFont *)boldFontWithSize:(CGFloat)size
{
    return [UIFont boldSystemFontOfSize:size];
}

@end
