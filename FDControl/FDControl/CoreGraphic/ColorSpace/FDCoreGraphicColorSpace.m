//
//  FDCoreGraphicColorSpace.m
//  KeyApp
//
//  Created by zhangyu528 on 2019/10/24.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDCoreGraphicColorSpace.h"

@interface FDCoreGraphicColorSpace ()
@property(assign, nonatomic)CGColorSpaceRef colorSpaceRef;
@end

@implementation FDCoreGraphicColorSpace

- (instancetype)initWithColorSpaceRef:(CGColorSpaceRef)ref {
    if (self = [super init]) {
        _colorSpaceRef = ref;
        CGColorSpaceRetain(_colorSpaceRef);
    }
    return self;
}

//Creating Device-Independent Color Spaces

//Creates a calibrated grayscale color space.
- (instancetype)initWithCalibratedGray:(const CGFloat*)whitePoint blackPoint:(const CGFloat*)blackPoint gamma:(CGFloat)gamma {
    if (self = [super init]) {
        _colorSpaceRef = CGColorSpaceCreateCalibratedGray(whitePoint, blackPoint, gamma);
        if (!_colorSpaceRef) return  nil;
    }
    return self;
}

- (instancetype)initWithCalibratedRGB {
    if (self = [super init]) {
        
    }
    return self;
}

- (instancetype)initWithICCBased {
    if (self = [super init]) {
        
    }
    return self;
}

- (instancetype)initWithLab {
    if (self = [super init]) {
        
    }
    return self;
}

//Creating Generic or Device-Dependent Color Spaces

//Creates a device-dependent CMYK color space.
- (instancetype)initWithDeviceCMYK {
    if (self = [super init]) {
        _colorSpaceRef = CGColorSpaceCreateDeviceCMYK();
    }
    return self;
}

//Creates a device-dependent grayscale color space.
- (instancetype)initWithDeviceGray {
    if (self = [super init]) {
        _colorSpaceRef = CGColorSpaceCreateDeviceGray();
    }
    return self;
}

//Creates a device-dependent RGB color space.
- (instancetype)initWithDeviceRGB {
    if (self = [super init]) {
        _colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    }
    return self;
}

//Creates a platform-specific color space.
- (instancetype)initWithPlatformColorSpace:(const void*)ref {
    if (self = [super init]) {
        _colorSpaceRef =  CGColorSpaceCreateWithPlatformColorSpace(ref);
    }
    return self;
}

//Creating Special Color Spaces

//Creates an indexed color space, consisting of colors specified by a color lookup table.
- (instancetype)initWithIndexed {
    if (self = [super init]) {
        
    }
    return self;
}

//Creates a pattern color space.
- (instancetype)initWithPattern:(CGColorSpaceRef)baseSpace {
    if (self = [super init]) {
        _colorSpaceRef = CGColorSpaceCreatePattern(baseSpace);
    }
    return self;
}

//Creates a specified type of Quartz color space.
- (instancetype)initWithName {
    if (self = [super init]) {
        
    }
    return self;
}

//Getting Information About Color Spaces

//Returns a copy of the ICC profile of the provided color space.
- (nullable CFDataRef)copyICCProfile {
    return CGColorSpaceCopyICCProfile(self.colorSpaceRef);
}
//Returns a copy of the ICC profile data of the provided color space.
- (nullable CFDataRef)copyICCData {
    if (@available(iOS 10.0, *)) {
        return CGColorSpaceCopyICCData(self.colorSpaceRef);
    } else {
        // Fallback on earlier versions
        return CGColorSpaceCopyICCProfile(self.colorSpaceRef);
    }
}

//Returns a Boolean indicating whether the color space can be used as a destination color space.
- (BOOL)isSupportsOutput {
    if (@available(iOS 10.0, *)) {
        return CGColorSpaceSupportsOutput(self.colorSpaceRef);
    } else {
        // Fallback on earlier versions
        return NO;
    }
}

//The color space to examine.
- (size_t)getNumberOfComponents {
    return CGColorSpaceGetNumberOfComponents(self.colorSpaceRef);
}

//Returns the Core Foundation type identifier for Quartz color spaces.
- (CFTypeID)getTypeID {
    return CGColorSpaceGetTypeID();
}

//Returns the color space model of the provided color space.
- (CGColorSpaceModel)getModel {
    return CGColorSpaceGetModel(self.colorSpaceRef);
}


//Returns whether the RGB color space covers a significant portion of the NTSC color gamut.
- (BOOL)isWideGamutRGB {
    if (@available(iOS 10.0, *)) {
        return CGColorSpaceIsWideGamutRGB(self.colorSpaceRef);
    } else {
        // Fallback on earlier versions
        return NO;
    }
}

//Returns the base color space of a pattern or indexed color space.

//Returns the number of entries in the color table of an indexed color space.

//Copies the entries in the color table of an indexed color space.


//Returns the name used to create the specified color space.
- (nullable NSString*)copyName {
    if (@available(iOS 10.0, *)) {
        return (__bridge NSString*)CGColorSpaceCopyName(self.colorSpaceRef);
    } else {
        // Fallback on earlier versions
        return nil;
    }
}
- (void)dealloc {
    CGColorSpaceRelease(self.colorSpaceRef);
}
@end
