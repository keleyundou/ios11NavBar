//
//  NewViewController.m
//  ios11NavBar
//
//  Created by ColaBean on 2017/7/4.
//  Copyright © 2017年 ColaBean. All rights reserved.
//

#import "NewViewController.h"
#import "RTNavigationBar.h"

@interface NewViewController ()
{
    UINavigationBar *nav;
    UINavigationItem *navigationItem;
}
@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController setNavigationBarHidden:YES];
    self.view.backgroundColor = [UIColor brownColor];
    
    nav = [RTNavigationBar defaultBar];
    nav.backgroundColor = [UIColor redColor];
    nav.barTintColor = [UIColor whiteColor];

    [self.view addSubview:nav];
    
    [self setupNavigationItem];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupNavigationItem {
    //TODO: 给导航条添加Item
    navigationItem = [[UINavigationItem alloc] initWithTitle:@">=iOS11"];
    
    UIButton* left = [UIButton buttonWithType:UIButtonTypeCustom];
    [left setFrame:CGRectMake(0, 0, 40, 40)];
    [left setImage:[[UIImage imageNamed:@"common_btn_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [left setImageEdgeInsets:UIEdgeInsetsMake(0, /*0*/-23, 0, 0)];
    [left addTarget:self action:@selector(onBack:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* leftBtn = [[UIBarButtonItem alloc] initWithCustomView:left];
    [navigationItem setLeftBarButtonItem:leftBtn animated:NO];
    
    [nav pushNavigationItem:navigationItem animated:NO];
}

- (void)onBack:(UIButton *)sender {
    NSLog(@"touch onBack");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
