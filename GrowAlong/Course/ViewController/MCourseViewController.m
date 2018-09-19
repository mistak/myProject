//
//  MCourseViewController.m
//  GrowAlong
//
//  Created by mistak on 2018/8/7.
//  Copyright © 2018年 no. All rights reserved.
//

#import "MCourseViewController.h"

#import "MCourseLearnedViewController.h"
#import "MCourseLearningViewController.h"
#import "MMessageCenterViewController.h"

@interface MCourseViewController ()<
WMPageControllerDelegate,
WMPageControllerDataSource,
WMMenuViewDelegate>

@end

@implementation MCourseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpData];
    [self setUpView];
}

- (void)setUpData
{
    self.titles = @[@"已学课程", @"正在进行", @"消息通知"];
}

- (void)setUpView
{
    self.navigationController.navigationBarHidden = YES;
    self.titleSizeNormal = 16;
    self.titleSizeSelected = 23;
    self.titleColorNormal = MShallowGrayColor;
    self.titleColorSelected = HexColor(0x333333);
    self.itemsMargins = @[@10,@15,@15,@15];
    self.automaticallyCalculatesItemWidths = YES;
    self.menuViewLayoutMode = WMMenuViewLayoutModeLeft;
    [self reloadData];
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
            return [[MCourseLearnedViewController alloc] init];
        }
            break;
            
        case 1:
        {
            return [[MCourseLearningViewController alloc] init];
        }
            break;
        case 2:
        {
            return [[MMessageCenterViewController alloc] init];
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
    return CGRectMake(0, StatusBarHeight, self.view.width, 44);
}

- (void)pageController:(WMPageController *)pageController didEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info
{
    NSInteger index = [[info objectForKey:@"index"] integerValue];

}


@end
