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
    
    FDActivityIndicatorView* ac1 = [[FDActivityIndicatorView alloc]initWithOrign:CGPointMake(0, 100) andBallScaleWithRadius:30];
    [self.view addSubview:ac1];
    [ac1 startAnimating];
    
    FDActivityIndicatorView* ac2 = [[FDActivityIndicatorView alloc]initWithOrign:CGPointMake(0, 200) andBallPulseWithRadius:10];
    [self.view addSubview:ac2];
    [ac2 startAnimating];
    
    FDActivityIndicatorView* ac3 = [[FDActivityIndicatorView alloc]initWithOrign:CGPointMake(0, 400) andBallGridPulseWithRadius:10];
    ac3.tintColor = [UIColor greenColor];
    [self.view addSubview:ac3];
    [ac3 startAnimating];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
