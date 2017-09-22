//
//  RTTabBarController.m
//  ios11NavBar
//
//  Created by ColaBean on 2017/9/21.
//  Copyright © 2017年 ColaBean. All rights reserved.
//

#import "RTTabBarController.h"
#import "RTDeviceHardware.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@implementation RTTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    //TODO: modify tabbar's y value.
    if ([RTDeviceHardware iPhoneXDevice]) {
        CGFloat deltaTabBarY = SCREEN_HEIGHT - CGRectGetHeight(self.tabBar.frame);
        self.tabBar.frame = (CGRect){0, deltaTabBarY, self.tabBar.bounds.size};
    }
}

@end
