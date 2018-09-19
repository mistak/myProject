//
//  MCourseModel.m
//  GrowAlong
//
//  Created by 刘斌 on 2018/9/19.
//  Copyright © 2018年 no. All rights reserved.
//

#import "MCourseModel.h"

@implementation MCourseModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"contentId" : @"id",
             @"desc"      : @"description"
             };
}


@end
