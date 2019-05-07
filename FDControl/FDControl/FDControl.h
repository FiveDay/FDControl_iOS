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
#import <FDControl/FDWebJsViewController.h>
//FDActivityIndicator Control
#import <FDControl/FDActivityIndicatorView.h>
// Category
#import <FDControl/NSObject+FDPropertyMethod.h>
#import <FDControl/NSDictionary+FDJSONSerialization.h>
//UIImage WebImage Control
#import <FDControl/UIImageView+FDWebImageView.h>
//Cache Control
#import <FDControl/FDDiskCache.h>
#import <FDControl/FDMemoryCache.h>

//UIView Category
#import <FDControl/UIView+FDLayout.h>
//NSString Category
#import <FDControl/NSString+FDOperator.h>
#import <FDControl/NSString+FDMD5.h>
#import <FDControl/NSString+FDFileDirectory.h>
//UIColor Category
#import <FDControl/UIColor+FDColor.h>
#import <FDControl/CAShapeLayer+FDShapeHelper.h>
#import <FDControl/UIImage+FDColor.h>

//UIImageView Category
#import <FDControl/UIImageView+FDImageCoder.h>
#import <FDControl/UIButton+FDImageTitleVerticalLayout.h>
#import <FDControl/UIButton+FDConvenientMethod.h>
#import <FDControl/UIControl+FDTargetAction.h>
#else
//Control
#import "FDWebJsViewController.h"

//FDActivityIndicator Control
#import "FDActivityIndicatorView.h"
// Category
#import "NSObject+FDPropertyMethod.h"
#import "NSDictionary+FDJSONSerialization.h"
//UIImage WebImage Control
#import "UIImageView+FDWebImageView.h"

//Cache Control
#import "FDDiskCache.h"
#import "FDMemoryCache.h"

//Category
#import "UIControl+FDTargetAction.h"
#import "UIView+FDLayout.h"
#import "NSString+FDOperator.h"
#import "NSString+FDMD5.h"
#import "NSString+FDFileDirectory.h"
#import "UIColor+FDColor.h"
#import "CAShapeLayer+FDShapeHelper.h"
#import "UIImageView+FDImageCoder.h"
#import "UIImage+FDColor.h"
#import "UIButton+FDImageTitleVerticalLayout.h"
#import "UIButton+FDConvenientMethod.h"
#endif
