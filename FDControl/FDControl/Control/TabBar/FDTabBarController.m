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
@property(assign, nonatomic)FDTabBarType type;
@end


@implementation FDTabBarController

@dynamic tabBar;

- (instancetype)init {
    if (self = [self initWithType:TabBarDefaultType]) {
    }
    return self;
}

- (instancetype)initWithType:(FDTabBarType)type {
    if (self = [super init]) {
        _type = type;
        switch (self.type) {
            case TabBarMidButtonType:
                self.tabBar = [FDTabBar new];
                [self setValue:self.tabBar forKey:@"tabBar"];
                break;
            default:
                break;
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (UIButton*)midButton {
    return self.tabBar.midButton;
}

@end
