//
//  MBaseRequest.h
//  GrowAlong
//
//  Created by 李佳群 on 2018/9/8.
//  Copyright © 2018年 no. All rights reserved.
//

#import "YTKRequest.h"

@class MBaseRequest;

typedef void(^MRequestCompletionBlock)(__kindof MBaseRequest *request);

@interface MBaseRequest : YTKRequest

/**
 默认为 YES，也就是打印 log
 */
@property(nonatomic, assign) BOOL enableLog;

/**
 如果使用了 http dns 则这里会有解析后的 host
 */
@property (nonatomic, readonly) NSString *ipHost;


- (void)startWithCompletionBlockWithSuccess:(MRequestCompletionBlock)success
                                    failure:(MRequestCompletionBlock)failure;

/**
 需要 override
 
 使用这个来提交参数，requestArgument 时会进行组装
 
 @return 默认会返回一个空的可变字典
 */
- (id)requestArgumentsWithoutProcessing;

/**
 需要 override
 
 requestUrl
 
 @return 真正实现 requestUrl 时会加上 HttpDNS
 */
- (NSString *)requestUrlWithoutProcessing;


/**
 所有事情都处理完成会执行这个方法，这个方法是请求完成后最后的执行的方法
 */
- (void)requestEverythingIsDone NS_REQUIRES_SUPER;


/**
 需要 override
 
 @return parse 方法解析的 class
 */
- (Class)responseClass;

/**
 默认根据 responseClass 解析
 必要时可以 override
 @return model 或者 array<typeof(model)>
 */
- (id)parse;


- (id)responseJSONObjectForParse;


@end
