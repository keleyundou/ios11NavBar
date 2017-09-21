//
//  OldViewController.m
//  ios11NavBar
//
//  Created by ColaBean on 2017/7/4.
//  Copyright © 2017年 ColaBean. All rights reserved.
//

#import "OldViewController.h"

@interface OldViewController ()

@end

@implementation OldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController setNavigationBarHidden:YES];
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    UINavigationBar *nav = [[UINavigationBar alloc] initWithFrame:(CGRect){0,0,screenWidth,64}];
    nav.backgroundColor = [UIColor redColor];
    nav.barTintColor = [UIColor greenColor];
    UINavigationItem* item = [[UINavigationItem alloc] initWithTitle:@"<iOS11"];
    
    [nav pushNavigationItem:item animated:NO];
    [self.view addSubview:nav];
    self.view.backgroundColor = [UIColor blueColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
