//
//  MVerifyCodeLoginViewController.m
//  GrowAlong
//
//  Created by Crazy on 2018/8/8.
//  Copyright © 2018年 no. All rights reserved.
//

#import "MVerifyCodeLoginViewController.h"

#import "MInputContentView.h"
#import "MGetVerifyView.h"

@interface MVerifyCodeLoginViewController ()

@property(nonatomic, strong) MInputContentView *phoneInputView;

@property(nonatomic, strong) MInputContentView *verifyInputView;

@property(nonatomic, strong) MButton *loginButton;

@property(nonatomic, strong) MGetVerifyView *getCodeView;

@end

@implementation MVerifyCodeLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpView];
}

- (void)setUpView
{
    self.phoneInputView = [[MInputContentView alloc] init];
    [self.phoneInputView setInputType:MInputViewTypePhone];
    [self.view addSubview:self.phoneInputView];
    self.phoneInputView.textField.rightViewMode = UITextFieldViewModeAlways;
    
    self.verifyInputView = [[MInputContentView alloc] init];
    [self.verifyInputView setInputType:MInputViewTypeVerifyCode];
    [self.view addSubview:self.verifyInputView];
    
    self.getCodeView = [[MGetVerifyView alloc] initWithType:MGetVerifyViewTypeLogin];
    self.getCodeView.size = [MGetVerifyView size];
    self.phoneInputView.textField.rightView = self.getCodeView;
    
    self.loginButton = [MViewGenerater buttonWithTitle:@"登录" titleColor:HexColor(0xffffff) backgroundColor:MThemecolor fontSize:17];
    [self.view addSubview:self.loginButton];
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
}


@end
