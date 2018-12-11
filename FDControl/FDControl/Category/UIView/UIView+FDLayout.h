//
//  UIView+FDLayout.h
//  FDControl
//
//  Created by zhangyu528 on 2018/12/11.
//  Copyright © 2018 zhangyu528. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FDLayout)
@property(nonatomic)CGFloat left;
@property(nonatomic)CGFloat top;
@property(nonatomic)CGFloat right;
@property(nonatomic)CGFloat bottom;
@property(nonatomic)CGFloat width;
@property(nonatomic)CGFloat height;
@property(nonatomic)CGFloat centerX;
@property(nonatomic)CGFloat centerY;
@property(nonatomic)CGPoint orgin;
@property(nonatomic)CGSize size;
@end
