//
//  MLoopItem.m
//  ClientC
//
//  Created by Crazy on 2018/8/14.
//  Copyright © 2018年 no. All rights reserved.
//

#import "MLoopItem.h"

@implementation MLoopItem

- (instancetype)initWithLoopKey:(MTimerLoopKey)loopKey
                       duration:(NSInteger)duration
                         repeat:(BOOL)repeat
                  progressBlock:(progressBlock)progressBlock
                completionBlock:(completionBlock)completionBlock
{
    self = [super init];
    if (self)
    {
        _loopKey = loopKey;
        _duration = duration;
        _repeat = repeat;
        _progress = progressBlock;
        _completion = completionBlock;
        _recordTime = 0;
    }
    return self;
}

@end
