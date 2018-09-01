//
//  ColorTool.h
//  ClientC
//
//  Created by Crazy on 2018/8/11.
//  Copyright © 2018年 no. All rights reserved.
//

#import <Foundation/Foundation.h>

#define HexColor(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:1]

#define MThemecolor [ColorTool themeColor]
#define MShallowGrayColor [ColorTool shallowGrayColor]
#define MDeepGrayColor [ColorTool deepGrayColor]

@interface ColorTool : NSObject

+ (UIColor *)themeColor;

+ (UIColor *)shallowGrayColor;

+ (UIColor *)deepGrayColor;

@end
