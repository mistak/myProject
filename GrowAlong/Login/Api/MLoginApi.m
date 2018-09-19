//
//  MLoginApi.m
//  GrowAlong
//
//  Created by 李佳群 on 2018/9/17.
//  Copyright © 2018年 no. All rights reserved.
//

#import "MLoginApi.h"

@implementation MLoginApi
{
    NSString * _mobile;
    NSString * _password;
    NSString * _type;
}

- (instancetype)initWithMobile:(NSString *)mobile
                      passWord:(NSString *)password
                          type:(NSString *)type
{
    self = [super init];
    if (self)
    {
        _mobile = mobile;
        _password = password;
        _type = type;
    }
    return self;
}

- (NSString *)requestUrl
{
    return @"/v1/common/login.do";
}

- (YTKRequestMethod)requestMethod
{
    return YTKRequestMethodPOST;
}

- (id)requestArgumentsWithoutProcessing
{
    NSMutableDictionary *args = [super requestArgumentsWithoutProcessing];
    
    args[@"mobile"] = _mobile;
    args[@"password"] = _password;
    args[@"type"] = _type;
    
    return args;
}

- (Class)responseClass
{
    return [MUserInfoModel class];
}

- (id)responseJSONObjectForParse
{
    return [super responseJSONObjectForParse][@"user"];
}

@end
