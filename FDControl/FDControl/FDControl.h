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

//Control
#import <FDControl/FDActivityIndicatorView.h>
#import <FDControl/UIImageView+FDWebImageView.h>
// Category
#import <FDControl/UIView+FDLayout.h>
#import <FDControl/NSString+FDOperator.h>
#import <FDControl/NSString+FDMD5.h>
#import <FDControl/NSString+FDFileDirectory.h>
#import <FDControl/UIColor+FDColor.h>
#else
//Control
#import "FDActivityIndicatorView.h"
#import "UIIMageView+FDWebImageView.h"
// Category
#import "UIView+FDLayout.h"
#import "NSString+FDOperator.h"
#import "NSString+FDMD5.h"
#import "NSString+FDFileDirectory.h"
#import "UIColor+FDColor.h"
#endif
