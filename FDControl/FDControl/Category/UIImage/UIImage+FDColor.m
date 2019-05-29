//
//  UIImage+FDColor.m
//  FDControl
//
//  Created by zhang nan on 2019/1/23.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "UIImage+FDColor.h"

@implementation UIImage (FDColor)

+ (UIImage* _Nullable)imageWithColor:(UIColor*)color andSize:(CGSize)size
{
    if (size.width < 0.001 || size.height < 0.001 || !color) {
        //size太小，认为区域是无效值
        return nil;
    }
    
    //设置1piexel矩形区域
    CGRect fillRect = (CGRect){0.0,0.0,size};
    
    //打开context
    UIGraphicsBeginImageContext(fillRect.size);
    
    //获取当前cgcontext句柄
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //设置context的填充颜色
    CGContextSetFillColorWithColor(context, color.CGColor);
    
    //填充context的颜色
    CGContextFillRect(context, fillRect);
    
    //将当前context转成Image
    UIImage* cgCreatedImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭context
    UIGraphicsEndImageContext();
    
    return cgCreatedImage;
}

@end
