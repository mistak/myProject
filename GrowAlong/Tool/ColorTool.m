//
//  ColorTool.m
//  GrowAlong
//
//  Created by Crazy on 2018/8/11.
//  Copyright © 2018年 no. All rights reserved.
//

#import "ColorTool.h"

@implementation ColorTool

+ (UIColor *)themeColor
{
    return HexColor(0x51c930);
}

+ (UIColor *)shallowGrayColor
{
    return HexColor(0xb3b3b3);
}

+ (UIColor *)deepGrayColor
{
    return HexColor(0x737373);
}

@end
