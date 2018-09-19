//
//  MPageRequest.m
//  GrowAlong
//
//  Created by 刘斌 on 2018/9/19.
//  Copyright © 2018年 no. All rights reserved.
//

#import "MPageRequest.h"

@implementation MPageRequest

- (id)requestArgumentsWithoutProcessing
{
    NSMutableDictionary * dic = [super requestArgumentsWithoutProcessing];
    
    dic[@"pageSize"] = [NSString stringWithFormat:@"%ld",self.pageSize];
    dic[@"page"] = [NSString stringWithFormat:@"%ld",self.page];
    
    return dic;
}

@end
