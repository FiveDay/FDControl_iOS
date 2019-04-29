//
//  AudioFrequencySpectrumViewController.m
//  Demo
//
//  Created by zhangyu528 on 2019/4/28.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "AudioFrequencySpectrumViewController.h"
#import <FDControl/FDControl.h>

@interface AudioFrequencySpectrumViewController ()

@end

@implementation AudioFrequencySpectrumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    FDFrequencySpectrumIndicatorConfig* config = [FDFrequencySpectrumIndicatorConfig new];
    config.frequencyNum = @45;
    FDFrequencySpectrumIndicator* indicator = [[FDFrequencySpectrumIndicator alloc]initWithConfig:config];
    indicator.frame = CGRectMake(0, 100, self.view.frame.size.width, 300);
    [self.view addSubview:indicator];
    [indicator startTest];
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
