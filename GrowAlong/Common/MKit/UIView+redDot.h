//
//  UIView+redDot.h
//  GrowAlong
//
//  Created by 刘斌 on 2018/9/18.
//  Copyright © 2018年 no. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (redDot)

- (void)showRedDotWithFrame:(CGRect)frame
                  numString:(nullable NSString *)numString;

- (void)hideRedDot;

@end
