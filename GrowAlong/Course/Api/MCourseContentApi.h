//
//  MCourseListApi.h
//  GrowAlong
//
//  Created by 刘斌 on 2018/9/19.
//  Copyright © 2018年 no. All rights reserved.
//

#import "MPageRequest.h"

#import "MCourseContentModel.h"

@interface MCourseContentApi : MPageRequest

- (instancetype)initWithUserId:(NSString *)userId
                      courseId:(NSString *)courseId;

@end
