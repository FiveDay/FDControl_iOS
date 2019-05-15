//
//  PlusButtonViewController.m
//  Demo
//
//  Created by zhangyu528 on 2019/5/14.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "PlusButtonViewController.h"
#import <FDControl/FDControl.h>

@interface PlusButtonViewController ()

@end

@implementation PlusButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    UIButton* close = [UIButton new];
    [close setTitle:@"close view controller" forState:UIControlStateNormal];
    close.backgroundColor = [UIColor greenColor];
    close.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
    [close sizeToFit];
    [self.view addSubview:close];
    [close addTarget:self action:@selector(onClose) forControlEvents:UIControlEventTouchUpInside];
}

- (void)onClose {
    [self dismissViewControllerAnimated:YES completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
