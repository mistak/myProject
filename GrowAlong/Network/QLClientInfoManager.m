//
//  QLClientInfoHelper.m
//  QLChat
//
//  Created by Tpphha on 2016/11/11.
//  Copyright © 2016年 qlchat. All rights reserved.
//

#import "QLClientInfoManager.h"
#import <sys/utsname.h>
#import <SystemConfiguration/CaptiveNetwork.h>

@implementation QLClientInfoManager
#pragma mark -
+ (NSDictionary *)clientInfo {
    static NSDictionary *clientInfo;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        clientInfo = @{@"caller"   : @"app",
                       @"os"       : [[UIDevice currentDevice] systemVersion],
                       @"ver"      : kGlobalAppVersion,
                       @"platform" : @"iOS",
                       @"bundleId" : APPLICATION.appBundleID,
                       @"ex"       : @{@"appVersion" : APPLICATION.appVersion}};
    });
    return clientInfo;
}



+ (NSDictionary *)clientInfoForFull
{
    
    NSMutableDictionary *clientInfo = @{@"caller"   : @"app",
                                        @"os"       : [[UIDevice currentDevice] systemVersion],
                                        @"ver"      : kGlobalAppVersion,
                                        @"bundleId" : APPLICATION.appBundleID,
                                        @"platform" : @"iOS"}.mutableCopy;
    NSMutableDictionary *ex = [NSMutableDictionary new];
    ex[@"appVersion"] = APPLICATION.appVersion;
    ex[@"uuid"] = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    ex[@"systemVersion"] = [[UIDevice currentDevice] systemVersion];
    ex[@"systemName"] = [[UIDevice currentDevice] systemName];
    // 手机别名
    ex[@"deviceName"] = [[UIDevice currentDevice] name];
    // 手机型号
    ex[@"deviceModel"] = [[UIDevice currentDevice] model];
    
    NSDictionary *SSIDInfo = [self fetchSSIDInfo];
    struct utsname systemInfo;
    uname(&systemInfo);
    ex[@"machine"] = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    ex[@"ssid"] = [[SSIDInfo objectForKey:@"SSID"] lowercaseString];
    ex[@"bssid"] = [[SSIDInfo objectForKey:@"BSSID"] lowercaseString];
    
    clientInfo[@"ex"] = ex;
    
    return clientInfo.copy;
}

+ (id)fetchSSIDInfo {
    NSArray *ifs = (__bridge_transfer id)CNCopySupportedInterfaces();
    id info = nil;
    for (NSString *ifnam in ifs) {
        info = (__bridge_transfer id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
        if (info && [info count]) { break; }
    }
    return info;
}


+ (NSString *)clientUserAgent {
    static NSString *userAgent;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgnu"
#if TARGET_OS_IOS
        // User-Agent Header; see http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.43
        userAgent = [NSString stringWithFormat:@"%@/%@ (%@; iOS %@; Scale/%0.2f)", [[NSBundle mainBundle] infoDictionary][(__bridge NSString *)kCFBundleExecutableKey] ?: [[NSBundle mainBundle] infoDictionary][(__bridge NSString *)kCFBundleIdentifierKey], [[NSBundle mainBundle] infoDictionary][(__bridge NSString *)kCFBundleVersionKey], [[UIDevice currentDevice] model], [[UIDevice currentDevice] systemVersion], [[UIScreen mainScreen] scale]];
#elif TARGET_OS_WATCH
        // User-Agent Header; see http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.43
        userAgent = [NSString stringWithFormat:@"%@/%@ (%@; watchOS %@; Scale/%0.2f)", [[NSBundle mainBundle] infoDictionary][(__bridge NSString *)kCFBundleExecutableKey] ?: [[NSBundle mainBundle] infoDictionary][(__bridge NSString *)kCFBundleIdentifierKey], [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"] ?: [[NSBundle mainBundle] infoDictionary][(__bridge NSString *)kCFBundleVersionKey], [[WKInterfaceDevice currentDevice] model], [[WKInterfaceDevice currentDevice] systemVersion], [[WKInterfaceDevice currentDevice] screenScale]];
#elif defined(__MAC_OS_X_VERSION_MIN_REQUIRED)
        userAgent = [NSString stringWithFormat:@"%@/%@ (Mac OS X %@)", [[NSBundle mainBundle] infoDictionary][(__bridge NSString *)kCFBundleExecutableKey] ?: [[NSBundle mainBundle] infoDictionary][(__bridge NSString *)kCFBundleIdentifierKey], [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"] ?: [[NSBundle mainBundle] infoDictionary][(__bridge NSString *)kCFBundleVersionKey], [[NSProcessInfo processInfo] operatingSystemVersionString]];
#endif
#pragma clang diagnostic pop
        if (userAgent) {
            if (![userAgent canBeConvertedToEncoding:NSASCIIStringEncoding]) {
                NSMutableString *mutableUserAgent = [userAgent mutableCopy];
                if (CFStringTransform((__bridge CFMutableStringRef)(mutableUserAgent), NULL, (__bridge CFStringRef)@"Any-Latin; Latin-ASCII; [:^ASCII:] Remove", false)) {
                    userAgent = mutableUserAgent;
                }
            }
        }
    });
    return userAgent;
}

@end
