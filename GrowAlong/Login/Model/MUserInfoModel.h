//
//  MUserInfoModel.h
//  GrowAlong
//
//  Created by 刘斌 on 2018/9/19.
//  Copyright © 2018年 no. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MUserInfoModel : NSObject
//  主态才会有这个字段
@property (nonatomic, copy) NSString *sid;

@property (nonatomic, copy) NSString *userId;

@property (nonatomic, copy) NSString *headImgUrl;

@property (nonatomic, copy) NSString *mobile;
/**
 昵称
 */
@property (nonatomic, copy) NSString *name;
/**
 状态 1：正常，0禁用,2已配对
 */
@property (nonatomic, assign) NSInteger status;
/**
 年龄
 */
@property (nonatomic, assign) NSInteger age;
/**
 性别 1男，0女
 */
@property (nonatomic, assign) NSInteger gender;
/**
 爱好
 */
@property (nonatomic, copy) NSString *hobby;
/**
 家庭地址
 */
@property (nonatomic, copy) NSString *address;
/**
 家庭介绍
 */
@property (nonatomic, copy) NSString *familyInfo;
/**
 用户级别 1,2,3
 */
@property (nonatomic, assign) NSInteger grade;
/**
 国籍身份 1,中国家庭 2，英国家庭
 */
@property (nonatomic, assign) NSInteger nation;

@end
