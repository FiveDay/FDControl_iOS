//
//  FDTabBarController.m
//  FDControl
//
//  Created by zhangyu528 on 2019/5/9.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDTabBarController.h"
#import "FDTabBar.h"

@interface FDTabBarController ()
@property(strong, nonatomic, nullable)FDTabBar* tabBar;
@end


@implementation FDTabBarController
@dynamic tabBar;

- (instancetype)init {
    if (self = [super init]) {
        self.tabBar = [FDTabBar new];
        [self setValue:self.tabBar forKey:@"tabBar"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setPlusButton:(UIButton *)plusButton {
    self.tabBar.plusButton = plusButton;
}

- (UIButton*)plusButton {
    return self.tabBar.plusButton;
}

@end
