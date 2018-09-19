//
//  MCommunicateListTableViewCell.m
//  GrowAlong
//
//  Created by 刘斌 on 2018/9/18.
//  Copyright © 2018年 no. All rights reserved.
//

#import "MCommunicateListTableViewCell.h"

@interface MCommunicateListTableViewCell ()

@property (nonatomic, strong) MImageView *iconView;

@property (nonatomic, strong) MLabel *titleLabel;

@property (nonatomic, strong) MLabel *detailLabel;

@property (nonatomic, strong) MLabel *timeLabel;

@property (nonatomic, strong) MButton *button;

@end

@implementation MCommunicateListTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setUpView];
    }
    return self;
}

- (void)setUpView
{
    self.iconView = [[MImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [self.contentView addSubview:self.iconView];
    
    self.titleLabel = [[MLabel alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [self.contentView addSubview:self.titleLabel];
    self.titleLabel.font = FONT(16);
    self.titleLabel.textColor = [UIColor colorWithHexString:@"0x474747"];

    self.detailLabel = [[MLabel alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [self.contentView addSubview:self.detailLabel];
    self.detailLabel.font = FONT(12);
    self.detailLabel.textColor = [UIColor colorWithHexString:@"0x999999"];
    
    self.timeLabel = [[MLabel alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [self.contentView addSubview:self.timeLabel];
    self.timeLabel.font = FONT(11);
    self.timeLabel.textColor = [UIColor colorWithHexString:@"0xb3b3b3"];
    
    
}

@end
