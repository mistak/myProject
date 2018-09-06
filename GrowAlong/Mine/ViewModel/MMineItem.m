//
//  MMineItem.m
//  GrowAlong
//
//  Created by Crazy on 2018/8/22.
//  Copyright © 2018年 no. All rights reserved.
//

#import "MMineItem.h"

@implementation MMineItem

- (instancetype)initWithType:(MMineCellType)type
{
    self = [super init];
    if (self)
    {
        [self setUpWithType:type];
    }
    return self;
}

- (void)setUpWithType:(MMineCellType)type
{
    _type = type;
    
    NSString * title = nil;
    NSString * imageName = nil;
    switch (type) {
        case MMineCellTypeStudy:
            title = @"学习阶段";
            imageName = @"mine_level";
            break;
        case MMineCellTypeDownload:
            title = @"我的下载";
            break;
        case MMineCellTypeCollection:
            title = @"收藏";
            break;
    }
    _title = title;
    _imageName = imageName;
    _imageHidden = imageName == nil;
}

@end
