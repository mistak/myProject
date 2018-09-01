//
//  MUtilityMacro.m
//  ClientC
//
//  Created by Crazy on 2018/8/10.
//  Copyright © 2018年 no. All rights reserved.
//

#import "MUtilityMacro.h"

#define isNull(x)   (!x || [x isKindOfClass:[NSNull class]])
#define isValidClass(x, cls) (nil != x && [x isKindOfClass:[cls class]])
#define isValidClassEmpty(x, cls) (isValidClass(x, cls) && isEmpty(x))
#define isValidClassNotEmpty(x, cls) (isValidClass(x, cls) && !isEmpty(x))

void NOTIFY(NSString* notiName,id obj,NSDictionary* userinfo)
{
#ifdef DEBUG
    NSLog(@"Notification:"
          "\n   name:      %@"
          "\n   obj:       %@"
          "\n   userInfo:  %@",
          notiName,
          obj,
          userinfo);
#endif
    
    dispatch_async_on_main_queue(^{
        [NOTIFICATION_CENTER postNotificationName:notiName object:obj userInfo:userinfo];
    });
}


BOOL isNotEmpty(id val)
{
    if (isNull(val)) {
        return NO;
    }
    
    if ([val respondsToSelector:@selector(length)]) {
        if (isValidClass(val, NSString)) {
            NSString *lowercaseVal = [(NSString *)val lowercaseString];
            if ([lowercaseVal isEqualToString:@"null"] ||
                [lowercaseVal isEqualToString:@"(null)"]) {
                return NO;
            }
        }
        return (BOOL)[val performSelector:@selector(length)];
    }
    
    if (isValidClass(val, NSArray)) {
        return [(NSArray*)val count];
    }
    
    if (isValidClass(val, NSDictionary)) {
        return [(NSDictionary*)val count];
    }
    
    if (isValidClass(val, NSSet)) {
        return [(NSSet*)val count];
    }
    
    if (isValidClass(val, NSOrderedSet)) {
        return [(NSOrderedSet*)val count];
    }
    
    return YES;
}

BOOL isEmpty(id val)
{
    return !isNotEmpty(val);
}

void dispatch_after_on_main_queue(NSTimeInterval delayInseconds, dispatch_block_t block) {
    if (!block) return;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInseconds * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        block();
    });
}

void dispatch_async_on_background_queueForQOS(NSQualityOfService qos, dispatch_block_t block) {
    if (!block) return;
    dispatch_queue_t queue = YYDispatchQueueGetForQOS(qos);
    dispatch_async(queue, block);
}

void dispatch_async_on_background_queue(dispatch_block_t block) {
    if (!block) return;
    dispatch_async_on_background_queueForQOS(NSQualityOfServiceUtility, block);
}


dispatch_queue_t QLDispatchQueueGetForQOS(NSQualityOfService qos) {
    return YYDispatchQueueGetForQOS(qos);
}



NSArray<NSIndexPath *> * offsetIndexPathsInTableView(NSRange range, NSUInteger section) {
    
    if (range.length <= 0 ||
        range.location == NSNotFound) {
        return nil;
    }
    
    NSMutableArray<NSIndexPath *> *indexPaths = [NSMutableArray array];
    for (NSUInteger i = range.location; i < range.location + range.length; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:section];
        [indexPaths addObject:indexPath];
    }
    
    return indexPaths.copy;
}

NSArray<NSIndexPath *> * offsetIndexPathsInCollectionView(NSRange range, NSUInteger section) {
    
    if (range.length <= 0 ||
        range.location == NSNotFound) {
        return nil;
    }
    
    NSMutableArray<NSIndexPath *> *indexPaths = [NSMutableArray array];
    for (NSUInteger i = range.location; i < range.location + range.length; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:section];
        [indexPaths addObject:indexPath];
    }
    
    return indexPaths.copy;
}


CGSize resizeSuchAsAspectRatio(CGSize orignalSize, CGSize ruleSize, BOOL keepOrignalSize) {
    if (CGSizeEqualToSize(orignalSize, CGSizeZero)) return ruleSize;
    CGFloat ruleAspectRation = ruleSize.width / ruleSize.height;
    CGFloat aspectRatio = orignalSize.width / orignalSize.height;
    if (aspectRatio > ruleAspectRation) {
        CGFloat width = keepOrignalSize ? MIN(orignalSize.width, ruleSize.width) : ruleSize.width;
        CGFloat height = width / aspectRatio;
        return CGSizeMake(width, height);
    }else {
        CGFloat height = keepOrignalSize ? MIN(orignalSize.height, ruleSize.height) : ruleSize.height;
        CGFloat width = height * aspectRatio;
        return CGSizeMake(width, height);
    }
    
}
