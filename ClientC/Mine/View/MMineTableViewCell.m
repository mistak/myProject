//
//  MMinePicTableViewCell.m
//  ClientC
//
//  Created by Crazy on 2018/8/22.
//  Copyright © 2018年 no. All rights reserved.
//

#import "MMineTableViewCell.h"

@interface MMineTableViewCell ()

@property(nonatomic, strong) MLabel *titleLabel;

@property(nonatomic, strong) MImageView *levelView;

@property(nonatomic, strong) MImageView *arrowView;

@end

@implementation MMineTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self setUpView];
        [self setUpConstraint];
    }
    return self;
}

- (void)setUpView
{
    self.titleLabel = [MViewGenerater labelWithTitle:nil titleColor:UIColorHex(0x474747) backgroundColor:nil fontSize:16];
    [self.contentView addSubview:self.titleLabel];
    
    self.levelView = [[MImageView alloc] init];
    [self.contentView addSubview:self.levelView];
    
    self.arrowView = [[MImageView alloc] init];
    [self.contentView addSubview:self.arrowView];
    
    self.bottomLine.hidden = NO;
}

- (void)setUpConstraint
{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_offset(15);
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.levelView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.titleLabel.mas_right).offset(8);
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.arrowView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.right.mas_offset(-15);
        make.centerY.equalTo(self.contentView);
    }];
}

#pragma mark - public

- (void)setItem:(MMineItem *)item
{
    _item = item;
    
    self.titleLabel.text = item.title;
    
    self.levelView.hidden = item.imageHidden;
    self.levelView.image = MImage(item.imageName);
}

@end
