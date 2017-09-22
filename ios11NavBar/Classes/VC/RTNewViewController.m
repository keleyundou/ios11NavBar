//
//  RTNewViewController.m
//  ios11NavBar
//
//  Created by ColaBean on 2017/7/4.
//  Copyright © 2017年 ColaBean. All rights reserved.
//

#import "RTNewViewController.h"
#import "RTListViewController.h"

@interface RTNewViewController ()

@end

@implementation RTNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController setNavigationBarHidden:YES];
    self.view.backgroundColor = [UIColor brownColor];
    [self setNavTitle:@">=iOS11"];

    //crash.
//    UIView *greenView = [UIView new];
//    greenView.translatesAutoresizingMaskIntoConstraints = NO;
//
//    UILayoutGuide *margins = self.view.layoutMarginsGuide;
//    [NSLayoutConstraint activateConstraints:
//     @[
//       [greenView.leadingAnchor constraintEqualToAnchor:margins.leadingAnchor],
//       [greenView.trailingAnchor constraintEqualToAnchor:margins.trailingAnchor],
//       ]];
//
//    if (@available(iOS 11, *)) {
//        UILayoutGuide *guide = self.view.safeAreaLayoutGuide;
//        [NSLayoutConstraint activateConstraints:
//         @[
//           [greenView.topAnchor constraintEqualToSystemSpacingBelowAnchor:guide.topAnchor multiplier:1.0],
//           [guide.bottomAnchor constraintEqualToSystemSpacingBelowAnchor:greenView.bottomAnchor multiplier:1.0]
//           ]];
//    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)pushAction:(id)sender {
    UIViewController *vc = [[RTListViewController alloc] init];
    //TODO: 此处在iPhone X上运行会导致TabBar上移，解决方案：@RTTabBarController
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    NSLog(@"DidLayout-containerView: %@", NSStringFromCGRect(self.view.frame));
    
}

- (void)viewSafeAreaInsetsDidChange {
    [super viewSafeAreaInsetsDidChange];
    if (@available(iOS 11.0, *)) {
        NSLog(@"viewSafeAreaInsetsDidChange:%@", NSStringFromUIEdgeInsets(self.view.safeAreaInsets));
    } else {
        // Fallback on earlier versions
    }
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
