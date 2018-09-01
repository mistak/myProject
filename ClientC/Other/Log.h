//
//  Log.h
//  ClientC
//
//  Created by mistak on 2018/8/7.
//  Copyright © 2018年 no. All rights reserved.
//

#ifndef Log_h
#define Log_h


//定义日志级别
#ifdef DEBUG
static const DDLogLevel ddLogLevel = DDLogLevelVerbose;
#else
static const DDLogLevel ddLogLevel = DDLogLevelError;
#endif

#define DDNSLog(...)                     DDLogDebug(__VA_ARGS__);
#define DDNSLogMethod                    DDNSLog(@"[%@ %@]", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#define DDNSLogCGPoint(description, p)   DDNSLog(@"%@: %@", description, NSStringFromCGPoint(p));
#define DDNSLogCGSize(description, p)    DDNSLog(@"%@: %@", description, NSStringFromCGSize(p));
#define DDNSLogCGRect(description, p)    DDNSLog(@"%@: %@", description, NSStringFromCGRect(p));
#define DDNSLogRange(description, p)     DDNSLog(@"%@: %@", description, NSStringFromRange(p));

//-------------------------- LOG ----------------------------//
//根据级别 选择合适的 LOG , 错误 一定选择 QLLogError
#define LogError(fmt, ...)    DDLogError(fmt, ##__VA_ARGS__);
#define LogWarn(fmt, ...)     DDLogWarn(fmt, ##__VA_ARGS__);
#define LogInfo(fmt, ...)     DDLogInfo(fmt, ##__VA_ARGS__);
#define LogDebug(fmt, ...)    DDLogDebug(fmt, ##__VA_ARGS__);
#define LogVerbose(fmt, ...)  DDLogVerbose(fmt, ##__VA_ARGS__);


#endif /* Log_h */
