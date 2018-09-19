//
//  MBaseRequest.m
//  GrowAlong
//
//  Created by 李佳群 on 2018/9/8.
//  Copyright © 2018年 no. All rights reserved.
//

#import "MBaseRequest.h"
#import <YTKNetwork/YTKNetwork.h>
#import <YYKit/NSObject+YYModel.h>

@interface MBaseRequest ()

@property (nonatomic, strong, readwrite) NSError *error;

@end

@implementation MBaseRequest

- (instancetype)init
{
    self = [super init];
    if (self) {
        _enableLog = YES;
    }
    return self;
}

- (void)start {
    self.error = nil;
    
    [super start];
}

- (void)startWithCompletionBlockWithSuccess:(MRequestCompletionBlock)success
                                    failure:(MRequestCompletionBlock)failure {
    [super startWithCompletionBlockWithSuccess:success failure:failure];
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

- (YTKRequestSerializerType)requestSerializerType {
    return YTKRequestSerializerTypeJSON;
}

- (NSDictionary *)requestHeaderFieldValueDictionary {
    NSMutableDictionary *dict = @{@"User-Agent" : @""};
    if (self.ipHost) {
        [dict setObject:self.ipHost forKey:@"Host"];
    }
    
    return dict;
}


- (id)requestArgument {
    return [self assemblyParameters:[self requestArgumentsWithoutProcessing]];
}


//- (NSString *)requestUrl {
//    NSString *host = nil;
////    NSString *baseURLString = [QLInitParamsManager sharedManager].ql_api_url;
////    baseURLString = [QLHttpDNSHelper convertURLStringByClientInitParamsAsync:baseURLString host:&host];
////    if (host) {
////        _ipHost = host.copy;
////    }
////    return [NSURL URLWithString:[self requestUrlWithoutProcessing] relativeToURL:[NSURL URLWithString:baseURLString]].absoluteString;
//    return nil;
//}


- (NSString *)requestUrlWithoutProcessing {
    return nil;
}

- (id)requestArgumentsWithoutProcessing {
    return [NSMutableDictionary new];
}

- (void)requestEverythingIsDone {
    
}


- (void)toggleAccessoriesDidStopCallBack {
    for (id<YTKRequestAccessory> accessory in self.requestAccessories) {
        if ([accessory respondsToSelector:@selector(requestDidStop:)]) {
            [accessory requestDidStop:self];
        }
    }
    
    [self requestEverythingIsDone];
}


- (NSString *)cacheFileName {
    NSString *requestUrl = [self requestUrlWithoutProcessing];
    NSString *baseUrl = [YTKNetworkConfig sharedConfig].baseUrl;
    id argument = [self cacheFileNameFilterForRequestArgument:[self requestArgumentsWithoutProcessing]];
    NSString *requestInfo = [NSString stringWithFormat:@"Method:%ld Host:%@ Url:%@ Argument:%@",
                             (long)[self requestMethod], baseUrl, requestUrl, argument];
    NSString *cacheFileName = [requestInfo md5String];
    return cacheFileName;
}


- (Class)responseClass {
    return NULL;
}


- (id)parse {
    Class responseClass = [self responseClass];
    id data = [self responseJSONObjectForParse];
    if (responseClass) {
        if ([data isKindOfClass:[NSArray class]]) {
            return [NSArray modelArrayWithClass:responseClass json:data];
        }else {
            return [responseClass modelWithJSON:data];
        }
    }else {
        return data;
    }
}


- (id)responseJSONObjectForParse {
    return self.responseJSONObject[@"data"];
}

- (BOOL)statusCodeValidator {
//    NSDictionary *state = self.responseJSONObject[@"state"];
    return YES;
}


- (void)requestFailedPreprocessor {
    [super requestFailedPreprocessor];
    NSError *error = self.error;
    //如果是 YTKRequestValidationErrorInvalidStatusCode 则使用自定义的 error
    if (!([error.domain isEqualToString:YTKRequestValidationErrorDomain] &&
          error.code == YTKRequestValidationErrorInvalidStatusCode)) {
        
    }else {
        
        NSNumber *statusCode = nil;
        NSString *msg = nil;
        NSString *description = nil;
        NSUInteger code = -1;
        
        id data = self.responseJSONObject[@"data"];
        
        if (isNotEmpty(data) && [data isKindOfClass:[NSDictionary class]])  {
            statusCode = data[@"code"];
        }
        
        if (isNotEmpty(statusCode)) {
            description = data[@"msg"];
            statusCode = data[@"code"];
        }else {
            NSDictionary *state = self.responseJSONObject[@"state"];
            if (isNotEmpty(state) && [state isKindOfClass:[NSDictionary class]]) {
                statusCode = state[@"code"];
                msg = state[@"msg"];
                description = msg ? : @"invalid msg";
            }
        }
        
        code = statusCode.integerValue;
        NSDictionary *userinfo = nil;
        if (description) {
            userinfo = [NSDictionary dictionaryWithObject:description
                                                   forKey:NSLocalizedDescriptionKey];
        }
        self.error = [NSError errorWithDomain:@"growAlong"
                                         code:code
                                     userInfo:userinfo];
        
        
    }
    
    [self printLog];
}


static NSUInteger errorLogCount;

/**
 限制错误日志次数
 */
- (void)printLog {
    if (!_enableLog) { return; };
    
#ifndef DEBUG
#else
#endif
    
}


- (NSDictionary *)assemblyParameters:(id)parameters {
    id dataNew = nil;
    if ([parameters isKindOfClass:[NSDictionary class]]) {
        NSMutableDictionary *data = [(NSDictionary *)parameters mutableCopy];

        id pageSize = parameters[@"pageSize"];
        id page = parameters[@"page"];
        if (!page) {
            page = @"1";
        }
        if (pageSize && page) {
            NSMutableDictionary *pageParas = [NSMutableDictionary dictionaryWithCapacity:2];
            pageParas[@"page"] = page;
            pageParas[@"size"] = pageSize;
            [data removeObjectForKey:@"pageSize"];

            data[@"page"] = pageParas;
        }else if (pageSize) {
            NSMutableDictionary *pageParas = [NSMutableDictionary dictionaryWithCapacity:2];
            pageParas[@"size"] = pageSize;
            [data removeObjectForKey:@"pageSize"];

            data[@"page"] = pageParas;
        }

        dataNew = data;
    }else {
        dataNew = parameters;
    }
//
//
    NSString *privateKey = nil;
//    if (DEFAULTS.g_ApiVersion == ApiVersionTypeRelease ||
//        DEFAULTS.g_ApiVersion == ApiVersionTypeABTest) {
//        privateKey = @"11fc842697eb4f5561c05f6cec82536b";
//    }else {
//        privateKey = @"846d2cb0c7f09c3ae802c42169a6302b";
//    }
//
    int64_t timestamp = [[NSDate date] timeIntervalSince1970] * 1000;
    NSString *timestampString = @(timestamp).stringValue;
    NSString *requestID = [NSString stringWithFormat:@"%@%d%d%d", timestampString, arc4random_uniform(10), arc4random_uniform(10), arc4random_uniform(10)];
    NSString *sign = [[NSString stringWithFormat:@"%@:%@:%@", requestID, privateKey, timestampString] md5String];
//
    NSMutableDictionary *endParas = [NSMutableDictionary new];
//
//    NSString *sid = [QLUserAccountDatabaseManager sharedManager].sid;
//    NSString *userId = [QLUserAccountDatabaseManager sharedManager].userId;
//    if (sid && userId) {
//        endParas[@"user"] = @{@"sid" : sid, @"userId" : userId};
//    }
//
//    NSDictionary *client = [QLClientInfoManager clientInfo];`
//
//    if (client) {
//        endParas[@"client"] = client;
//    }
//    if (dataNew) {
//        endParas[@"data"] = dataNew;
//    }
//    if (requestID) {
//        endParas[@"id"] = requestID;
//    }
//    if (sign) {
//        endParas[@"sign"] = sign;
//    }
//    if (timestampString) {
//        endParas[@"timestamp"] = timestampString;
//    }
//
    return endParas;
}


@end
