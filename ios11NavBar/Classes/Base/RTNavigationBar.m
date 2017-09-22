//
//  RTNavigationBar.m
//  ios11NavBar
//
//  Created by ColaBean on 2017/7/4.
//  Copyright © 2017年 ColaBean. All rights reserved.
//

#import "RTNavigationBar.h"
#import "RTDeviceHardware.h"

@implementation RTNavigationBar

+ (RTNavigationBar *)defaultBar {
    RTNavigationBar *nav = nil;
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    BOOL ret = [RTDeviceHardware iPhoneXDevice];
    nav = [[RTNavigationBar alloc] initWithFrame:(CGRect){0, ret?44:20, screenWidth ,44}];
    return nav;
}

- (void)layoutSubviews {
    [super layoutSubviews];
#if TARGET_OS_IOS
    for (UIView *aView in self.subviews) {
        if ([@[@"_UINavigationBarBackground", @"_UIBarBackground"] containsObject:NSStringFromClass([aView class])]) {
            aView.frame = CGRectMake(0, -CGRectGetMinY(self.frame), CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)+CGRectGetMinY(self.frame));
        }
    }
#endif
    
}

- (void)safeAreaInsetsDidChange {
    
}

@end
