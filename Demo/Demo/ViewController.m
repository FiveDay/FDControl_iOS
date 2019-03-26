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
    
    UIImageView* webImageView = [UIImageView new];
    webImageView.top = 200;
    webImageView.width = 100;
    webImageView.height = 100;
    [webImageView fd_setImageWithURL:[NSURL URLWithString:@"http://www.pptbz.com/pptpic/UploadFiles_6909/201203/2012031220134655.jpg"] placeholderImage:nil];
    [self.view addSubview:webImageView];
    
    NSString* string = [NSString new];
    string = @"";
    NSString* md5 = [string fd_toMD5String16];
    NSLog(@"md5:%@", md5);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
