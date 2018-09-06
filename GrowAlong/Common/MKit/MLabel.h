//
//  MLabel.h
//  GrowAlong
//
//  Created by mistak on 2018/8/7.
//  Copyright © 2018年 no. All rights reserved.
//

#import "QMUILabel.h"

@interface MLabel : QMUILabel

@end

@interface MLabel(generate)

+ (MLabel *)labelWithTitle:(NSString *)title
                titleColor:(UIColor *)titleColor
                  fontSize:(CGFloat)fontSize;



@end
