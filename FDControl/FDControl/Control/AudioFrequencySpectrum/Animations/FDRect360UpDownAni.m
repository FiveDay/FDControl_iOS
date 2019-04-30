//
//  FDRect360UpDownAni.m
//  FDControl
//
//  Created by zhangyu528 on 2019/4/29.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDRect360UpDownAni.h"
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface FDRect360UpDownAni ()
@property(assign, nonatomic)CGFloat radius;
@property(assign, nonatomic)NSUInteger rectNum;
@property(assign, nonatomic)CGColorRef tintColor;
@property(assign, nonatomic)CGFloat rectWidth;
@property(strong, nonatomic)NSMutableArray<CAGradientLayer*>* rectLayers;
@end

@implementation FDRect360UpDownAni

- (instancetype)initWithColor:(CGColorRef)color
                        width:(CGFloat)width
                          num:(NSUInteger)num {
    if (self = [super init]) {
        _tintColor = color;
        _radius = 80;
        _rectWidth = width;
        _rectNum = num;
        
        _rectLayers = [NSMutableArray new];
        CGFloat angle = 360.f / self.rectNum;
        for (int index = 0; index < _rectNum; index++) {
            CAGradientLayer* rect = [CAGradientLayer new];
            rect.colors = @[(__bridge id)_tintColor,
                            (__bridge id)[UIColor colorWithRed:14.f/255 green:52.f/255 blue:67.f/255 alpha:1.0f].CGColor];
            rect.locations = @[@0.6, @1.0];
            CGAffineTransform transform = CGAffineTransformMakeRotation(angle*index);
            rect.affineTransform = transform;
            [self addSublayer:rect];
            [_rectLayers addObject:rect];
        }
    }
    return self;
}

- (void)updateData:(NSMutableArray<NSNumber*>*) frequencyDatas {
    CGFloat angle = 360.f / self.rectNum;
    CGPoint center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    for (int index = 0; index < frequencyDatas.count; index ++) {
        if ((index + 1) > self.rectNum) {
            break;
        }
        CGPoint position = [self calcCircleCoordinateWithCenter:center andWithAngle:angle*index andWithRadius:self.radius];
        self.rectLayers[index].frame
        = CGRectMake(position.x,
                     position.y,
                     0,
                     0);
        self.rectLayers[index].bounds
        = CGRectMake(0, 0, self.rectWidth, -40 * frequencyDatas[index].floatValue);
    }
}

- (CGPoint) calcCircleCoordinateWithCenter:(CGPoint) center  andWithAngle : (CGFloat) angle andWithRadius: (CGFloat) radius{
    CGFloat x2 = radius*cosf(angle*M_PI/180);
    CGFloat y2 = radius*sinf(angle*M_PI/180);
    return CGPointMake(center.x+x2, center.y-y2);
}
@end
