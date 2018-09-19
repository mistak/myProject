//
//  MCourseModel.h
//  GrowAlong
//
//  Created by 刘斌 on 2018/9/19.
//  Copyright © 2018年 no. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, MCourseContentType) {
    MCourseContentTypeFile,
    MCourseContentTypeAudio,
    MCourseContentTypeVideo,
    MCourseContentTypeImage,
    MCourseContentTypeText,
};

@interface MCourseContentModel : NSObject <YYModel>

@property (nonatomic, assign) NSInteger contentId;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, assign) MCourseContentType courseType;

@end
