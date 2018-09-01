//
//  MFindPassWordPhoneViewController.m
//  ClientC
//
//  Created by Crazy on 2018/8/13.
//  Copyright © 2018年 no. All rights reserved.
//

#import "MFindPassWordPhoneViewController.h"
#import "MFindPassWordVerifyCodeViewController.h"

#import "MInputContentView.h"

@interface MFindPassWordPhoneViewController ()

@property(nonatomic, strong) MInputContentView *phoneInputView;

@property(nonatomic, strong) MButton *nextButton;

@end

@implementation MFindPassWordPhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"找回密码";
    
    self.phoneInputView = [[MInputContentView alloc] init];
    [self.phoneInputView setInputType:MInputViewTypeFindPassword_phone];
    [self.view addSubview:self.phoneInputView];
    
    self.nextButton = [MViewGenerater buttonWithTitle:@"下一步" titleColor:HexColor(0xffffff) backgroundColor:MThemecolor fontSize:17];
    [self.view addSubview:self.nextButton];
    [self.nextButton addTarget:self action:@selector(handleNextEvent:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    CGFloat leftMargin = 25;
    self.phoneInputView.frame = CGRectMake(0, 20 + self.qmui_navigationBarMaxYInViewCoordinator, self.view.width, [MInputContentView heightForType:MInputViewTypeFindPassword_phone]);
    
    self.nextButton.left = leftMargin;
    self.nextButton.width = self.view.width - leftMargin*2;
    self.nextButton.height = 40;
    self.nextButton.top = self.phoneInputView.bottom + 30;
    self.nextButton.layer.cornerRadius = 20;
}


#pragma mark - action

- (void)handleNextEvent:(id)sender
{
    MFindPassWordVerifyCodeViewController * vc = [MFindPassWordVerifyCodeViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
