//
//  MGetVerifyView.h
//  ClientC
//
//  Created by Crazy on 2018/8/11.
//  Copyright © 2018年 no. All rights reserved.
//

#import "MView.h"

typedef NS_ENUM(NSInteger, MGetVerifyViewType) {
    MGetVerifyViewTypeLogin,
    MGetVerifyViewTypeFindPassWord,
};

@interface MGetVerifyView : MView

@property(nonatomic, assign) MGetVerifyViewType type;

- (instancetype)initWithType:(MGetVerifyViewType)type;

+ (CGSize)size;

@end
