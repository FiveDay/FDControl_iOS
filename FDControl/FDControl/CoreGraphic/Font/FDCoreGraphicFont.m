//
//  FDCoreGraphicFont.m
//  KeyApp
//
//  Created by zhangyu528 on 2019/10/23.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDCoreGraphicFont.h"

@interface FDCoreGraphicFont ()
@property(assign, nonatomic)CGFontRef cgFont;
@end

@implementation FDCoreGraphicFont

- (instancetype)initWithFontRef:(CGFontRef)fontRef {
    if (self = [super init]) {
        _cgFont = fontRef;
        CGFontRetain(fontRef);
    }
    return self;
}

- (instancetype)initWithDataProvider:(CGDataProviderRef)provider {
    if (self = [super init]) {
        _cgFont = CGFontCreateWithDataProvider(provider);
        if (!_cgFont) return nil;
    }
    return self;
}

- (instancetype)initWithFontName:(NSString*)fontName {
    if (self = [super init]) {
        _cgFont = CGFontCreateWithFontName((__bridge CFStringRef)fontName);
        if (!_cgFont) return nil;
    }
    return self;
}

- (void)dealloc {
    CGFontRelease(self.cgFont);
}

//Getting Font Information
- (CFTypeID)getTypeID {
    return  CGFontGetTypeID();
}

- (NSArray*)copyVariationAxes {
    return (__bridge NSArray*)CGFontCopyVariationAxes(self.cgFont);
}

- (NSDictionary*)copyVariation {
    return (__bridge NSDictionary*)CGFontCopyVariations(self.cgFont);
}
@end
