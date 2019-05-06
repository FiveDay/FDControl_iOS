//
//  RouterDemoViewController.m
//  Demo
//
//  Created by zhangyu528 on 2019/4/15.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "RouterDemoViewController.h"
#import <FDControl/FDControl.h>

@interface RouterDemoViewController ()
@end

@implementation RouterDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    UIButton* pushA = [UIButton new];
    [pushA setTitle:@"/Router/aRed" forState:UIControlStateNormal];
    pushA.backgroundColor = [UIColor redColor];
    [pushA addTarget:self action:@selector(onPushA) forControlEvents:UIControlEventTouchUpInside];
    pushA.frame = CGRectMake(0, 200, 100, 60);
    [self.view addSubview:pushA];
    
    UIButton* pushB = [UIButton new];
    pushB.backgroundColor = [UIColor greenColor];
    [pushB setTitle:@"FDControlDemo://localhost/Router/bGreen" forState:UIControlStateNormal];
    [pushB addTarget:self action:@selector(onPushB) forControlEvents:UIControlEventTouchUpInside];
    pushB.frame = CGRectMake(0, 300, 100, 60);
    [self.view addSubview:pushB];
    
    UIButton* pushC = [UIButton new];
    pushC.backgroundColor = [UIColor redColor];
    [pushC setTitle:@"aRed" forState:UIControlStateNormal];
    [pushC addTarget:self action:@selector(onPushC) forControlEvents:UIControlEventTouchUpInside];
    pushC.frame = CGRectMake(0, 400, 100, 60);
    [self.view addSubview:pushC];
    
    UIButton* presentD = [UIButton new];
    presentD.backgroundColor = [UIColor redColor];
    [presentD setTitle:@"presentD:/Router/aRed?colorId=123&name=kinno" forState:UIControlStateNormal];
    [presentD addTarget:self action:@selector(onPresentD) forControlEvents:UIControlEventTouchUpInside];
    presentD.frame = CGRectMake(0, 500, 100, 60);
    [self.view addSubview:presentD];
}

- (void)onPushA {
    [self.navigationController navTo:@"/Router/aRed?colorId=123&name=kinno"];
}

- (void)onPushB {
    NSURL* url = [NSURL URLWithString:@"FDControlDemo://localhost/Router/bGreen"];
    [self.navigationController navToUrl:url];
}

- (void)onPushC {
    [self.navigationController navToName:@"aRed" param:@{@"colorId":@"153"}];
}

- (void)onPresentD {
    [self.navigationController presentTo:@"/Router/aRed?colorId=123&name=kinno"];
}
@end
