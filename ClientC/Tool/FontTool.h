//
//  FontTool.h
//  ClientC
//
//  Created by mistak on 2018/8/7.
//  Copyright © 2018年 no. All rights reserved.
//

#import <Foundation/Foundation.h>

#define FONT(x) [FontTool fontWithSize:x]
#define FONT_B(x) [FontTool boldFontWithSize:x]

@interface FontTool : NSObject

+ (UIFont *)fontWithSize:(CGFloat)size;

+ (UIFont *)boldFontWithSize:(CGFloat)size;

@end
