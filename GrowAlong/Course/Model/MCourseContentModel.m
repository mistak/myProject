//
//  MCourseModel.m
//  GrowAlong
//
//  Created by 刘斌 on 2018/9/19.
//  Copyright © 2018年 no. All rights reserved.
//

#import "MCourseContentModel.h"

@implementation MCourseContentModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"contentId" : @"id"};
}

- (void)setType:(NSString *)type
{
    _type = type;
    
    _courseType = MCourseContentTypeFile;
}

@end
