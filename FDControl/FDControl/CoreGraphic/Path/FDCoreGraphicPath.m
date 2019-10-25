//
//  FDCoreGraphicPath.m
//  KeyApp
//
//  Created by zhangyu528 on 2019/10/23.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDCoreGraphicPath.h"

@interface FDCoreGraphicPath ()
@property(assign, nonatomic)CGPathRef cgPath;
@end

@implementation FDCoreGraphicPath

//Create an immutable path of an ellipse.
- (instancetype)initWithEllipseInRect:(CGRect)rect transform:(nullable const CGAffineTransform*)transform {
    if (self = [super init]) {
        _cgPath = CGPathCreateWithEllipseInRect(rect, transform);
        if (!_cgPath) return nil;
    }
    return self;
}
//Create an immutable path of a rectangle.
- (instancetype)initWithRect:(CGRect)rect transform:(nullable const CGAffineTransform*)transform {
    if (self = [super init]) {
        _cgPath = CGPathCreateWithRect(rect, transform);
        if (!_cgPath) return nil;
    }
    return self;
}

//Create an immutable path of a rounded rectangle.
- (instancetype)initWithRoundedRect:(CGRect)rect cornerWidth:(CGFloat)cornerWidth cornerHeight:(CGFloat)cornerHeight transform:(nullable const CGAffineTransform*)transform {
    if (self = [super init]) {
        _cgPath = CGPathCreateWithRoundedRect(rect, cornerWidth, cornerHeight, transform);
        if (!_cgPath) return nil;
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    FDCoreGraphicPath *model = [[FDCoreGraphicPath allocWithZone:zone] init];
    model.cgPath = CGPathCreateCopy(self.cgPath);
    return model;
}

- (FDCoreGraphicPath*)createCopyByTransformingPath:(nullable const CGAffineTransform*)transform {
    FDCoreGraphicPath* instance = [FDCoreGraphicPath new];
    instance.cgPath = CGPathCreateCopyByTransformingPath(self.cgPath, transform);
    return instance;
}

//Getting Information about Core Graphics Paths

//Indicates whether two graphics paths are equivalent.
- (BOOL)isEqualToPath:(FDCoreGraphicPath*)path {
    return CGPathEqualToPath(self.cgPath, path.cgPath);
}
//Returns the bounding box containing all points in a graphics path.
- (CGRect)getBoundingBox {
   return CGPathGetBoundingBox(self.cgPath);
}

//Returns the bounding box of a graphics path.
- (CGRect)getPathBoundingBox {
    return CGPathGetPathBoundingBox(self.cgPath);
}

//Returns the current point in a graphics path.
- (CGPoint)getCurrentPoint {
    return CGPathGetCurrentPoint(self.cgPath);
}

//Indicates whether or not a graphics path is empty.
- (BOOL)isEmpty {
    return CGPathIsEmpty(self.cgPath);
}

//Checks whether a point is contained in a graphics path.
- (BOOL)isContainsPoint:(nullable const CGAffineTransform*)m point:(CGPoint)point eoFill:(BOOL)eoFill {
    return CGPathContainsPoint(self.cgPath, m, point, eoFill);
}

//Indicates whether or not a graphics path represents a rectangle.
- (BOOL)isRect:(CGRect*)rect {
    return CGPathIsRect(self.cgPath, rect);
}
- (void)dealloc {
    CGPathRelease(self.cgPath);
}


@end
