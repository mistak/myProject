//
//  MUserManager.m
//  GrowAlong
//
//  Created by 刘斌 on 2018/9/19.
//  Copyright © 2018年 no. All rights reserved.
//

#import "MUserManager.h"
#import "MFileManager.h"

static NSString * const kUserData = @"user.data";

@interface MUserManager ()

@property (nonatomic, strong, readwrite) MUserInfoModel *userInfo;

@end

@implementation MUserManager

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static MUserManager *instance = nil;
    dispatch_once(&onceToken,^{
        instance = [[super allocWithZone:NULL] init];
        [instance setUp];
    });
    return instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedInstance];
}

- (void)setUp
{
    NSString * path = [[[MFileManager sharedInstance] documentPath] stringByAppendingPathComponent:kUserData];
    
    MUserInfoModel * userInfo = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    self.userInfo = userInfo;
}

#pragma mark - 登录操作

- (void)loginWithUserInfo:(MUserInfoModel *)userInfo
{
    self.userInfo = userInfo;
    
    [self save:userInfo];
    
    NOTIFY(MNotification_login, nil, nil);
}

#pragma mark - 归解档
- (void)save:(MUserInfoModel *)userInfo
{
    NSString * path = [[[MFileManager sharedInstance] documentPath] stringByAppendingPathComponent:kUserData];
    
    [NSKeyedArchiver archiveRootObject:userInfo toFile:path];
}

@end
