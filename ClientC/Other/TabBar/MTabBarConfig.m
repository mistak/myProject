//
//  MTabBarConfig.m
//  ClientC
//
//  Created by mistak on 2018/8/7.
//  Copyright © 2018年 no. All rights reserved.
//

#import "MTabBarConfig.h"
#import "MNavigationViewController.h"
#import "MHomeViewController.h"
#import "MCommunicateViewController.h"
#import "MCourseViewController.h"
#import "MMineViewController.h"

@interface MTabBarConfig ()

@property(nonatomic, strong, readwrite) MTabBarViewController *tabBarViewController;

@end

@implementation MTabBarConfig

- (MTabBarViewController *)tabBarViewController
{
    if (!_tabBarViewController)
    {
        _tabBarViewController = [MTabBarViewController tabBarControllerWithViewControllers:[self viewControllers] tabBarItemsAttributes:[self tabBarAttributes]];
    }
    return _tabBarViewController;
}

- (NSArray <UIViewController *>*)viewControllers
{
    UIViewController *home = [[MNavigationViewController alloc]
                                        initWithRootViewController:[MHomeViewController new]];
    
    UIViewController *communicate = [[MNavigationViewController alloc]
                                        initWithRootViewController:[MCommunicateViewController new]];
    
    UIViewController *course = [[MNavigationViewController alloc]
                                       initWithRootViewController:[MCourseViewController new]];
    
    UIViewController *mine = [[MNavigationViewController alloc]
                                    initWithRootViewController:[MMineViewController new]];
    
    return @[
             home,
             communicate,
             course,
             mine
             ];
}

- (NSArray <NSDictionary *>*)tabBarAttributes
{
    NSDictionary *dict1 = @{
                            CYLTabBarItemTitle : @"首页",
//                            CYLTabBarItemImage : @"tabBar_home_default",
//                            CYLTabBarItemSelectedImage : @"tabBar_home_active",
                            };
    NSDictionary *dict2 = @{
                            CYLTabBarItemTitle : @"通话",
//                            CYLTabBarItemImage : @"tabBar_moment_default",
//                            CYLTabBarItemSelectedImage : @"tabBar_moment_active",
                            };
    
    NSDictionary *dict3 = @{
                            CYLTabBarItemTitle : @"课程",
//                            CYLTabBarItemImage : @"tabBar_study_default",
//                            CYLTabBarItemSelectedImage : @"tabBar_study_active",
                            };
    
    NSDictionary *dict4 = @{
                            CYLTabBarItemTitle : @"我的",
//                            CYLTabBarItemImage : @"tabBar_option_default",
//                            CYLTabBarItemSelectedImage : @"tabBar_option_active",
                            };
    
    NSArray *tabBarItemsAttributes = @[
                                       dict1,
                                       dict2,
                                       dict3,
                                       dict4
                                       ];
    return tabBarItemsAttributes;
}

@end
