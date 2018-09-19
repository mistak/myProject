//
//  MUserManager.h
//  GrowAlong
//
//  Created by 刘斌 on 2018/9/19.
//  Copyright © 2018年 no. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MUserInfoModel.h"

@interface MUserManager : NSObject

@property (nonatomic, strong, readonly) MUserInfoModel *userInfo;

- (void)loginWithUserInfo:(MUserInfoModel *)userInfo;

+ (instancetype)sharedInstance;

@end
