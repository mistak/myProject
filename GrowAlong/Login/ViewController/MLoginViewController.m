//
//  LoginViewController.m
//  GrowAlong
//
//  Created by Crazy on 2018/8/8.
//  Copyright © 2018年 no. All rights reserved.
//

#import "MLoginViewController.h"
#import "MVerifyCodeLoginViewController.h"
#import "MPassWordLoginViewController.h"

@interface MLoginViewController ()<
WMPageControllerDelegate,
WMPageControllerDataSource,
QMUINavigationControllerAppearanceDelegate,
WMMenuViewDelegate>

@property(nonatomic, strong) MView *loginVerticalLineView;


@end

@implementation MLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setUpView];
    [self setUpData];
}

- (void)setUpView
{
    self.titleSizeNormal = 16;
    self.titleSizeSelected = 23;
    self.titleColorNormal = MShallowGrayColor;
    self.titleColorSelected = HexColor(0x333333);
    self.itemMargin = 20;
    self.automaticallyCalculatesItemWidths = YES;
    self.menuViewLayoutMode = WMMenuViewLayoutModeLeft;
}

- (void)setUpData
{
    self.titles = @[@"验证码登录", @"密码登录"];
    [self reloadData];
    self.selectIndex = 0;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
}

#pragma mark - WMPageControllerDataSource
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController
{
    return self.titles.count;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index
{
    switch (index)
    {
        case 0:
        {
            return [MVerifyCodeLoginViewController new];
        }
            break;
            
        case 1:
        {
            return [MPassWordLoginViewController new];
        }
            break;
    }
    return nil;
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index
{
    return self.titles[index];
}

#pragma mark - WMPageControllerDelegate

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView
{
    CGRect menuRect = [self pageController:pageController preferredFrameForMenuView:self.menuView];
    CGFloat originY = CGRectGetMaxY(menuRect);
    CGFloat sizeHeight = self.view.height - originY;
    return CGRectMake(0, originY, self.view.width, sizeHeight);
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView
{
    return CGRectMake(0, self.qmui_navigationBarMaxYInViewCoordinator, self.view.width, 44);
}

- (void)pageController:(WMPageController *)pageController didEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info
{
    NSInteger index = [[info objectForKey:@"index"] integerValue];
    
    WMMenuItem * item0 = [self.menuView itemAtIndex:0];
    WMMenuItem * item1 = [self.menuView itemAtIndex:1];
    CGFloat margin = index == 0 ? 20 + item1.width - 2: item0.width + 20;
    [UIView animateWithDuration:0.1f animations:^{
        
        self.loginVerticalLineView.left = margin;
    }];
}

#pragma mark - WMMenuViewDelegate

- (void)menuView:(WMMenuView *)menu didLayoutItemFrame:(WMMenuItem *)menuItem atIndex:(NSInteger)index
{
    if (index == 0)
    {
        self.loginVerticalLineView.left = menuItem.right + 15;
    }
}

#pragma mark - QMUINavigationControllerAppearanceDelegate

- (NSString *)backBarButtonItemTitleWithPreviousViewController:(UIViewController *)viewController
{
    return MCommon_back;
}

#pragma mark - getter setter

- (MView *)loginVerticalLineView
{
    if (!_loginVerticalLineView)
    {
        _loginVerticalLineView = [MViewGenerater lineViewWithLineType:MLineTypeBold lineStyle:MLineStyleVertical colorType:MLineColorTypeNormal];
        _loginVerticalLineView.height = 20;
        _loginVerticalLineView.centerY = self.menuView.height/2;
        [self.menuView addSubview:_loginVerticalLineView];
    }
    return _loginVerticalLineView;
}

@end
