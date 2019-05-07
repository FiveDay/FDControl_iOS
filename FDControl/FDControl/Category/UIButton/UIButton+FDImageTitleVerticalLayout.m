//
//  UIButton+FDImageTitleVerticalLayout.m
//  FDControl
//
//  Created by zhangyu528 on 2019/4/19.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "UIButton+FDImageTitleVerticalLayout.h"
#import "FDVerticalButton.h"

@implementation UIButton (FDImageTitleVerticalLayout)

+ (UIButton*)buttonWithVerticalType {
    FDVerticalButton* button = [FDVerticalButton new];
    return button;
}
@end
