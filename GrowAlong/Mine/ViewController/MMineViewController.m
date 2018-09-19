//
//  MMineViewController.m
//  GrowAlong
//
//  Created by mistak on 2018/8/7.
//  Copyright © 2018年 no. All rights reserved.
//

#import "MMineViewController.h"

#import "MMineHeaderView.h"
#import "MMineTableViewCell.h"

@interface MMineViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;

@property(nonatomic, strong) MMineHeaderView *headerView;

@property(nonatomic, strong) NSArray *dataSource;

@end

@implementation MMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    [self setUpView];
    [self setUpData];
}

- (void)setUpView
{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[MMineTableViewCell class] forCellReuseIdentifier:[MMineTableViewCell reuserIdentifier]];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.headerView = [[MMineHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.qmui_navigationBarMaxYInViewCoordinator+150)];
    self.tableView.tableHeaderView = self.headerView;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.headerView.size = CGSizeMake(self.view.width, StatusBarHeight + NavigationBarHeight + 150);
    self.tableView.frame = CGRectSetY(self.view.bounds, -StatusBarHeight);
}

- (void)setUpData
{
    [self.headerView setData:[[MUserManager sharedInstance] userInfo]];
    
    MMineItem * studyItem = [[MMineItem alloc] initWithType:MMineCellTypeStudy];
    MMineItem * downloadItem = [[MMineItem alloc] initWithType:MMineCellTypeDownload];
    MMineItem * collectionItem = [[MMineItem alloc] initWithType:MMineCellTypeCollection];
    
    self.dataSource = @[studyItem, downloadItem, collectionItem];
    [self.tableView reloadData];
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MMineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[MMineTableViewCell reuserIdentifier]];
    cell.item = [self.dataSource objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
