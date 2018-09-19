//
//  MCourseModel.h
//  GrowAlong
//
//  Created by 刘斌 on 2018/9/19.
//  Copyright © 2018年 no. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, MCourseStage) {
    MCourseStageNotStart,
    MCourseStageProcessing,
    MCourseStageEnd
};

@interface MCourseModel : NSObject

@property (nonatomic, assign) NSInteger courseId;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *imgUrl;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, assign) long long createTime;

@property (nonatomic, assign) long long updateTime;

@property (nonatomic, assign) MCourseStage status;
@end
