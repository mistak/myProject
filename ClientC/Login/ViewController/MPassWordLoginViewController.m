//
//  MPassWordLoginViewController.m
//  ClientC
//
//  Created by Crazy on 2018/8/8.
//  Copyright © 2018年 no. All rights reserved.
//

#import "MPassWordLoginViewController.h"
#import "MFindPassWordPhoneViewController.h"

#import "MInputContentView.h"

@interface MPassWordLoginViewController ()

@property(nonatomic, strong) MInputContentView *phoneInputView;

@property(nonatomic, strong) MInputContentView *verifyInputView;

@property(nonatomic, strong) MButton *loginButton;

@property(nonatomic, strong) MButton *forgetButton;

@end

@implementation MPassWordLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpView];
}

- (void)setUpView
{
    self.phoneInputView = [[MInputContentView alloc] init];
    [self.phoneInputView setInputType:MInputViewTypePhone];
    [self.view addSubview:self.phoneInputView];
    
    self.verifyInputView = [[MInputContentView alloc] init];
    [self.verifyInputView setInputType:MInputViewTypePassWord];
    [self.view addSubview:self.verifyInputView];
    
    self.loginButton = [MViewGenerater buttonWithTitle:@"登录" titleColor:HexColor(0xffffff) backgroundColor:MThemecolor fontSize:17];
    [self.view addSubview:self.loginButton];
    
    self.forgetButton = [MViewGenerater buttonWithTitle:@"忘记密码？" titleColor:MThemecolor backgroundColor:nil fontSize:13];
    [self.view addSubview:self.forgetButton];
    [self.forgetButton addTarget:self action:@selector(handleForgetEvent:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    CGFloat margin = 30;
    CGFloat leftMargin = 25;
    self.phoneInputView.frame = CGRectMake(0, margin, self.view.width, [MInputContentView heightForType:MInputViewTypePhone]);
    self.verifyInputView.frame = CGRectMake(0, self.phoneInputView.bottom + margin, self.view.width, [MInputContentView heightForType:MInputViewTypeVerifyCode]);
    
    self.loginButton.left = leftMargin;
    self.loginButton.width = self.view.width - leftMargin*2;
    self.loginButton.height = 40;
    self.loginButton.top = self.verifyInputView.bottom + margin;
    self.loginButton.layer.cornerRadius = 20;
    
    self.forgetButton.size = CGSizeMake(100, 40);
    self.forgetButton.centerX = self.view.width/2;
    self.forgetButton.bottom = self.view.height - IPhoneXSafeAreaInsets.bottom;
    
}

#pragma mark - action

- (void)handleLoginEvent:(id)sender
{
    
}


- (void)handleForgetEvent:(id)sender
{
    [self.navigationController pushViewController:[MFindPassWordPhoneViewController new] animated:YES];
}



@end
