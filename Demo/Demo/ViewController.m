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
    self.view.backgroundColor = [UIColor blackColor];
    
    FDActivityIndicatorView* ac1 = [FDActivityIndicatorView ballScaleWithRadius:30];
    ac1.tintColor = [UIColor greenColor];
    ac1.frame = CGRectMake(0, 100, 100, 100);
    [self.view addSubview:ac1];
    [ac1 startAnimating];
    
    FDActivityIndicatorView* ac2 = [FDActivityIndicatorView ballPulseWithRadius:10];
    ac2.frame = CGRectMake(ac1.right, 100, 100, 100);
    ac2.tintColor = [UIColor greenColor];
    [self.view addSubview:ac2];
    [ac2 startAnimating];
    
    FDActivityIndicatorView* ac3 = [FDActivityIndicatorView ballGridPulseWithRadius:10];
    ac3.frame = CGRectMake(ac2.right, 100, 100, 100);
    ac3.tintColor = [UIColor greenColor];
    [self.view addSubview:ac3];
    [ac3 startAnimating];
    
    FDActivityIndicatorView* ac4 = [FDActivityIndicatorView ballClipRotateRadius:60];
    ac4.frame = CGRectMake(ac3.right, 100, 100, 100);
    ac4.tintColor = [UIColor greenColor];
    [self.view addSubview:ac4];
    [ac4 startAnimating];
    
    FDActivityIndicatorView* ac5 = [FDActivityIndicatorView squareSpinWidth:60];
    ac5.frame = CGRectMake(0, ac1.bottom, 100, 100);
    ac5.tintColor = [UIColor greenColor];
    [self.view addSubview:ac5];
    [ac5 startAnimating];
    
    FDActivityIndicatorView* ac6 = [FDActivityIndicatorView triangleSkewSpinWithSize:CGSizeMake(60, 40)];
    ac6.frame = CGRectMake(ac5.right, ac1.bottom, 100, 100);
    ac6.tintColor = [UIColor greenColor];
    [self.view addSubview:ac6];
    [ac6 startAnimating];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
