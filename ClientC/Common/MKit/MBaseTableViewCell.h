//
//  MBaseTableViewCell.h
//  ClientC
//
//  Created by Crazy on 2018/8/20.
//  Copyright © 2018年 no. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MBaseTableViewCell : UITableViewCell

@property(nonatomic, assign) CGFloat bottomLineLeftmargin;
@property(nonatomic, assign) CGFloat bottomLineRightmargin;
@property(nonatomic, assign) CGFloat bottomLineHeight;

@property(nonatomic, strong) MView *bottomLine;

+ (NSString *)reuserIdentifier;

@end
