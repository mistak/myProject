//
//  QLClientInfoHelper.h
//  QLChat
//
//  Created by Tpphha on 2016/11/11.
//  Copyright © 2016年 qlchat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QLClientInfoManager : NSObject
+ (NSDictionary *)clientInfo;

+ (NSDictionary *)clientInfoForFull;

+ (NSString *)clientUserAgent;

@end
