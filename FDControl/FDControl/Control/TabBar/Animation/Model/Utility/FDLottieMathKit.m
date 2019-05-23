//
//  FDLottieMathKit.m
//  FDControl
//
//  Created by zhangyu528 on 2019/5/23.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDLottieMathKit.h"

@implementation FDLottieMathKit

+ (CGPoint)addPointA:(CGPoint)pointA pointB:(CGPoint)pointB {
    return CGPointMake(pointA.x + pointB.x, pointA.y + pointB.y);
}

+ (CGPoint)subtractPointA:(CGPoint)pointA pointB:(CGPoint)pointB {
    return CGPointMake(pointA.x - pointB.x, pointA.y - pointB.y);
}
@end
