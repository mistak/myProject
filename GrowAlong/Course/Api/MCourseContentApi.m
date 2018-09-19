//
//  MCourseListApi.m
//  GrowAlong
//
//  Created by 刘斌 on 2018/9/19.
//  Copyright © 2018年 no. All rights reserved.
//

#import "MCourseContentApi.h"

@implementation MCourseContentApi
{
    NSString * _userId;
    NSString * _courseId;
}

- (instancetype)initWithUserId:(NSString *)userId
                      courseId:(NSString *)courseId
{
    self = [super init];
    if (self)
    {
        _userId = userId;
        _courseId = courseId;
    }
    return self;
}

- (id)requestArgumentsWithoutProcessing
{
    NSMutableDictionary *args = [super requestArgumentsWithoutProcessing];
    
    args[@"userId"] = _userId;
    args[@"courseId"] = _courseId;
    
    return args;
}

- (NSString *)requestUrl
{
    return @"/v1/user/getMyCouseMaterial.do";
}

- (Class)responseClass
{
    return [MCourseContentModel class];
}

- (id)responseJSONObjectForParse
{
    return [super responseJSONObjectForParse][@"dataList"];
}

@end
