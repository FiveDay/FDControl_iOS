//
//  FDCoreGraphicGradient.m
//  KeyApp
//
//  Created by zhangyu528 on 2019/10/24.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDCoreGraphicGradient.h"
#import "FDCoreGraphicColorSpace.h"
#import "NSArray+FDCoreGraphicPattern.h"

@interface FDCoreGraphicGradient ()
@property(assign, nonatomic)CGGradientRef gradientRef;
@end

@implementation FDCoreGraphicGradient

- (instancetype)initWithGradientRef:(CGGradientRef)ref {
    if (self = [super init]) {
        _gradientRef = ref;
        CGGradientRetain(_gradientRef);
    }
    return self;
}

- (instancetype)initWithColorComponents:(FDCoreGraphicColorSpace*)space components:(NSArray<NSNumber*>*)components locations:(NSArray<NSNumber*>*)locations {
    if (self = [super init]) {
        CGFloat* cmp = [components toFloats];
        CGFloat* loc = [locations toFloats];
        _gradientRef = CGGradientCreateWithColorComponents(space.colorSpaceRef, cmp, loc, locations.count);
    }
    return self;
}

- (void)dealloc {
    CGGradientRelease(self.gradientRef);
}
@end
