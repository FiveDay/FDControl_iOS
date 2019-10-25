//
//  FDCoreGraphicBitmap.m
//  KeyApp
//
//  Created by zhangyu528 on 2019/10/22.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDCoreGraphicBitmap.h"


@interface FDCoreGraphicBitmap ()
@property(assign, nonatomic)CGContextRef context;
@end

@implementation FDCoreGraphicBitmap

- (instancetype)initWithRGBA:(size_t)width height:(size_t)height {
    if (self = [super init]) {
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        size_t bitsPerComponent = 8;
        CGBitmapInfo bitmapInfo = kCGBitmapByteOrder32Host | kCGImageAlphaPremultipliedFirst;
        _context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, 0, colorSpace, bitmapInfo);
        CGColorSpaceRelease(colorSpace);
        if (!_context) return nil;
    }
    return self;
}

- (instancetype)initWithCGImageRef:(CGImageRef)imageRef {
    if (self = [super init]) {
        CGImageAlphaInfo alphaInfo = CGImageGetAlphaInfo(imageRef) & kCGBitmapAlphaInfoMask;
        BOOL hasAlpha = NO;
        if (alphaInfo == kCGImageAlphaPremultipliedLast ||
            alphaInfo == kCGImageAlphaPremultipliedFirst ||
            alphaInfo == kCGImageAlphaLast ||
            alphaInfo == kCGImageAlphaFirst) {
            hasAlpha = YES;
        }
        CGBitmapInfo bitmapInfo = kCGBitmapByteOrder32Host;
        bitmapInfo |= hasAlpha ? kCGImageAlphaPremultipliedFirst : kCGImageAlphaNoneSkipFirst;
        size_t width = CGImageGetWidth(imageRef);
        size_t height = CGImageGetHeight(imageRef);
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        size_t bitsPerComponent = 8;
        CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, 0, colorSpace, bitmapInfo);
        CGColorSpaceRelease(colorSpace);
        if (!context) return nil;
        CGContextDrawImage(context, CGRectMake(0, 0, width, height), imageRef); // decode
    }
    return self;
}

- (void)dealloc {
    CGContextRelease(self.context);
}

- (CGImageRef)getImageRef {
    return CGBitmapContextCreateImage(self.context);
}

- (void*)getData {
    return  CGBitmapContextGetData(self.context);
}

- (size_t)getWidth {
    return CGBitmapContextGetWidth(self.context);
}

- (size_t)getHeight {
    return CGBitmapContextGetHeight(self.context);
}

- (CGColorSpaceRef)getColorSpace {
    return CGBitmapContextGetColorSpace(self.context);
}

- (size_t)getBitesPerComponnent {
    return CGBitmapContextGetBitsPerComponent(self.context);
}

- (size_t)getBitsPerPixel {
    return CGBitmapContextGetBitsPerPixel(self.context);
}

- (size_t)getBytesPerRow {
    return CGBitmapContextGetBytesPerRow(self.context);
}

- (CGBitmapInfo)getBitmapInfo {
    return CGBitmapContextGetBitmapInfo(self.context);
}

- (CGImageAlphaInfo)getImageAlphaInfo {
    return CGBitmapContextGetAlphaInfo(self.context);
}
@end
