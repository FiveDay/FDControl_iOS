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
    
    FLVStack* vStack = [FLVStack new];
    
    [vStack contentView:^(UIView * _Nonnull content) {
        [UIView new].renderTo(content)
                    .width(50)
                    .height(50)
                    .backgroundColor([UIColor redColor]);
        
        [UIView new].renderTo(content)
                    .width(50)
                    .height(50)
                    .backgroundColor([UIColor yellowColor]);
        
        [UIView new].renderTo(content)
                    .width(50)
                    .height(50)
                    .backgroundColor([UIColor blueColor]);
        
//        [[FLVStack new].alignment(FLAlignFlexStart) contentView:^(UIView * _Nonnull content) {
//
//        }].renderTo(content)
//          .backgroundColor([UIColor yellowColor]);
    }].alignment(FLAlignFlexStart)
      .backgroundColor([UIColor grayColor])
      .width(self.view.bounds.size.width)
      .height(200)
      .renderTo(self.view);
    [vStack applyLayout];
}

@end
