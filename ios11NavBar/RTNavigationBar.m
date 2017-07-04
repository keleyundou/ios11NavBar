//
//  RTNavigationBar.m
//  ios11NavBar
//
//  Created by ColaBean on 2017/7/4.
//  Copyright © 2017年 ColaBean. All rights reserved.
//

#import "RTNavigationBar.h"

@implementation RTNavigationBar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 11.0) {
        for (UIView *aView in self.subviews) {
            if ([NSStringFromClass([aView class]) isEqualToString:@"_UINavigationBarContentView"]) {
                aView.frame = CGRectMake(0, 20, CGRectGetWidth(aView.frame), CGRectGetHeight(aView.frame));
            } else {
                aView.frame = CGRectMake(0, 0, CGRectGetWidth(aView.frame), CGRectGetHeight(self.frame));
            }
        }
    }
    
}

- (void)safeAreaInsetsDidChange {
    
}

@end
