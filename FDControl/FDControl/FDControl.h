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

//FDActivityIndicator Control
#import <FDControl/FDActivityIndicatorView.h>
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

//UIImageView Category
#import <FDControl/UIImageView+FDImageCoder.h>

#else

//FDActivityIndicator Control
#import "FDActivityIndicatorView.h"
//UIImage WebImage Control
#import "UIImageView+FDWebImageView.h"

//Cache Control
#import "FDDiskCache.h"
#import "FDMemoryCache.h"

//Category
#import "UIView+FDLayout.h"
#import "NSString+FDOperator.h"
#import "NSString+FDMD5.h"
#import "NSString+FDFileDirectory.h"
#import "UIColor+FDColor.h"
#import "UIImageView+FDImageCoder.h"
#endif
