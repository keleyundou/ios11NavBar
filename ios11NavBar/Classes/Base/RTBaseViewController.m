//
//  RTBaseViewController.m
//  ios11NavBar
//
//  Created by ColaBean on 2017/9/22.
//  Copyright © 2017年 ColaBean. All rights reserved.
//

#import "RTBaseViewController.h"
#import "RTNavigationBar.h"

@interface RTBaseViewController ()

@end

@implementation RTBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupNav];
    [self.view addSubview:nav];
    
    _navMaxY = CGRectGetMaxY(nav.frame);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 👉 setup

- (void)setupNav {
    nav = [RTNavigationBar defaultBar];
    nav.backgroundColor = [UIColor redColor];
    nav.barTintColor = [UIColor whiteColor];
    
    [self setupNavigationItem];
}

- (void)setupNavigationItem {
    //TODO: 给导航条添加Item
    navigationItem = [[UINavigationItem alloc] initWithTitle:@""];
    UIButton* left = [UIButton buttonWithType:UIButtonTypeCustom];
    [left setFrame:CGRectMake(0, 0, 40, 40)];
    [left setImage:[[UIImage imageNamed:@"common_btn_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [left setImageEdgeInsets:UIEdgeInsetsMake(0, /*0*/-23, 0, 0)];
    [left addTarget:self action:@selector(onBack) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* leftBtn = [[UIBarButtonItem alloc] initWithCustomView:left];
    [navigationItem setLeftBarButtonItem:leftBtn animated:NO];
    
    [nav pushNavigationItem:navigationItem animated:NO];
}

- (void)onBack{
    NSLog(@"touch onBack");
    if (self.navigationController.viewControllers.count > 1) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end

@implementation RTBaseViewController (Nav)

- (void)setNavTitle:(NSString *)title {
    [self->navigationItem setTitle:title];
}

@end
