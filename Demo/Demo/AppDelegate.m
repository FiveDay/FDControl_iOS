//
//  AppDelegate.m
//  Demo
//
//  Created by zhangyu528 on 2018/12/11.
//  Copyright © 2018 zhangyu528. All rights reserved.
//

#import "AppDelegate.h"
#import <FDControl/FDControl.h>

#import "RouterAViewController.h"
#import "RouterBViewController.h"
#import "Demo1ViewController.h"
#import "Demo2ViewController.h"
#import "Demo3ViewController.h"
#import "Demo4ViewController.h"

@interface FlexLayoutViewController : UIViewController

@end

@interface AppDelegate ()
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    

    [self registerRouter];
    
    CGRect frame = [[UIScreen mainScreen]bounds];
    self.window = [[UIWindow alloc]initWithFrame:frame];
    

    UITabBarController* tabCtl = [UITabBarController new];
    //设置tabBar透过
    tabCtl.tabBar.translucent = YES;
    //设置tabBarItem选中后image的合成颜色.
    tabCtl.tabBar.tintColor = [UIColor blueColor];
    //创建中间plusButton
    tabCtl.plusButton = [UIButton new];
    tabCtl.plusButton.image = [UIImage imageNamed:@"+"];
    //调整位plusButton的image向上拉伸20达到凸起到tabbar外.
    tabCtl.plusButton.imageEdgeInsets = UIEdgeInsetsMake(-30, 0, 0, 0);
    [tabCtl.plusButton addTarget:self action:@selector(onPlusButton) forControlEvents:UIControlEventTouchUpInside];
    //将子viewController添加到UITabBarController上.
    [tabCtl addChildViewController:[self demo1]];
    [tabCtl addChildViewController:[self demo2]];
    [tabCtl addChildViewController:[self demo3]];
    [tabCtl addChildViewController:[self demo4]];
    
    UINavigationController* rootVC = [[UINavigationController alloc]initWithRootViewController:[FlexLayoutViewController new]];
    self.window.rootViewController = rootVC;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)registerRouter {
    
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
              @"path":@"Main/FlexLayout",
              @"component":@"FlexLayoutViewController",
              @"name":@"flexlayout"
            },
          @{
              @"path":@"Main/NSObjectDemo",
              @"component":@"NSObjectViewController",
              @"name":@"nsobject"
            },

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
}

- (void)onPlusButton {
    [((UINavigationController*)self.window.rootViewController) presentTo:@"PlusButtonView"];
}

- (UIViewController*)demo1 {
    Demo1ViewController* demo = [Demo1ViewController new];
    demo.tabBarItem.title = @"Demo1";
    //设置非选中图片
    demo.tabBarItem.image = [UIImage imageNamed:@"tabBarBtn1_01"];
    return demo;
}

- (UIViewController*)demo2 {
    Demo2ViewController* demo = [Demo2ViewController new];
    demo.tabBarItem.lottieName = @"home";
//    demo.tabBarItem.title = @"Demo2";
//    //设置非选tabBarItem中图片
//    demo.tabBarItem.image = [UIImage imageNamed:@"tabBarBtn2_01"];
//    demo.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabBarBtn2_02"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    //设置tabBarItem 标题属性
//    [demo.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor blackColor],
//                                              } forState:UIControlStateSelected];
//    //设置红点提醒内容
//    demo.tabBarItem.badgeValue = @"1";
    return demo;
}

- (UIViewController*)demo3 {
    Demo3ViewController* demo = [Demo3ViewController new];
    demo.tabBarItem.title = @"Demo3";
    //设置非选中图片
    demo.tabBarItem.image = [UIImage imageNamed:@"tabBarBtn3_01"];
    demo.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabBarBtn3_02"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //tabBarItem选中背景色.
    demo.tabBarItem.selectedBgColor = [UIColor darkGrayColor];
    //tabBarItem dot显示
    demo.tabBarItem.isShowDot = YES;
    demo.tabBarItem.dotColor = [UIColor blueColor];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"transform.scale";
    animation.values = @[@1.0,@1.3,@0.9,@1.15,@0.95,@1.02,@1.0];
    animation.duration = 1;
    animation.calculationMode = kCAAnimationCubic;
    demo.tabBarItem.animation = animation;
    return demo;
}

- (UIViewController*)demo4 {
    Demo4ViewController* demo = [Demo4ViewController new];
    demo.tabBarItem.title = @"Demo4";
    //设置非选中图片
    demo.tabBarItem.image = [UIImage imageNamed:@"tab_home_normal"];
    //设置选中图片
    demo.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_home_00"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    NSMutableArray* list = [NSMutableArray new];
    for (int index = 0; index <= 50; index ++) {
        NSString* name = [NSString stringWithFormat:@"tab_home_%02d", index];
        UIImage* image = [UIImage imageNamed:name];
        [list addObject:image];
    }
    //设置选中帧动画图片
    demo.tabBarItem.animationImages = [list copy];
    return demo;
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
