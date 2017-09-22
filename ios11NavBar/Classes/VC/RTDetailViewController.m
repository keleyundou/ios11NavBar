//
//  RTDetailViewController.m
//  ios11NavBar
//
//  Created by ColaBean on 2017/9/22.
//  Copyright © 2017年 ColaBean. All rights reserved.
//

#import "RTDetailViewController.h"

@interface RTDetailViewController ()

@end

@implementation RTDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self->nav removeFromSuperview];
    if (@available(iOS 11.0, *)) {
        self.navigationController.navigationBar.prefersLargeTitles = NO;
    } else {
        // Fallback on earlier versions
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
