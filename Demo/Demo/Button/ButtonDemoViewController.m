//
//  ButtonDemoViewController.m
//  Demo
//
//  Created by zhangyu528 on 2019/4/19.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "ButtonDemoViewController.h"
#import <FDControl/FDControl.h>

@interface ButtonDemoViewController ()

@end

@implementation ButtonDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton* vBtn = [UIButton buttonWithVerticalType];
    vBtn.frame = CGRectMake(0, 100, 100, 100);
//    UIImage* image = [UIImage imageNamed:@"image"];
//    [vBtn setImage:image forState:UIControlStateNormal];
//    [vBtn setTitle:@"abc" forState:UIControlStateNormal];
    vBtn.image = [UIImage imageNamed:@"image"];
    vBtn.title = @"abc";
    vBtn.backgroundImage = [UIImage createImageWithColor:[UIColor blueColor] andSize:vBtn.bounds.size];
    vBtn.cornerRadius = 4;
    [self.view addSubview:vBtn];

    vBtn.onClick = ^(UIControl * _Nonnull sender) {
        sender.backgroundColor = [UIColor redColor];
    };
}

@end
