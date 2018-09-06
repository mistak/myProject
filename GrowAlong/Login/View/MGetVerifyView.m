//
//  MGetVerifyView.m
//  GrowAlong
//
//  Created by Crazy on 2018/8/11.
//  Copyright © 2018年 no. All rights reserved.
//

#import "MGetVerifyView.h"

#import "MTimerLoopManager.h"

static CGFloat const codeWidth = 90;
static NSUInteger const getVerifyTimeLimit = 10;

@interface MGetVerifyView ()

@property(nonatomic, strong) MView *lineView;

@property(nonatomic, strong) MButton *getCodeButton;

@end

@implementation MGetVerifyView

- (void)dealloc
{
    
}

- (instancetype)initWithType:(MGetVerifyViewType)type
{
    self = [super init];
    if (self)
    {
        _type = type;
        [self setUpView];
        [self getTimer];
    }
    return self;
}

- (void)setUpView
{
    self.lineView = [MViewGenerater verticalLineView];
    [self addSubview:self.lineView];
    
    self.getCodeButton = [MViewGenerater buttonWithTitle:@"获取验证码" titleColor:MThemecolor backgroundColor:nil fontSize:14];
    self.getCodeButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [self.getCodeButton setTitleColor:MShallowGrayColor forState:UIControlStateDisabled];
    [self addSubview:self.getCodeButton];
    [self.getCodeButton addTarget:self action:@selector(handleGetCodeEvent:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)layoutSubviews {
    [super layoutSubviews];

    self.lineView.frame = CGRectMake(0, 0, self.lineView.width, 15);
    self.lineView.centerY = self.height/2;
    
    self.getCodeButton.frame = CGRectMake(5, 0, ratioWidth(codeWidth), 20);
    self.getCodeButton.centerX = self.width/2;
    self.getCodeButton.centerY = self.height/2;
    
}

#pragma mark - public

+ (CGSize)size
{
    return CGSizeMake(ratioWidth(104-25), 25);
}

#pragma mark - private

- (void)getTimer
{
    MTimerLoopKey key = self.type == MGetVerifyViewTypeLogin ? MTimerLoop_verifyCodeLogin : MTimerLoop_verifyCodeFindPassWord;
    [[MTimerLoopManager sharedInstance] getTimerForKey:key progressBlock:^(NSInteger duration) {
        
        [self refreshRecordTextWithTime:getVerifyTimeLimit - duration];
        
    } completionBlock:^(NSInteger duration) {
        
        [self refreshRecordTextWithTime:getVerifyTimeLimit - duration];
    }];
}

- (void)startTimer
{
    MTimerLoopKey key = self.type == MGetVerifyViewTypeLogin ? MTimerLoop_verifyCodeLogin : MTimerLoop_verifyCodeFindPassWord;
    BOOL isExist = [[MTimerLoopManager sharedInstance] getTimerForKey:key progressBlock:nil completionBlock:nil];
    if (isExist)
    {
        self.getCodeButton.enabled = NO;
        return;
    }
    [[MTimerLoopManager sharedInstance] addTimerForKey:key duration:getVerifyTimeLimit repeat:NO progressBlock:^(NSInteger duration) {
        
        [self refreshRecordTextWithTime:getVerifyTimeLimit - duration];
        
    } completionBlock:^(NSInteger duration) {
        
        [self refreshRecordTextWithTime:getVerifyTimeLimit - duration];
    }];
}

- (void)refreshRecordTextWithTime:(NSInteger)time
{
    if (time <= 0)
    {
        self.getCodeButton.enabled = YES;
    }
    else
    {
        self.getCodeButton.enabled = NO;
        [self.getCodeButton setTitle:[NSString stringWithFormat:@"%lds重新发送",time] forState:UIControlStateDisabled];
    }
}

#pragma mark - action

- (void)handleGetCodeEvent:(MButton *)sender
{
    [self startTimer];
}

@end
