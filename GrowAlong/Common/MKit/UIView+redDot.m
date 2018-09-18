//
//  UIView+redDot.m
//  GrowAlong
//
//  Created by 刘斌 on 2018/9/18.
//  Copyright © 2018年 no. All rights reserved.
//

#import "UIView+redDot.h"

static NSUInteger const kRedDotTag = 1314;

@implementation UIView (redDot)

- (void)showRedDotWithFrame:(CGRect)frame
                  numString:(NSString *)numString
{
    MLabel * redDotView = [self redDotView];
    redDotView.frame = frame;
    if (!redDotView)
    {
        redDotView = [[MLabel alloc] initWithFrame:frame];
        redDotView.textAlignment = NSTextAlignmentCenter;
        redDotView.textColor = [UIColor whiteColor];
        [self addSubview:redDotView];
    }
    
    redDotView.layer.cornerRadius = CGRectGetHeight(frame)/2;
    redDotView.layer.masksToBounds = YES;
    redDotView.backgroundColor = [UIColor redColor];
    redDotView.text = numString;
}

- (MLabel *)redDotView
{
    MLabel * redDot = [self viewWithTag:kRedDotTag];
    
    return redDot;
}

- (void)hideRedDot
{
    MLabel * redDotView = [self redDotView];
    
    if (redDotView)
    {
        [redDotView removeFromSuperview];
    }
}

@end
