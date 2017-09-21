//
//  ViewController.m
//  ios11NavBar
//
//  Created by ColaBean on 2017/7/4.
//  Copyright © 2017年 ColaBean. All rights reserved.
//

#import "ViewController.h"
#import "RTNavigationBar.h"
#import "NextViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    if (@available(iOS 11, *)) {
        self.navigationController.navigationBar.prefersLargeTitles = YES;
        self.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeAutomatic;
        self.tableView.estimatedRowHeight = 0;
        self.tableView.estimatedSectionFooterHeight = 0;
        self.tableView.estimatedSectionHeaderHeight = 0;
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        UIEdgeInsets edges = UIEdgeInsetsMake(88, 0, 49+34, 0);
        self.tableView.contentInset = edges;
        self.tableView.scrollIndicatorInsets = edges;
    }
    self.navigationItem.title = @"xxxx";
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"reload" style:UIBarButtonItemStylePlain target:self action:@selector(refresh)];
    self.navigationItem.rightBarButtonItem = item;
    self.extendedLayoutIncludesOpaqueBars = YES;
    NSLog(@"%@", NSStringFromUIEdgeInsets(self.tableView.contentInset));
    if (@available(iOS 11.0, *)) {
//        self.tableView.insetsLayoutMarginsFromSafeArea = NO;
        NSLog(@"%@", NSStringFromUIEdgeInsets(self.tableView.safeAreaInsets));
    } else {
        // Fallback on earlier versions
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self performSelector:@selector(refresh) withObject:nil afterDelay:1];
}

- (void)refresh {
    NSLog(@"xx");
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellIdentifier"];
    }
    cell.textLabel.text = @(indexPath.row).stringValue;
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

-  (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *vc = [[NextViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
