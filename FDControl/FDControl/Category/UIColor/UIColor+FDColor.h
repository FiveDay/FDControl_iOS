//
//  UIColor+FDColor.h
//  FDControl
//
//  Created by zhangyu528 on 2018/12/11.
//  Copyright © 2018 zhangyu528. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (FDColor)

+ (instancetype)colorWithRgba:(CGFloat)r g:(CGFloat)g b:(CGFloat)b alpha:(CGFloat)a;

+ (instancetype)colorWithRgb:(CGFloat)r g:(CGFloat)g b:(CGFloat)b;

+ (instancetype)colorWithHsba:(CGFloat)h s:(CGFloat)s b:(CGFloat)b alpha:(CGFloat)a;

+ (instancetype)colorWithHsb:(CGFloat)h s:(CGFloat)s b:(CGFloat)b;

@end
