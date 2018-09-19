//
//  MMineHeaderView.m
//  GrowAlong
//
//  Created by Crazy on 2018/8/20.
//  Copyright © 2018年 no. All rights reserved.
//

#import "MMineHeaderView.h"

@interface MMineHeaderView ()

@property(nonatomic, strong) MImageView *backView;

@property(nonatomic, strong) MView *bottomWhiteView;

@property(nonatomic, strong) MView *contentView;

@property(nonatomic, strong) MLabel *nameLabel;

@property(nonatomic, strong) MImageView *sexView;

@property(nonatomic, strong) MImageView *iconView;

@property(nonatomic, strong) MLabel *signLabel;

@property(nonatomic, strong) MImageView *addrView;

@property(nonatomic, strong) MLabel *addrLabel;

@end

@implementation MMineHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setUpView];
        [self setUpConstraints];
    }
    return self;
}

- (void)setUpView
{
    self.backView = [[MImageView alloc] init];
    [self addSubview:self.backView];
    self.backView.image = MImage(@"mine_background");
    
    self.bottomWhiteView = [[MView alloc] init];
    [self addSubview:self.bottomWhiteView];
    self.bottomWhiteView.backgroundColor = [UIColor whiteColor];
    
    self.contentView = [[MView alloc] init];
    [self addSubview:self.contentView];
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.contentView.layer.cornerRadius = 8;
    self.contentView.layer.shadowColor = MShallowGrayColor.CGColor;
    self.contentView.layer.shadowOffset = CGSizeMake(3, 3);
    
    self.nameLabel = [MViewGenerater labelWithTitle:nil titleColor:UIColorHex(0x020202) backgroundColor:nil fontSize:22];
    [self.contentView addSubview:self.nameLabel];
    
    self.sexView = [[MImageView alloc] init];
    [self.contentView addSubview:self.sexView];

    self.iconView = [[MImageView alloc] init];
    [self.contentView addSubview:self.iconView];
    self.iconView.layer.cornerRadius = 25;
    self.iconView.layer.masksToBounds = YES;

    self.signLabel = [MViewGenerater labelWithTitle:nil titleColor:UIColorHex(0x020202) backgroundColor:nil fontSize:15];
    [self.contentView addSubview:self.signLabel];
    
    self.addrView = [[MImageView alloc] init];
    [self.contentView addSubview:self.addrView];
//    self.addrView.image = MImage(@"xx");
    
    self.addrLabel = [MViewGenerater labelWithTitle:nil titleColor:UIColorHex(0x999999) backgroundColor:nil fontSize:13];
    [self.contentView addSubview:self.addrLabel];
    
    self.nameLabel.text = @"我是一个大帅哥";
    self.signLabel.text = @"吃饭，睡觉，打豆豆";
    self.addrLabel.text = @"中国北京";
    self.iconView.backgroundColor = MDeepGrayColor;
}

- (void)setUpConstraints
{
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.right.top.equalTo(self);
        make.bottom.mas_offset(-55);
    }];
    
    [self.bottomWhiteView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.right.bottom.equalTo(self);
        make.top.equalTo(self.backView.mas_bottom);
    }];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_offset(15);
        make.right.bottom.mas_offset(-20);
        make.height.mas_equalTo(130);
    }];

    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_offset(20);
        make.top.mas_offset(21);
    }];
    
    [self.sexView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.nameLabel.mas_right).offset(15);
        make.centerY.equalTo(self.nameLabel);
    }];
    
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.nameLabel);
        make.right.mas_offset(-15);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    [self.signLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.nameLabel.mas_bottom).offset(6);
        make.left.equalTo(self.nameLabel);
    }];
    
    [self.addrView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.nameLabel.mas_left);
        make.bottom.mas_greaterThanOrEqualTo(-20);
    }];
    
    [self.addrLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.addrView.mas_right).offset(5);
        make.centerY.equalTo(self.addrView);
        make.right.mas_lessThanOrEqualTo(-20);
    }];
    
}

#pragma mark - public

- (void)setData:(MUserInfoModel *)userInfo
{
    [self.iconView setImageURL:[NSURL URLWithString:userInfo.headImgUrl]];
    
    self.nameLabel.text = userInfo.name;
    
}

@end
