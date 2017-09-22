//
//  RTListViewController.m
//  ios11NavBar
//
//  Created by ColaBean on 2017/9/22.
//  Copyright © 2017年 ColaBean. All rights reserved.
//

// Q: 经测试 当heightForRow：>200 刷新数据后 table滚动问题


#import "RTListViewController.h"
#import "RTDetailViewController.h"

@interface RTListViewController ()<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation RTListViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self updateData];
}

- (void)updateData {
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavTitle:@"list"];
    [self.view addSubview:self.tableView];
    
    [self fixOffset];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fixOffset {
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        // Fallback on earlier versions
    }
}

#pragma mark 👉 UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellIdentifier"];
    }
    cell.textLabel.text = @(indexPath.section).stringValue;
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

-  (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath {
    return 250;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section?10:0.01;
}

#pragma mark 👉 UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *vc = [[RTDetailViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"%@", NSStringFromCGPoint(self.tableView.contentOffset));
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self resetFrame:self.view.frame];
}

- (void)viewSafeAreaInsetsDidChange {
    [super viewSafeAreaInsetsDidChange];
    if (@available(iOS 11.0, *)) {
        NSLog(@"viewSafeAreaInsetsDidChange:%@", NSStringFromUIEdgeInsets(self.view.safeAreaInsets));
    } else {
        // Fallback on earlier versions
    }
}

- (void)resetFrame:(CGRect)frame {
    self.view.frame = frame;
    if (self.tableView) {
        self.tableView.frame = (CGRect){0, self.navMaxY, CGRectGetWidth(self.view.bounds), self.view.bounds.size.height-self.navMaxY};
    }
}

#pragma mark 👉 getter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 0.1)];
        //TODO: iOS 11之后，预估值有默认高度，如果不需要就设置0
        _tableView.estimatedRowHeight = 0;//这里需要吐槽下，如果不设置为0 就会出现刷新后偏移问题。
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.tableHeaderView = v;
        _tableView.tableFooterView = v;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    }
    return _tableView;
}

@end
