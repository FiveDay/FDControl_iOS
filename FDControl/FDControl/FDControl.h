//
//  FDControl.h
//  FDControl
//
//  Created by zhangyu528 on 2018/12/11.
//  Copyright © 2018 zhangyu528. All rights reserved.
//

#import <UIKit/UIKit.h>

#if __has_include(<FDControl/FDControl.h>)
//! Project version number for FDControl.
FOUNDATION_EXPORT double FDControlVersionNumber;

//! Project version string for FDControl.
FOUNDATION_EXPORT const unsigned char FDControlVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <FDControl/PublicHeader.h>

#import <FDControl/UIView+FDLayout.h>
#import <FDControl/NSString+FDOperator.h>
#else
#import "UIView+FDLayout.h"
#import "NSString+FDOperator.h"
#endif
