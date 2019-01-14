//
//  UIColor+FDColor.h
//  FDControl
//
//  Created by zhangyu528 on 2018/12/11.
//  Copyright © 2018 zhangyu528. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (FDColor)
/**
 *  [in]: hexStr looks like RGB\RGBA\RRGGBB\RRGGBBAA, also has prefix with '#' or '0X' .
 */
+ (instancetype)colorWithHexString:(NSString *)hexStr;
@end
