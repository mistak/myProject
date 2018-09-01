//
//  MViewGenerater.m
//  ClientC
//
//  Created by Crazy on 2018/8/9.
//  Copyright © 2018年 no. All rights reserved.
//

#import "MViewGenerater.h"

@implementation MViewGenerater


@end

@implementation MViewGenerater(View)

+ (MView *)verticalLineView
{
    return [self lineViewWithLineType:MLineTypeThin lineStyle:MLineStyleVertical colorType:MLineColorTypeNormal];
}

+ (MView *)horizontalLineView
{
    return [self lineViewWithLineType:MLineTypeThin lineStyle:MLineStyleHorizontal colorType:MLineColorTypeNormal];
}

+ (MView *)lineViewWithLineType:(MLineType)lineType
                      lineStyle:(MLineStyle)lineStyle
                      colorType:(MLineColorType)colorType
{
    CGFloat lineHeight = [self lineHeightForLineType:lineType];
    UIColor * lineColor = [self lineHeightForColorType:colorType];
    
    MView * lineView = [[MView alloc] init];
    
    lineView.backgroundColor = lineColor;
    if (lineStyle == MLineStyleHorizontal)
    {
        lineView.height = lineHeight;
    }
    else if (lineStyle == MLineStyleVertical)
    {
        lineView.width = lineHeight;
    }
    return lineView;
    
}

+ (CGFloat)lineHeightForLineType:(MLineType)lineType
{
    CGFloat lineHeight = 0;
    switch (lineType)
    {
        case MLineTypeThin:
            lineHeight = 0.5;
            break;
        case MLineTypeBold:
            lineHeight = 1;
            break;
    }
    return lineHeight;
}

+ (UIColor *)lineHeightForColorType:(MLineColorType)colorType
{
    UIColor * color = nil;
    switch (colorType)
    {
        case MLineColorTypeNormal:
            color = HexColor(0xe6e6e6);
            break;
    }
    return color;
}

@end

@implementation MViewGenerater(Button)

+ (MButton *)buttonWithTitle:(NSString *)title
                       image:(UIImage *)image
               imagePosition:(QMUIButtonImagePosition)imagePosition
             imageTitleSpace:(CGFloat)imageTitleSpace
                  titleColor:(UIColor *)titleColor
             backgroundColor:(UIColor *)backgroundColor
                    fontSize:(CGFloat)fontSize
{
    MButton * button = [MButton buttonWithType:UIButtonTypeCustom];
    
    if (isNotEmpty(title))
    {
        [button setTitle:title forState:UIControlStateNormal];
    }
    if (isNotEmpty(image))
    {
        [button setImage:image forState:UIControlStateNormal];
    }
    if (isNotEmpty(titleColor))
    {
        [button setTitleColor:titleColor forState:UIControlStateNormal];
    }
    if (isNotEmpty(backgroundColor))
    {
        [button setBackgroundColor:backgroundColor];
    }
    if (fontSize > 0)
    {
        [button.titleLabel setFont:FONT(fontSize)];
    }
    
    [button setSpacingBetweenImageAndTitle:imageTitleSpace];
    [button setImagePosition:imagePosition];
    
    return button;
}

+ (MButton *)buttonWithTitle:(NSString *)title
                  titleColor:(UIColor *)titleColor
             backgroundColor:(UIColor *)backgroundColor
                    fontSize:(CGFloat)fontSize
{
    return [self buttonWithTitle:title
                           image:nil
                   imagePosition:QMUIButtonImagePositionLeft
                 imageTitleSpace:0
                      titleColor:titleColor
                 backgroundColor:backgroundColor
                        fontSize:fontSize];
}

+ (MButton *)buttonWithImage:(UIImage *)image
                  titleColor:(UIColor *)titleColor
                    fontSize:(CGFloat)fontSize
{
    return [self buttonWithTitle:nil
                           image:image
                   imagePosition:QMUIButtonImagePositionLeft
                 imageTitleSpace:0
                      titleColor:nil
                 backgroundColor:nil
                        fontSize:0];
}

@end

@implementation MViewGenerater(Label)

+ (MLabel *)labelWithTitle:(NSString *)title
                titleColor:(UIColor *)titleColor
           backgroundColor:(UIColor *)backgroundColor
                  fontSize:(CGFloat)fontSize
{
    MLabel * label = [[MLabel alloc] init];
    label.text = title;
    if (isNotEmpty(titleColor))
    {
        label.textColor = titleColor;
    }
    if (isNotEmpty(backgroundColor))
    {
        label.backgroundColor = backgroundColor;
    }
    if (fontSize > 0)
    {
        label.font = FONT(fontSize);
    }
    
    return label;
}

@end
