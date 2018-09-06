//
//  MLoopItem.h
//  GrowAlong
//
//  Created by Crazy on 2018/8/14.
//  Copyright © 2018年 no. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger,MTimerLoopKey) {
    MTimerLoop_verifyCodeLogin = 1,                 //  验证码登录
    MTimerLoop_verifyCodeFindPassWord = 2,          //  找回密码验证码
};

typedef void(^progressBlock) (NSInteger duration);
typedef void(^completionBlock) (NSInteger duration);

@interface MLoopItem : NSObject

@property(nonatomic, assign, readonly) MTimerLoopKey loopKey;

/**
 轮询事件的间隔时间或触发时间
 */
@property(nonatomic, assign, readonly) NSInteger duration;

@property(nonatomic, assign) BOOL repeat;

/**
 当前轮询的秒数，逐秒递增
 */
@property(nonatomic, assign) NSInteger recordTime;

@property(nonatomic, copy) progressBlock progress;

@property(nonatomic, copy) completionBlock completion;

- (instancetype)initWithLoopKey:(MTimerLoopKey)loopKey
                       duration:(NSInteger)duration
                         repeat:(BOOL)repeat
                  progressBlock:(progressBlock)progressBlock
                completionBlock:(completionBlock)completionBlock;
@end
