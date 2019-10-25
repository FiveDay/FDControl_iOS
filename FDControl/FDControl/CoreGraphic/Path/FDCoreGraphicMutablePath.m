//
//  FDCoreGraphicMutablePath.m
//  KeyApp
//
//  Created by zhangyu528 on 2019/10/23.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDCoreGraphicMutablePath.h"

@interface FDCoreGraphicPath ()
@property(assign, nonatomic)CGPathRef cgPath;
@end

@interface FDCoreGraphicMutablePath ()
@property(assign, nonatomic)CGMutablePathRef cgMutablePath;

@end
@implementation FDCoreGraphicMutablePath

- (instancetype)init {
    if (self = [super init]) {
        _cgMutablePath = CGPathCreateMutable();
        self.cgPath = _cgMutablePath;
        if (!_cgMutablePath) return nil;
    }
    return self;
}

- (void)dealloc {
    CGPathRelease(self.cgMutablePath);
}

//Modifying Core Graphics Paths
//Appends an arc to a mutable graphics path, possibly preceded by a straight line segment.
- (void)addArc:(nullable const CGAffineTransform*)m x:(CGFloat)x y:(CGFloat)y radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise {
    CGPathAddArc(self.cgMutablePath, m, x, y, radius, startAngle, endAngle, clockwise);
}
@end
