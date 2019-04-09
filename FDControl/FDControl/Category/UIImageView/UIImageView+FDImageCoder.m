//
//  FDimageCoder.m
//  FDControl
//
//  Created by zhang nan on 2019/4/8.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "UIImageView+FDImageCoder.h"

static const size_t kBitsPerComponent = 8;

@implementation UIImageView (FDImageCoder)

//是否对图片解码
+ (BOOL)shouldDecodeImage:(nullable UIImage*)image
{
    //如果图片为空，不解码
    if (!image) {
        return NO;
    }
    
    //如果图片为动图，不解码
    if (image.images != nil) {
        return NO;
    }
    
    return YES;
}

- (BOOL)fd_hasAlpha:(CGImageRef)imageRef
{
    if (!imageRef) {
        return NO;
    }
    
    CGImageAlphaInfo imageAlphaInfo = CGImageGetAlphaInfo(imageRef);
    
    BOOL hasAlphaInfo = !(kCGImageAlphaNone == imageAlphaInfo
                          || kCGImageAlphaNoneSkipLast == imageAlphaInfo
                          || kCGImageAlphaNoneSkipFirst == imageAlphaInfo);
    
    return hasAlphaInfo;
}

- (UIImage*)fd_DecompressedImageWithImage:(nullable UIImage*)image
{
    if (![[self class] shouldDecodeImage:image]) {
        return nil;
    }
    
    @autoreleasepool {
        CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
        
        CGImageRef imageRef = image.CGImage;
        
        //图片是否包含alpha信息
        BOOL hasAlphaInfo = [self fd_hasAlpha:imageRef];
        
        //参考：https://blog.csdn.net/jeffasd/article/details/80571366
        //CGBitmapInfo由两部分取或运算组成
        //一部分是 指定 cpu使用的大小端模式
        //另一部分指定的是颜色空间中每个 bule green red alpha 的排列顺序。
        CGBitmapInfo bitmapInfo = kCGBitmapByteOrder32Host;
        //因为ios是小端模式，所以是A在高位
        bitmapInfo |= hasAlphaInfo ? kCGImageAlphaPremultipliedFirst : kCGImageAlphaNoneSkipFirst;
        
        //在32位架构中被普遍定义为：
        //typedef   unsigned int size_t;
        //而在64位架构中被定义为：
        //typedef  unsigned long size_t;
        //size_t在32位架构上是4字节，在64位架构上是8字节，在不同架构上进行编译时需要注意这个问题。
        //而int在不同架构下都是4字节，与size_t不同；且int为带符号数，size_t为无符号数
        
        size_t width    = CGImageGetWidth(imageRef);
        size_t height   = CGImageGetHeight(imageRef);
        
        //http://www.voidcn.com/article/p-uatbaikl-tt.html
        CGContextRef contextRef = CGBitmapContextCreate(NULL,
                                                        width,
                                                        height,
                                                        kBitsPerComponent,
                                                        0,
                                                        colorSpaceRef,
                                                        bitmapInfo);
        if (contextRef == NULL) {
            return image;
        }
        
        CGContextDrawImage(contextRef, CGRectMake(0, 0, width, height), imageRef);
        
        //https://www.cnblogs.com/zkwarrior/p/5665216.html
        CGImageRef newImageRefWithoutAlpha = CGBitmapContextCreateImage(contextRef);
        UIImage* decodedImage = [UIImage imageWithCGImage:newImageRefWithoutAlpha scale:image.scale orientation:image.imageOrientation];
        
        CGContextRelease(contextRef);
        CGImageRelease(newImageRefWithoutAlpha);
        
        return decodedImage;
    }
    
    return nil;
}

- (void)fd_asyncDecompressedImageWithImage:(UIImage *)image completionHandler:(void (^)(UIImage * _Nonnull))completionHandler
{
    
}
@end
