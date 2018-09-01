//
//  MViewGenerater.h
//  ClientC
//
//  Created by Crazy on 2018/8/9.
//  Copyright © 2018年 no. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, MLineType) {
    MLineTypeThin = 0,  //  0.5
    MLineTypeBold,  //  1
};

typedef NS_ENUM(NSInteger, MLineStyle) {
    MLineStyleVertical = 0,
    MLineStyleHorizontal
};

typedef NS_ENUM(NSInteger, MLineColorType) {
    MLineColorTypeNormal = 0,
};

@interface MViewGenerater : NSObject

@end


@interface MViewGenerater(View)

+ (MView *)verticalLineView;

+ (MView *)horizontalLineView;

+ (MView *)lineViewWithLineType:(MLineType)lineType
                      lineStyle:(MLineStyle)lineStyle
                      colorType:(MLineColorType)colorType;

@end

@interface MViewGenerater(Button)

+ (MButton *)buttonWithTitle:(NSString *)title
                       image:(UIImage *)image
               imagePosition:(QMUIButtonImagePosition)imagePosition
             imageTitleSpace:(CGFloat)imageTitleSpace
                  titleColor:(UIColor *)titleColor
             backgroundColor:(UIColor *)backgroundColor
                    fontSize:(CGFloat)fontSize;

+ (MButton *)buttonWithTitle:(NSString *)title
                  titleColor:(UIColor *)titleColor
             backgroundColor:(UIColor *)backgroundColor
                    fontSize:(CGFloat)fontSize;

+ (MButton *)buttonWithImage:(UIImage *)image
                  titleColor:(UIColor *)titleColor
                    fontSize:(CGFloat)fontSize;

@end

@interface MViewGenerater(Label)

+ (MLabel *)labelWithTitle:(NSString *)title
                titleColor:(UIColor *)titleColor
           backgroundColor:(UIColor *)backgroundColor
                  fontSize:(CGFloat)fontSize;

@end
