//
//  ViewController.m
//  Demo
//
//  Created by zhangyu528 on 2018/12/11.
//  Copyright © 2018 zhangyu528. All rights reserved.
//

#import "ViewController.h"

#import <FDControl/FDControl.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    FDActivityIndicatorView* activity = [[FDActivityIndicatorView alloc]initWithFrame:CGRectMake(100, 200, 100, 100)];
    [self.view addSubview:activity];
    [activity startAnimating];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
