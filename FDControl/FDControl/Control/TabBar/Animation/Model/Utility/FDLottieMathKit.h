//
//  FDLottieMathKit.h
//  FDControl
//
//  Created by zhangyu528 on 2019/5/23.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

NS_ASSUME_NONNULL_BEGIN

@interface FDLottieMathKit : NSObject

+ (CGPoint)addPointA:(CGPoint)pointA pointB:(CGPoint)pointB;
+ (CGPoint)subtractPointA:(CGPoint)pointA pointB:(CGPoint)pointB;

@end

NS_ASSUME_NONNULL_END
