//
//  UIButton+FDConvenientMethod.h
//  FDControl
//
//  Created by zhangyu528 on 2019/5/7.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (FDConvenientMethod)
@property(assign, nonatomic)CGFloat cornerRadius;
@property(assign, nonatomic)CGFloat borderWidth;
@property(strong, nonatomic, nullable)UIColor* borderColor;
@property(assign, nonatomic)CACornerMask cornerMask;
@property(copy, nonatomic, nullable)NSString* title;
@property(strong, nonatomic, nullable)UIColor* titleColor;
@property(strong, nonatomic, nullable)UIImage* image;
@property(strong, nonatomic, nullable)UIImage* backgroundImage;

@end

NS_ASSUME_NONNULL_END
