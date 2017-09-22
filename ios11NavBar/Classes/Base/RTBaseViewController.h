//
//  RTBaseViewController.h
//  ios11NavBar
//
//  Created by ColaBean on 2017/9/22.
//  Copyright © 2017年 ColaBean. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RTBaseViewController : UIViewController
{
    @protected
    UINavigationBar *nav;
    UINavigationItem *navigationItem;
}

@property (nonatomic, assign, readonly) CGFloat navMaxY;
- (void)onBack;

@end


@interface RTBaseViewController (Nav)

- (void)setNavTitle:(NSString *)title;

@end
