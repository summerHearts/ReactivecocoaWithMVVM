//
//  AppDelegate.m
//  ReactivecocoaWithMVVM
//
//  Created by Kenvin on 16/10/20.
//  Copyright © 2017年 上海方创金融信息服务股份有限公司. All rights reserved.
//

#import "AppDelegate.h"
#import "HTTabBarControllerConfig.h"
#import "IQKeyboardManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    
    /*
     滚动视图
     http://api.daydaycook.com.cn/daydaycook/server/ad/listAds.do?version=2.7.1&deviceId=329040BD-EA81-4209-BF43-C213850FDE9C&languageId=3&uid=192581&regionCode=156&mainland=1
     
     每日新菜馆
     http://api.daydaycook.com.cn/daydaycook/server/recipe/search.do?pageSize=10&currentPage=0&uid=192581&version=2.7.1&mainland=1&notheme=3&regionCode=156&languageId=3&deviceId=329040BD-EA81-4209-BF43-C213850FDE9C&username=3286288817
     
     分类
     http://api.daydaycook.com.cn/daydaycook/server/entrance/list.do?version=2.7.1&deviceId=329040BD-EA81-4209-BF43-C213850FDE9C&languageId=3&uid=192581&regionCode=156&mainland=1
     
     推荐
     http://api.daydaycook.com.cn/daydaycook/recommend/queryRecommendAll.do?deviceId=329040BD-EA81-4209-BF43-C213850FDE9C&password=&uid=192581&username=3286288817&mainland=1&version=2.7.1&languageId=3&regionCode=156
     */
    
    [self setRootController];
    
    
    [self configurationIQKeyboard];
    
    return YES;
}

- (void)setRootController{
    self.window = [[UIWindow alloc]init];
    self.window.frame = [UIScreen mainScreen].bounds;
    HTTabBarControllerConfig *tabBarControllerConfig = [[HTTabBarControllerConfig alloc] init];
    [self.window setRootViewController:tabBarControllerConfig.tabBarController];
    [self.window makeKeyAndVisible];
}


// 配置IQKeyboardManager
- (void)configurationIQKeyboard
{
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.enableAutoToolbar = NO;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
