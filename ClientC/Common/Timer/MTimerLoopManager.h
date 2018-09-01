//
//  MTimerLoopManager.h
//  ClientC
//
//  Created by Crazy on 2018/8/14.
//  Copyright © 2018年 no. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MLoopItem.h"


/**
 只适用于对时间要求不那么精确的需求，如果精度对秒级误差难以接受，请自行处理
 误差原因：添加时间未知（可能刚处理完上一次轮询，也可能即将轮询）+处理耗时
 */
@interface MTimerLoopManager : NSObject

+ (instancetype)sharedInstance;

- (void)addTimerForKey:(MTimerLoopKey)key
              duration:(NSInteger)duration
                repeat:(BOOL)repeat
         progressBlock:(progressBlock)progressBlock
       completionBlock:(completionBlock)completionBlock;

/**
 获取到这个key对应的定时item,根据返回值确定有没有这个item,如果有，还传了block，那之前的block会被替换

 @param key key
 @param progressBlock progressBlock
 @param completionBlock completionBlock
 @return YES/NO
 */
- (BOOL)getTimerForKey:(MTimerLoopKey)key
         progressBlock:(progressBlock)progressBlock
       completionBlock:(completionBlock)completionBlock;

- (void)removeTimerForKey:(MTimerLoopKey)key;

@end
