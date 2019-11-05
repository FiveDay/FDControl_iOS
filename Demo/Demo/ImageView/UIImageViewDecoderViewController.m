//
//  UIImageViewDecoderViewController.m
//  Demo
//
//  Created by zhang nan on 2019/4/11.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "UIImageViewDecoderViewController.h"
#import <FDControl/FDControl.h>

@interface UIImageViewDecoderViewController ()

@end

@implementation UIImageViewDecoderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor grayColor];
    
    //[test4] image独立解码测试
    UIImageView* decodeImageView = [UIImageView new];
//    decodeImageView.top = 150;
//    decodeImageView.width = 100;
//    decodeImageView.height = 100;
    [self.view addSubview:decodeImageView];
    NSString* jpgFilePath = [[NSBundle mainBundle]pathForResource:@"testimage" ofType:@"jpg"];
    UIImage* originImage = [UIImage imageWithContentsOfFile:jpgFilePath];
    if (originImage) {
        [decodeImageView fd_asyncSetImageOnMainThread:originImage];
    }
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
