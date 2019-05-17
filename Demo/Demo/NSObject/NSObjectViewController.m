//
//  NSObjectViewController.m
//  Demo
//
//  Created by zhangyu528 on 2019/5/16.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "NSObjectViewController.h"
#import <FDControl/FDControl.h>

@interface NSObjectViewController ()

@end

@implementation NSObjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [[self class] printInformation];
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
