//
//  FlexLayoutViewController.m
//  Demo
//
//  Created by zhangyu528 on 2019/11/5.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <FDControl/FDControl.h>

@interface FlexLayoutViewController : UIViewController

@end

@implementation FlexLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    #define WIDTH 60
    FLVStack* main = [[FLVStack alloc]init:FLHorizontalAlignmentCenter content:^(UIView * _Nonnull content) {
        [[FLVStack alloc]init:FLHorizontalAlignmentLeading content:^(UIView * _Nonnull content) {
            [UIView new].layoutTo(content)
            .size(WIDTH, WIDTH)
            .backgroundColor([UIColor redColor]);

            [UIView new].layoutTo(content)
            .size(WIDTH, WIDTH)
            .backgroundColor([UIColor yellowColor]);

            [UIView new].layoutTo(content)
            .size(WIDTH, WIDTH)
            .backgroundColor([UIColor blueColor]);
        }]
        .backgroundColor([UIColor grayColor])
        .size(self.view.bounds.size.width, self.view.bounds.size.height/3)
        .layoutTo(content);
        
        [[FLVStack alloc]init:FLHorizontalAlignmentCenter content:^(UIView * _Nonnull content) {
            [UIView new].layoutTo(content)
            .size(WIDTH, WIDTH)
            .backgroundColor([UIColor redColor]);

            [UIView new].layoutTo(content)
            .size(WIDTH, WIDTH)
            .backgroundColor([UIColor yellowColor]);

            [UIView new].layoutTo(content)
            .size(WIDTH, WIDTH)
            .backgroundColor([UIColor blueColor]);
        }]
        .backgroundColor([UIColor lightGrayColor])
        .size(self.view.bounds.size.width, self.view.bounds.size.height/3)
        .layoutTo(content);

        [[FLVStack alloc]init:FLHorizontalAlignmentTrailing content:^(UIView * _Nonnull content) {
            [UIView new].layoutTo(content)
            .size(WIDTH, WIDTH)
            .backgroundColor([UIColor redColor]);

            [UIView new].layoutTo(content)
            .size(WIDTH, WIDTH)
            .backgroundColor([UIColor yellowColor]);

            [UIView new].layoutTo(content)
            .size(WIDTH, WIDTH)
            .backgroundColor([UIColor blueColor]);
        }]
        .backgroundColor([UIColor grayColor])
        .size(self.view.bounds.size.width, self.view.bounds.size.height/3)
        .layoutTo(content);
    }]
    .backgroundColor([UIColor blackColor])
    .size(self.view.bounds.size.width, self.view.bounds.size.height);
    
    [self.view addSubview:main];
    
//    [main applyLayout];
}

@end
