//
//  HTTabBarControllerConfig.m
//  HeartTrip
//
//  Created by 熊彬 on 16/9/18.
//  Copyright © 2016年 BinBear. All rights reserved.
//

#import "HTTabBarControllerConfig.h"
#import "MainHomeController.h"
#import "FindHomeController.h"
#import "PreferredHomeController.h"
#import "RecipesHomeController.h"
#import "MineHomeController.h"
#import "HTConfigBaseNavigationController.h"
#import "ViewModelServicesImpl.h"
#import "MainHomeViewModel.h"

@interface HTTabBarControllerConfig ()

@property (nonatomic, readwrite, strong) HTCustomTabBarController *tabBarController;
/**
 *  数据服务
 */
@property (strong, nonatomic) ViewModelServicesImpl *viewModelService;
/**
 *  首页viewModel
 */
@property (strong, nonatomic) MainHomeViewModel *mainHomeViewModel;


@end

@implementation HTTabBarControllerConfig
/**
 *  懒加载tabBarController
 *
 */
- (HTCustomTabBarController *)tabBarController
{
    return LAZYLOAD(_tabBarController, ({
    
        HTCustomTabBarController *tabBarController = [HTCustomTabBarController tabBarControllerWithViewControllers:self.viewControllersForController tabBarItemsAttributes:self.tabBarItemsAttributesForController];
        
        // tabBarItem 的选中和不选中文字和背景图片属性、tabbar 背景图片属性
        [self customizeTabBarAppearance:tabBarController];
        tabBarController;
    }));
}

- (NSArray *)viewControllersForController {
    
    // 数据服务
    self.viewModelService = [[ViewModelServicesImpl alloc] initModelServiceImpl];
    
    // 首页
    self.mainHomeViewModel = [[MainHomeViewModel alloc] initWithServices:self.viewModelService];
    

    
    MainHomeController *firstViewController = [[MainHomeController alloc] initWithViewModel:self.mainHomeViewModel];
    HTConfigBaseNavigationController *firstNavigationController = [[HTConfigBaseNavigationController alloc]
                                                   initWithRootViewController:firstViewController];

    // 发现
    
    RecipesHomeController*financingViewController = [[RecipesHomeController alloc] init];
    HTConfigBaseNavigationController *secondNavigationController = [[HTConfigBaseNavigationController alloc]
                                                    initWithRootViewController:financingViewController];
    
    // 目的地
    FindHomeController *destinationViewController = [[FindHomeController alloc] init];
    
    HTConfigBaseNavigationController *thirdNavigationController = [[HTConfigBaseNavigationController alloc]
                                                   initWithRootViewController:destinationViewController];
    
    // 我的
    MineHomeController *meViewController = [[MineHomeController alloc] init];
    HTConfigBaseNavigationController *fourNavigationController = [[HTConfigBaseNavigationController alloc]
                                                  initWithRootViewController:meViewController];
    
    NSArray *viewControllers = @[
                                 firstNavigationController,
                                 secondNavigationController,
                                 thirdNavigationController,
                                 fourNavigationController
                                 ];
    return viewControllers;
}


/**
 *  设置TabBarItem的属性，包括 title、Image、selectedImage。
 */
- (NSArray *)tabBarItemsAttributesForController{
    
    NSDictionary *dict1 = @{
                            HTTabBarItemTitle : @"城市游",
                            HTTabBarItemImage : @"root_tab_recommand_25x25_",
                            HTTabBarItemSelectedImage : @"root_tab_recommand_hl_25x25_",
                            };
    NSDictionary *dict2 = @{
                            HTTabBarItemTitle : @"发现",
                            HTTabBarItemImage : @"root_tab_discover_25x25_",
                            HTTabBarItemSelectedImage : @"root_tab_discover_hl_25x25_",
                            };
    NSDictionary *dict3 = @{
                            HTTabBarItemTitle : @"目的地",
                            HTTabBarItemImage : @"root_tab_msg_25x25_",
                            HTTabBarItemSelectedImage : @"root_tab_msg_hl_25x25_",
                            };
    NSDictionary *dict4 = @{
                            HTTabBarItemTitle : @"我的",
                            HTTabBarItemImage : @"root_tab_me_25x25_",
                            HTTabBarItemSelectedImage : @"root_tab_me_hl_25x25_",
                            };
    NSArray *tabBarItemsAttributes = @[
                                       dict1,
                                       dict2,
                                       dict3,
                                       dict4
                                       ];
    return tabBarItemsAttributes;
}

/**
 *  tabBarItem 的选中和不选中文字和背景图片属性、tabbar 背景图片属性的设置
 */
- (void)customizeTabBarAppearance:(HTCustomTabBarController *)tabBarController {
    
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] =  SetColor(74, 189, 204);
    
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    //去除 TabBar 自带的顶部阴影
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    
}

@end
