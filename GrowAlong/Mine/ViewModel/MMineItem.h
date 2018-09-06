//
//  MMineItem.h
//  GrowAlong
//
//  Created by Crazy on 2018/8/22.
//  Copyright © 2018年 no. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, MMineCellType) {
    MMineCellTypeStudy,
    MMineCellTypeDownload,
    MMineCellTypeCollection,
};

@interface MMineItem : NSObject

@property(nonatomic, assign) MMineCellType type;

@property(nonatomic, copy) NSString *title;

@property(nonatomic, copy) NSString *imageName;

@property(nonatomic, assign, readonly) BOOL imageHidden;

- (instancetype)initWithType:(MMineCellType)type;

@end
