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
    
    FLVStack* main = [[FLVStack alloc]init:FLHorizontalAlignmentCenter content:^(UIView * _Nonnull content) {
        [[FLVStack alloc]init:FLHorizontalAlignmentLeading content:^(UIView * _Nonnull content) {
            [UIView new].layoutTo(content)
            .width(150)
            .height(50)
            .backgroundColor([UIColor redColor]);
            
            [UIView new].layoutTo(content)
            .width(50)
            .height(50)
            .backgroundColor([UIColor yellowColor]);
            
            [UIView new].layoutTo(content)
            .width(200)
            .height(50)
            .backgroundColor([UIColor blueColor]);
        }]
        .backgroundColor([UIColor grayColor])
        .width(self.view.bounds.size.width)
        .height(self.view.bounds.size.height/3)
        .layoutTo(content);
        
        [[FLVStack alloc]init:FLHorizontalAlignmentCenter content:^(UIView * _Nonnull content) {
            [UIView new].layoutTo(content)
            .width(150)
            .height(50)
            .backgroundColor([UIColor redColor]);
            
            [UIView new].layoutTo(content)
            .width(50)
            .height(50)
            .backgroundColor([UIColor yellowColor]);
            
            [UIView new].layoutTo(content)
            .width(200)
            .height(50)
            .backgroundColor([UIColor blueColor]);
        }]
        .backgroundColor([UIColor lightGrayColor])
        .width(self.view.bounds.size.width)
        .height(self.view.bounds.size.height/3)
        .layoutTo(content);
        
        [[FLVStack alloc]init:FLHorizontalAlignmentTrailing content:^(UIView * _Nonnull content) {
            [UIView new].layoutTo(content)
            .width(150)
            .height(50)
            .backgroundColor([UIColor redColor]);
            
            [UIView new].layoutTo(content)
            .width(50)
            .height(50)
            .backgroundColor([UIColor yellowColor]);
            
            [UIView new].layoutTo(content)
            .width(200)
            .height(50)
            .backgroundColor([UIColor blueColor]);
        }]
        .backgroundColor([UIColor grayColor])
        .width(self.view.bounds.size.width)
        .height(self.view.bounds.size.height/3)
        .layoutTo(content);
    }]
    .backgroundColor([UIColor blackColor])
    .width(self.view.bounds.size.width)
    .height(self.view.bounds.size.height).layoutTo(self.view);
    
    [main applyLayout];
}

@end
