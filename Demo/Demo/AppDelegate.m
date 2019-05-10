//
//  AppDelegate.m
//  Demo
//
//  Created by zhangyu528 on 2018/12/11.
//  Copyright © 2018 zhangyu528. All rights reserved.
//

#import "AppDelegate.h"
#import <FDControl/FDControl.h>

#import "ViewController.h"
#import "RouterAViewController.h"
#import "RouterBViewController.h"

@interface AppDelegate ()
@property(nonatomic, strong) ViewController* mainVC;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    FDRouterRedirect redirect = ^(NSString* path){
        BOOL token = NO;
        if (token) {
            return path;
        }else {
            return @"Main/RouterDemo/bGreen";
        }
    };
    
    FDRouterRedirect redirect2 = ^(NSString* path){
        BOOL token = YES;
        if (token) {
            return path;
        }else {
            return @"Main/RouterDemo/aRed";
        }
    };
    NSSet* routes = [NSSet setWithArray:@[
          @{
              @"path":@"Main/UserGuideDemo",
              @"name":@"guide",
              @"component":@"UserGuideDemoViewController"
            },
          @{
              @"path":@"Main/RouterDemo",
              @"name":@"router",
              @"component":@"RouterDemoViewController",
            },
          @{
              @"path":@"Main/ButtonDemo",
              @"name":@"button",
              @"component":@"ButtonDemoViewController",
            },
          @{
              @"path":@"Main/WebJsDemo",
              @"name":@"webjs",
              @"component":@"WebJsDemoViewController",
            },
          @{
              @"path":@"Main/AudioFrequencyDemo",
              @"name":@"audio",
              @"component":@"AudioFrequencySpectrumDemoViewController"
            },
          //sub router
          @{
              @"path":@"Main/RouterDemo/aRed",
              @"component":@"RouterAViewController",
              @"name":@"aRed",
              @"redirect":redirect,
            },
            @{
              @"path":@"Main/RouterDemo/bGreen",
              @"component":@"RouterBViewController",
              @"redirect":redirect2,
            },
                                            ]];
    [UINavigationController registerRoutes:routes];
    
    CGRect frame = [[UIScreen mainScreen]bounds];
    self.window = [[UIWindow alloc]initWithFrame:frame];
    

    UITabBarController* tabCtl = [UITabBarController new];
    tabCtl.plusButton = [UIButton new];
    tabCtl.plusButton.image = [UIImage imageNamed:@"+"];
    tabCtl.plusButton.titleColor = [UIColor blackColor];
    
    ViewController* demo1 = [ViewController new];
    demo1.tabBarItem.title = @"Demo1";
    demo1.tabBarItem.image = [UIImage imageNamed:@"tabBarBtn1_01"];
    CAKeyframeAnimation *animation01 = [CAKeyframeAnimation animation];
    animation01.keyPath = @"transform.scale";
    animation01.values = @[@1.0,@1.3,@0.9,@1.15,@0.95,@1.02,@1.0];
    animation01.duration = 1;
    animation01.calculationMode = kCAAnimationCubic;
    demo1.tabBarItem.animation = animation01;

    [tabCtl addChildViewController:demo1];

    ViewController* demo2 = [ViewController new];
    demo2.tabBarItem.title = @"Demo2";
    demo2.tabBarItem.image = [UIImage imageNamed:@"tabBarBtn2_01"];
    demo2.tabBarItem.badgeValue = @"1";
    
    CAKeyframeAnimation *animation02 = [CAKeyframeAnimation animation];
    animation02.keyPath = @"transform.scale";
    animation02.values = @[@1.0,@1.3,@0.9,@1.15,@0.95,@1.02,@1.0];
    animation02.duration = 1;
    animation02.calculationMode = kCAAnimationCubic;
    demo2.tabBarItem.animation = animation02;
    
    [tabCtl addChildViewController:demo2];
        
    UINavigationController* rootVC = [[UINavigationController alloc]initWithRootViewController:tabCtl];
    self.window.rootViewController = rootVC;
    [self.window makeKeyAndVisible];
    
    return YES;
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
