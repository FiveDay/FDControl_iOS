//
//  UserGuideDemoViewController.m
//  Demo
//
//  Created by zhangyu528 on 2019/5/8.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "UserGuideDemoViewController.h"
#import <FDControl/FDControl.h>

@interface UserGuideDemoViewController ()

@end

@implementation UserGuideDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIImage* img01 = [UIImage imageNamed:@"01"];
    UIImage* img02 = [UIImage imageNamed:@"02"];
    UIImage* img03 = [UIImage imageNamed:@"03"];
    UIImage* img04 = [UIImage imageNamed:@"04"];
    FDUserGuideView* guide = [[FDUserGuideView alloc]initWithImages:@[img01, img02, img03, img04]];
    [self.view addSubview:guide];
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
