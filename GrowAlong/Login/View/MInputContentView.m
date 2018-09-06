//
//  MInputContentView.m
//  GrowAlong
//
//  Created by Crazy on 2018/8/9.
//  Copyright © 2018年 no. All rights reserved.
//

#import "MInputContentView.h"

static CGFloat const hintLabelHeight = 21;
static CGFloat const textFieldHeight = 25;
static CGFloat const textSpace = 6;
static CGFloat const textMargin = 25;
static CGFloat const lineMargin = 20;

@interface MInputContentView ()

@property(nonatomic, strong) MView *bottomLine;

@end

@implementation MInputContentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setDefaultConfig];
        [self setUpView];
    }
    return self;
}

- (void)setDefaultConfig
{
    _shortLengthLimit = 0;
    _longLengthLimit = 16;
}

- (void)setUpView
{
    self.hintLabel = [MViewGenerater labelWithTitle:nil titleColor:MDeepGrayColor backgroundColor:nil fontSize:13];
    [self addSubview:self.hintLabel];
    
    self.textField = [[QMUITextField alloc] init];
    [self addSubview:self.textField];
    self.textField.borderStyle = UITextBorderStyleNone;
    self.textField.placeholderColor = MShallowGrayColor;
    self.textField.textColor = HexColor(0x333333);
    self.textField.font = FONT(16);
    self.textField.textInsets = UIEdgeInsetsZero;
    
    UIButton * button = [MViewGenerater buttonWithTitle:@"登录" titleColor:HexColor(0xffffff) backgroundColor:MThemecolor fontSize:17];
    button.frame = CGRectMake(0, 0, 100, 25);
    self.textField.rightView = button;
    
    self.bottomLine = [MViewGenerater horizontalLineView];
    [self addSubview:self.bottomLine];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.hintLabel.left = textMargin;
    self.hintLabel.top = 0;
    [self.hintLabel sizeToFit];
    
    CGFloat textFieldTop = self.hintLabel.hidden ? 0 : self.hintLabel.bottom + textSpace;
    
    self.textField.left = textMargin;
    self.textField.top = textFieldTop;
    self.textField.width = self.width - textMargin*2;
    self.textField.height = textFieldHeight;
    
    self.bottomLine.left = lineMargin;
    self.bottomLine.top = self.textField.bottom;
    self.bottomLine.width = self.width - lineMargin*2;
}

#pragma mark - public
- (void)setInputType:(MInputViewType)inputType
{
    switch (inputType)
    {
        case MInputViewTypePhone:
        {
            self.hintLabel.text = @"手机账号";
            self.textField.placeholder = @"请输入账号";
        }
            break;
        case MInputViewTypeVerifyCode:
        {
            self.hintLabel.text = @"验证码";
            self.textField.placeholder = @"请填写手机验证码";
        }
            break;
        case MInputViewTypePassWord:
            self.hintLabel.text = @"密码";
            self.textField.placeholder = @"请填写手机验证码";
            break;
        case MInputViewTypeEditData_babyName:
        {
            self.hintLabel.text = @"宝贝名字";
            self.textField.placeholder = @"请输入宝贝名字";
        }
            break;
        case MInputViewTypeEditData_babyAge:
        {
            self.hintLabel.text = @"宝贝年龄";
            self.textField.placeholder = @"请输入宝贝年龄";
        }
            break;
        case MInputViewTypeEditData_patriarchIdentity:
        {
            self.hintLabel.text = @"家长身份";
            self.textField.placeholder = @"爸爸/妈妈";
        }
            break;
        case MInputViewTypeEditData_recommendCode:
        {
            self.hintLabel.text = @"内推码";
            self.textField.placeholder = @"选填";
        }
            break;
        case MInputViewTypeFindPassword_phone:
        {
            self.hintLabel.hidden = YES;
            self.textField.placeholder = @"请输入您的登录手机号码";
        }
            break;
        case MInputViewTypeFindPassword_VerifyCode:
        {
            self.hintLabel.hidden = YES;
            self.textField.placeholder = @"请输入短信验证码";
        }
            break;
        case MInputViewTypeFindPassword_passWord:
        {
            self.hintLabel.hidden = YES;
            self.textField.placeholder = @"请设置登录密码";
        }
            break;
    }
}

+ (CGFloat)heightForType:(MInputViewType)type
{
    CGFloat height = 0;
    switch (type)
    {
        case MInputViewTypePhone:
        case MInputViewTypeVerifyCode:
        case MInputViewTypePassWord:
        case MInputViewTypeEditData_babyName:
        case MInputViewTypeEditData_babyAge:
        case MInputViewTypeEditData_patriarchIdentity:
        case MInputViewTypeEditData_recommendCode:
        {
            height = textFieldHeight + textSpace + 0.5 + hintLabelHeight;
        }
            break;
        case MInputViewTypeFindPassword_phone:
        case MInputViewTypeFindPassword_passWord:
        case MInputViewTypeFindPassword_VerifyCode:
        {
            return textFieldHeight + 0.5;
        }
            break;
    }
    return height;
}

@end
