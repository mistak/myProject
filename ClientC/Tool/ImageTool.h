//
//  ImageTool.h
//  ClientC
//
//  Created by mistak on 2018/8/7.
//  Copyright © 2018年 no. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MImage(x) [[ImageTool sharedInstance] imageWithName:x]

@interface ImageTool : NSObject

+ (instancetype)sharedInstance;

- (UIImage *)imageWithName:(NSString *)imageName;

@end
