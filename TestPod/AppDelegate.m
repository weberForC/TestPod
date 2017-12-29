//
//  AppDelegate.m
//  TestPod
//
//  Created by juanMac on 2017/6/21.
//  Copyright © 2017年 juanMac. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "WBTabbarController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "ForthViewController.h"
#import "FifthViewController.h"
#import "SixViewController.h"
#import "HtmlViewController.h"
#import "BaseNavigationController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeTabBarController) name:@"changeTabBarController" object:nil];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    ViewController *VC = [[ViewController alloc] init];
    FirstViewController *firstVC = [[FirstViewController alloc] init];
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    ThirdViewController *thirdVC = [[ThirdViewController alloc] init];
    
    NSArray *array = @[VC , firstVC , secondVC , thirdVC];
    NSMutableArray *VCArray = [NSMutableArray array];
    
    for (int i = 0; i < 4; i++) {
        UIViewController *vc = array[i];
        vc.navigationItem.title = [NSString stringWithFormat:@"第%d个VC",i];
        BaseNavigationController *baseNV = [[BaseNavigationController alloc] initWithRootViewController:vc];
        [VCArray addObject:baseNV];
    }
    
    WBTabbarController *tabbarVC = [[WBTabbarController alloc] initWithArray:@[@"第一个",@"第二个",@"第三个",@"第四个"]];
    tabbarVC.viewControllers = VCArray;
    self.window.rootViewController = tabbarVC;
    
    return YES;
}

- (void)changeTabBarController
{
    
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
