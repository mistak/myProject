//
//  MLoginApi.h
//  GrowAlong
//
//  Created by 李佳群 on 2018/9/17.
//  Copyright © 2018年 no. All rights reserved.
//

#import "MBaseRequest.h"

#import "MUserInfoModel.h"

@interface MLoginApi : MBaseRequest

//  type c： C端， b： B端
- (instancetype)initWithMobile:(NSString *)mobile
                      passWord:(NSString *)password
                          type:(NSString *)type;

@end
