//
//  MLoginRootViewController.m
//  GrowAlong
//
//  Created by Crazy on 2018/8/11.
//  Copyright © 2018年 no. All rights reserved.
//

#import "MLoginRootViewController.h"
#import "MLoginViewController.h"

@interface MLoginRootViewController ()

@property(nonatomic, strong) MImageView *bgImageView;

@property(nonatomic, strong) MView *controlContentView;

@property(nonatomic, strong) MButton *registButton;

@property(nonatomic, strong) MButton *loginButton;

@end

@implementation MLoginRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpView];
}

- (void)setUpView
{
    self.bgImageView = [[MImageView alloc] init];
    [self.view addSubview:self.bgImageView];
    self.bgImageView.backgroundColor = HexColor(0x999999);
    
    self.controlContentView = [[MView alloc] init];
    [self.view addSubview:self.controlContentView];
    
    self.registButton = [MViewGenerater buttonWithTitle:@"注册" titleColor:HexColor(0xffffff) backgroundColor:MThemecolor fontSize:17];
    [self.controlContentView addSubview:self.registButton];
    [self.registButton addTarget:self action:@selector(handleRegistEvent:) forControlEvents:UIControlEventTouchUpInside];
    
    self.loginButton = [MViewGenerater buttonWithTitle:@"登录" titleColor:MThemecolor backgroundColor:HexColor(0xffffff) fontSize:17];
    [self.controlContentView addSubview:self.loginButton];
    [self.loginButton addTarget:self action:@selector(handleLoginEvent:) forControlEvents:UIControlEventTouchUpInside];
    
    CGFloat contentHeight = ratioHeight(100);
    CGFloat margin = ratioWidth(25);
    CGFloat buttonWidth = ratioWidth(155);
    CGFloat buttonHeight = ratioHeight(40);
    
    self.bgImageView.frame = self.view.bounds;
    self.controlContentView.frame = CGRectMake(0, self.view.height - contentHeight, self.view.width, contentHeight);
    self.registButton.frame = CGRectMake(margin, 0, buttonWidth, buttonHeight);
    self.loginButton.frame = CGRectMake(self.view.right-margin-buttonWidth, 0, buttonWidth, buttonHeight);
    
    self.registButton.layer.cornerRadius = buttonHeight/2;
    self.loginButton.layer.cornerRadius = buttonHeight/2;
    

}


#pragma mark - action

- (void)handleRegistEvent:(id)sender
{
    
}

- (void)handleLoginEvent:(id)sender
{
    MLoginViewController * login = [MLoginViewController new];
    [self.navigationController pushViewController:login animated:YES];
}

@end
