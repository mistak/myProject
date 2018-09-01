//
//  MTimerLoopManager.m
//  ClientC
//
//  Created by Crazy on 2018/8/14.
//  Copyright © 2018年 no. All rights reserved.
//

#import "MTimerLoopManager.h"

@interface MTimerLoopManager ()

@property(nonatomic, strong) NSMutableArray *loopSoures;

@property(nonatomic, strong) YYTimer *timer;

@end

@implementation MTimerLoopManager

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static MTimerLoopManager *instance = nil;
    dispatch_once(&onceToken,^{
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedInstance];
}

#pragma mark - private
- (void)startTimer
{
    if (self.timer)
    {
        [self stopTimer];
    }
    self.timer = [[YYTimer alloc] initWithFireTime:1 interval:1 target:self selector:@selector(timerCallBack) repeats:YES];
    [self.timer fire];
}

- (void)stopTimer
{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)timerCallBack
{
    [self.loopSoures enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        [self handleLoop:obj];
    }];
}

- (void)handleLoop:(MLoopItem *)item
{
    item.recordTime ++;
    
    if (item.recordTime > item.duration && !item.repeat)
    {
        [self removeTimerForKey:item.loopKey];
        return;
    }
    
    NSInteger remainNum = item.recordTime%item.duration;
    if (remainNum == 0)
    {
        PERFORM_SAFE_BLOCK(item.completion, item.duration);
    }
    else
    {
        PERFORM_SAFE_BLOCK(item.progress,remainNum);
    }
}

#pragma mark - public

- (void)addTimerForKey:(MTimerLoopKey)key
              duration:(NSInteger)duration
                repeat:(BOOL)repeat
         progressBlock:(progressBlock)progressBlock
       completionBlock:(completionBlock)completionBlock
{
    MLoopItem * item = [[MLoopItem alloc] initWithLoopKey:key duration:duration repeat:repeat progressBlock:progressBlock completionBlock:completionBlock];
    
    __block NSInteger index = -1;
    [self.loopSoures enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        MLoopItem * item = (MLoopItem *)obj;
        if (item.loopKey == key)
        {
            index = idx;
            *stop = YES;
        }
    }];
    if (index != -1)
    {
        [self.loopSoures replaceObjectAtIndex:index withObject:item];
    }
    else
    {
        [self.loopSoures addObject:item];
    }
    if (!self.timer)
    {
        [self startTimer];
    }
    
}

- (BOOL)getTimerForKey:(MTimerLoopKey)key
         progressBlock:(progressBlock)progressBlock
       completionBlock:(completionBlock)completionBlock
{
    __block MLoopItem * item = nil;
    __block NSInteger index = -1;
    [self.loopSoures enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        MLoopItem * temp = (MLoopItem *)obj;
        if (temp.loopKey == key)
        {
            item = obj;
            index = idx;
            *stop = YES;
        }
    }];
    if (item && completionBlock)
    {
        item.progress = progressBlock;
        item.completion = completionBlock;
    }
    
    return isNotEmpty(item);
}

- (void)removeTimerForKey:(MTimerLoopKey)key
{
    if (isEmpty(self.loopSoures))
    {
        return;
    }
    [self.loopSoures enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        MLoopItem * item = (MLoopItem *)obj;
        if (item.loopKey == key)
        {
            [self.loopSoures removeObject:obj];
            *stop = YES;
        }
    }];
    
    if (isEmpty(self.loopSoures))
    {
        [self stopTimer];
    }
}

#pragma mark - getter setter

- (NSMutableArray *)loopSoures
{
    if (!_loopSoures)
    {
        _loopSoures = [[NSMutableArray alloc] init];
    }
    return _loopSoures;
}

@end
