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
#import "FDControl.h"

@interface FDRect360UpDownAni ()
@property(assign, nonatomic)CGFloat radius;
@property(assign, nonatomic)NSUInteger rectNum;
@property(assign, nonatomic)CGColorRef tintColor;
@property(assign, nonatomic)CGFloat rectWidth;
@property(strong, nonatomic)NSMutableArray<CALayer*>* rectLayers;
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
        
        self.mask = [CALayer new];
        self.colors = @[(__bridge id)[UIColor colorWithHexString:@"#ff0000"].CGColor,
                        (__bridge id)[UIColor colorWithHexString:@"#fff200"].CGColor,
                        (__bridge id)[UIColor colorWithHexString:@"#1e9600"].CGColor];
        self.startPoint = CGPointZero;
        self.endPoint = CGPointMake(1, 1);
        _rectLayers = [NSMutableArray new];
        //弧度
        CGFloat angle = (360.f / self.rectNum)*M_PI/180;

        for (int index = 0; index < _rectNum; index++) {
            CALayer* rect = [CALayer new];
            CGAffineTransform transform = CGAffineTransformMakeRotation(angle*index);
            rect.affineTransform = transform;
            rect.anchorPoint = CGPointMake(0.5, 1);
            rect.backgroundColor = [UIColor whiteColor].CGColor;
            [self.mask addSublayer:rect];
            [_rectLayers addObject:rect];
        }
    }
    return self;
}

- (void)layoutSublayers {
    [super layoutSublayers];
    
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    CGFloat angle = 360.f / self.rectNum;
    CGPoint center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    for (int index = 0; index < _rectNum; index++) {
        CGPoint position = [self calcCircleCoordinateWithCenter:center andWithAngle:angle*index andWithRadius:self.radius];
        self.rectLayers[index].frame
        = CGRectMake(position.x,
                     position.y,
                     0,
                     0);
        self.rectLayers[index].bounds
        = CGRectMake(0, 0, self.rectWidth, 0);
    }
    [CATransaction commit];
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
        = CGRectMake(0, 0, self.rectWidth, -100 * frequencyDatas[index].floatValue);
    }
}

- (CGPoint) calcCircleCoordinateWithCenter:(CGPoint) center  andWithAngle : (CGFloat) angle andWithRadius: (CGFloat) radius{
    CGFloat x2 = radius*sinf(angle*M_PI/180);//radius*sinf(angle*M_PI/180);//radius*cosf(angle*M_PI/180);
    CGFloat y2 = radius*cosf(angle*M_PI/180);//radius*(1-cosf(angle*M_PI/180));//radius*sinf(angle*M_PI/180);
    return CGPointMake(center.x+x2, center.y-y2);
}
@end
