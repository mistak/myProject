//
//  MBaseTableViewCell.m
//  GrowAlong
//
//  Created by Crazy on 2018/8/20.
//  Copyright © 2018年 no. All rights reserved.
//

#import "MBaseTableViewCell.h"

@interface MBaseTableViewCell ()

@end

@implementation MBaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self p_setUpView];
    }
    return self;
}

- (void)p_setUpView
{
    self.bottomLine = [MViewGenerater horizontalLineView];
    [self.contentView addSubview:self.bottomLine];
    self.bottomLine.hidden = YES;
    
    [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_offset(15);
        make.right.bottom.equalTo(self);
        make.height.mas_equalTo(0.5);
    }];
}

+ (NSString *)reuserIdentifier
{
    return NSStringFromClass([self class]);
}

@end
