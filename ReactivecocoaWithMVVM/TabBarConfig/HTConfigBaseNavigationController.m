//
//  HTConfigBaseNavigationController.m
//  HeartTrip
//
//  Created by 熊彬 on 16/9/18.
//  Copyright © 2016年 BinBear. All rights reserved.
//

#import "HTConfigBaseNavigationController.h"
#import "UIBarButtonItem+HTBarButtonCustom.h"


@interface HTConfigBaseNavigationController ()

@end

@implementation HTConfigBaseNavigationController

#pragma mark - Life CyCle
- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - Public Method
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    [self setUpNavigationBarAppearance];
    
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.fd_interactivePopMaxAllowedInitialDistanceToLeftEdge = CGRectGetWidth([UIScreen mainScreen].bounds)/3;
        [self setUpCustomNavigationBarWithViewController:viewController];
    }
    [super pushViewController:viewController animated:YES];
}

#pragma mark - 设置全局的导航栏属性
- (void)setUpNavigationBarAppearance
{
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    
    NSDictionary *textAttributes = @{NSFontAttributeName:HTSetFont(@"SnellRoundhand-Black", 22),
                                     NSForegroundColorAttributeName: [UIColor blackColor]
                                    };
    
    [navigationBarAppearance setTitleTextAttributes:textAttributes];
    navigationBarAppearance.tintColor = [UIColor blackColor];
    navigationBarAppearance.barTintColor = [UIColor whiteColor];
}
- (void)setUpCustomNavigationBarWithViewController:(UIViewController *)viewController
{
    UIBarButtonItem * item = [UIBarButtonItem itemWithTarget: self action:@selector(btnLeftBtn) image:@"icon_nav_back_white_19x18_"  selectImage:@"icon_nav_back_white_19x18_"];
    viewController.navigationItem.leftBarButtonItem = item;
}
- (void)btnLeftBtn
{
    [self popViewControllerAnimated:YES];
}
#pragma mark - UIStatusBar
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}
@end
