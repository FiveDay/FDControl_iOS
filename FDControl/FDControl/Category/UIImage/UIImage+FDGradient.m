//
//  UIImage+FDGradient.m
//  FDControl
//
//  Created by zhangyu528 on 2019/1/3.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "UIImage+FDGradient.h"

@implementation UIImage (FDGradient)

+ (UIImage*)imageLinearGradientWithRect:(CGRect)rect param:(FDLinearGradientParam)param {
    CIFilter *ciFilter = [CIFilter filterWithName:@"CILinearGradient"];
    CIVector *vector0 = [CIVector vectorWithX:rect.size.width * param.startPoint.x Y:rect.size.height * (1 - param.startPoint.y)];
    CIVector *vector1 = [CIVector vectorWithX:rect.size.width * param.endPoint.x Y:rect.size.height * (1 - param.endPoint.y)];
    [ciFilter setValue:vector0 forKey:@"inputPoint0"];
    [ciFilter setValue:vector1 forKey:@"inputPoint1"];
    [ciFilter setValue:[CIColor colorWithCGColor:param.startColor] forKey:@"inputColor0"];
    [ciFilter setValue:[CIColor colorWithCGColor:param.endColor] forKey:@"inputColor1"];
    
    CIImage *ciImage = ciFilter.outputImage;
    CIContext *con = [CIContext contextWithOptions:nil];
    CGImageRef resultCGImage = [con createCGImage:ciImage
                                         fromRect:rect];
    UIImage *resultUIImage = [UIImage imageWithCGImage:resultCGImage];
    CGImageRelease(resultCGImage);
    return resultUIImage;
}

+ (UIImage*)imageRadialGradientWithRect:(CGRect)rect param:(FDRadialGradientParam)param {
    CIFilter* ciFilter = [CIFilter filterWithName:@"CIRadialGradient"];
    [ciFilter setValue:@(param.startRadius) forKey:@"inputRadius0"];
    [ciFilter setValue:@(param.endRadius) forKey:@"inputRadius1"];
    [ciFilter setValue:[CIColor colorWithCGColor:param.startColor] forKey:@"inputColor0"];
    [ciFilter setValue:[CIColor colorWithCGColor:param.endColor] forKey:@"inputColor1"];
    CIVector *vectorCenter = [CIVector vectorWithX:rect.size.width * param.centerPoint.x Y:rect.size.height * (1 - param.centerPoint.y)];
    [ciFilter setValue:vectorCenter forKey:kCIInputCenterKey];
    
    CIImage *ciImage = ciFilter.outputImage;
    CIContext *con = [CIContext contextWithOptions:nil];
    CGImageRef resultCGImage = [con createCGImage:ciImage
                                         fromRect:rect];
    UIImage *resultUIImage = [UIImage imageWithCGImage:resultCGImage];
    CGImageRelease(resultCGImage);
    return resultUIImage;
}
@end
