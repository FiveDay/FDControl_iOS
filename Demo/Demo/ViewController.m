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
    
    CGRect frame = CGRectMake(0, 100, 40, 40);
    FDActivityIndicatorView* ac1 = [[FDActivityIndicatorView alloc]initWithFrame:frame type:ballScale];
    [self.view addSubview:ac1];
    [ac1 startAnimating];
    
    frame = CGRectMake(50, 100, 40, 40);
    FDActivityIndicatorView* ac2 = [[FDActivityIndicatorView alloc]initWithFrame:frame type:ballPulse];
    [self.view addSubview:ac2];
    [ac2 startAnimating];
    
    frame = CGRectMake(100, 100, 40, 40);
    FDActivityIndicatorView* ac3 = [[FDActivityIndicatorView alloc]initWithFrame:frame type:ballGridPulse];
    [self.view addSubview:ac3];
    [ac3 startAnimating];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
