//
//  FDCoreGraphicColor.m
//  KeyApp
//
//  Created by zhangyu528 on 2019/10/22.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDCoreGraphicColor.h"
#import "FDCoreGraphicColorSpace.h"

@interface FDCoreGraphicColor ()
@property(assign, nonatomic)CGColorRef colorRef;
@end

@implementation FDCoreGraphicColor

//Creates a color using a list of intensity values (including alpha) and an associated color space.
- (instancetype)init:(FDCoreGraphicColorSpace*)space components:(const CGFloat*)components {
    if (self = [super init]) {
        _colorRef = CGColorCreate(space.colorSpaceRef, components);
        if (!_colorRef) return nil;
    }
    return self;
}

- (instancetype)init:(CGColorRef)color {
    if (self = [super init]) {
        _colorRef = CGColorRetain(color);
        if (!_colorRef) return nil;
    }
    return self;
}

//Creates a copy of an existing color, substituting a new alpha value.
- (instancetype)init:(CGColorRef)color alpha:(CGFloat)alpha {
    if (self = [super init]) {
        _colorRef = CGColorCreateCopyWithAlpha(color, alpha);
        if (!_colorRef) return nil;
    }
    return self;
}

//Creates a color using a list of intensity values (including alpha), a pattern color space, and a pattern.
- (instancetype)init:(CGColorSpaceRef)space pattern:(CGPatternRef)pattern components:(const CGFloat*)components {
    if (self = [super init]) {
        _colorRef = CGColorCreateWithPattern(space, pattern, components);
        if (!_colorRef) return nil;
    }
    return self;
}

- (void)dealloc {
    CGColorRelease(self.colorRef);
}

- (BOOL)isEqualColor:(FDCoreGraphicColor*)color {
    return CGColorEqualToColor(self.colorRef, color.colorRef);
}

- (CGFloat)getAlpha {
    return CGColorGetAlpha(self.colorRef);
}

- (CGColorSpaceRef)getColorSpace {
    return CGColorGetColorSpace(self.colorRef);
}

- (const CGFloat*)getColorComponents {
    return CGColorGetComponents(self.colorRef);
}

- (size_t)getNumberOfComponents {
    return CGColorGetNumberOfComponents(self.colorRef);
}

- (CGPatternRef)getPatter {
    return CGColorGetPattern(self.colorRef);
}
@end
