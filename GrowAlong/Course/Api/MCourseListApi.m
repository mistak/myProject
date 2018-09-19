//
//  MCourseListApi.m
//  GrowAlong
//
//  Created by 刘斌 on 2018/9/19.
//  Copyright © 2018年 no. All rights reserved.
//

#import "MCourseListApi.h"

@implementation MCourseListApi
{
    MCourseStage _status;
}

- (instancetype)initWithStatus:(MCourseStage)status
{
    self = [super init];
    if (self)
    {
        _status = status;
    }
    return self;
}

- (NSString *)requestUrl
{
    return @"/v1/user/getMyCourse.do";
}

- (Class)responseClass
{
    return [MCourseModel class];
}

- (id)responseJSONObjectForParse
{
    return [super responseJSONObjectForParse][@"dataList"];
}

@end
