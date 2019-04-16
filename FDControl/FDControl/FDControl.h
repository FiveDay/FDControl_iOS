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
//Router
#import <FDControl/UINavigationController+FDRouter.h>
//Control
#import <FDControl/FDWebJsViewController.h>
#import <FDControl/FDActivityIndicatorView.h>
#import <FDControl/UIImageView+FDWebImageView.h>
#import <FDControl/FDDiskCache.h>
#import <FDControl/FDMemoryCache.h>

// Category
#import <FDControl/NSObject+FDPropertyMethod.h>
#import <FDControl/NSDictionary+FDJSONSerialization.h>
#import <FDControl/UIView+FDLayout.h>
#import <FDControl/NSString+FDOperator.h>
#import <FDControl/NSString+FDMD5.h>
#import <FDControl/NSString+FDFileDirectory.h>
#import <FDControl/UIColor+FDColor.h>
#import <FDControl/CAShapeLayer+FDShapeHelper.h>
#import <FDControl/UIImageView+FDImageCoder.h>
#import <FDControl/NSBundle+FDMainBundle.h>
#else
//Router
#import "UINavigationController+FDRouter.h"

//Control
#import "FDWebJsViewController.h"
#import "FDActivityIndicatorView.h"
#import "UIImageView+FDWebImageView.h"
#import "FDDiskCache.h"
#import "FDMemoryCache.h"

//Category
#import "NSObject+FDPropertyMethod.h"
#import "NSDictionary+FDJSONSerialization.h"
#import "UIView+FDLayout.h"
#import "NSString+FDOperator.h"
#import "NSString+FDMD5.h"
#import "NSString+FDFileDirectory.h"
#import "UIColor+FDColor.h"
#import "CAShapeLayer+FDShapeHelper.h"
#import "UIImageView+FDImageCoder.h"
#import "NSBundle+FDMainBundle.h"
#endif
