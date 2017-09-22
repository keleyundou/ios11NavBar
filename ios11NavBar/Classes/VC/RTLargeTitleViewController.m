//
//  RTLargeTitleViewController.m
//  ios11NavBar
//
//  Created by ColaBean on 2017/7/4.
//  Copyright © 2017年 ColaBean. All rights reserved.
//

#import "RTLargeTitleViewController.h"
#import "RTDetailViewController.h"

@interface RTLargeTitleViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation RTLargeTitleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.extendedLayoutIncludesOpaqueBars = YES;
    if (@available(iOS 11, *)) {
        self.tableView.estimatedRowHeight = 0;
        self.tableView.estimatedSectionFooterHeight = 0;
        self.tableView.estimatedSectionHeaderHeight = 0;
        
        //adapt iPhone X
//        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//        UIEdgeInsets edges = UIEdgeInsetsMake(88, 0, 49+34, 0);
//        self.tableView.contentInset = edges;
//        self.tableView.scrollIndicatorInsets = edges;
        
//        self.tableView.insetsLayoutMarginsFromSafeArea = NO;
        NSLog(@"%@", NSStringFromUIEdgeInsets(self.tableView.safeAreaInsets));
        NSLog(@"%@", NSStringFromUIEdgeInsets(self.tableView.contentInset));
    }
    self.navigationItem.title = @"xxxx";
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"reload" style:UIBarButtonItemStylePlain target:self action:@selector(refresh)];
    self.navigationItem.rightBarButtonItem = item;
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (@available(iOS 11.0, *)) {
        self.navigationController.navigationBar.prefersLargeTitles = YES;
    } else {
        // Fallback on earlier versions
    }
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
    UIViewController *vc = [[RTDetailViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
