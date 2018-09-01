//
//  MFindPassWordVerifyCodeViewController.m
//  ClientC
//
//  Created by Crazy on 2018/8/13.
//  Copyright © 2018年 no. All rights reserved.
//

#import "MFindPassWordVerifyCodeViewController.h"

#import "MInputContentView.h"
#import "MGetVerifyView.h"

@interface MFindPassWordVerifyCodeViewController ()

@property(nonatomic, strong) MInputContentView *verifyInputView;

@property(nonatomic, strong) MInputContentView *passwordInputView;

@property(nonatomic, strong) MButton *findButton;

@property(nonatomic, strong) MGetVerifyView *getCodeView;

@end

@implementation MFindPassWordVerifyCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpView];
}

- (void)setUpView
{
    self.title = @"找回密码";
    
    self.verifyInputView = [[MInputContentView alloc] init];
    [self.verifyInputView setInputType:MInputViewTypeFindPassword_VerifyCode];
    [self.view addSubview:self.verifyInputView];
    self.verifyInputView.textField.rightViewMode = UITextFieldViewModeAlways;
    
    self.getCodeView = [[MGetVerifyView alloc] initWithType:MGetVerifyViewTypeFindPassWord];
    self.getCodeView.size = [MGetVerifyView size];
    self.verifyInputView.textField.rightView = self.getCodeView;
    
    self.passwordInputView = [[MInputContentView alloc] init];
    [self.passwordInputView setInputType:MInputViewTypeFindPassword_passWord];
    [self.view addSubview:self.passwordInputView];
    
    self.findButton = [MViewGenerater buttonWithTitle:@"找回密码" titleColor:HexColor(0xffffff) backgroundColor:MThemecolor fontSize:17];
    [self.view addSubview:self.findButton];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    CGFloat leftMargin = 25;
    self.verifyInputView.frame = CGRectMake(0, 20 + self.qmui_navigationBarMaxYInViewCoordinator, self.view.width, [MInputContentView heightForType:MInputViewTypeFindPassword_VerifyCode]);
    
    self.passwordInputView.frame = CGRectMake(0, self.verifyInputView.bottom + 30, self.view.width,[MInputContentView heightForType:MInputViewTypeFindPassword_passWord]);
    
    self.findButton.left = leftMargin;
    self.findButton.width = self.view.width - leftMargin*2;
    self.findButton.height = 40;
    self.findButton.top = self.passwordInputView.bottom + 30;
    self.findButton.layer.cornerRadius = 20;
}

@end
