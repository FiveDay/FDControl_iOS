//
//  FDRect180UpDownAni.m
//  FDControl
//
//  Created by zhangyu528 on 2019/4/29.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDRect180UpDownAni.h"
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface FDRect180UpDownAni ()
@property(assign, nonatomic)NSUInteger rectNum;
@property(assign, nonatomic)CGColorRef tintColor;
@property(assign, nonatomic)CGFloat rectWidth;
@property(assign, nonatomic)CGFloat rectMargin;
@property(strong, nonatomic)NSMutableArray<CAGradientLayer*>* rectLayers;
//@property(strong, nonatomic)NSMutableArray<NSNumber*>* frequencyDatas;
@end

@implementation FDRect180UpDownAni

- (instancetype)initWithColor:(CGColorRef)color
                        width:(CGFloat)width
                       margin:(CGFloat)margin
                          num:(NSUInteger)num {
    if (self = [super init]) {
        _tintColor = color;
        _rectWidth = width;
        _rectMargin = margin;
        _rectNum = num;
        
        _rectLayers = [NSMutableArray new];
        for (int index = 0; index < _rectNum; index++) {
            CAGradientLayer* rect = [CAGradientLayer new];
            rect.colors = @[(__bridge id)_tintColor,
                                      (__bridge id)[UIColor colorWithRed:14.f/255 green:52.f/255 blue:67.f/255 alpha:1.0f].CGColor];
            rect.locations = @[@0.6, @1.0];
            [self addSublayer:rect];
            [_rectLayers addObject:rect];
        }
    }
    return self;
}

- (void)updateData:(NSMutableArray<NSNumber*>*) frequencyDatas {
    for (int index = 0; index < frequencyDatas.count; index ++) {
        if ((index + 1) > self.rectNum) {
            break;
        }
        self.rectLayers[index].frame
        = CGRectMake(self.rectMargin + index * self.rectWidth + index * self.rectMargin,
                     self.frame.size.height,
                     self.rectWidth,
                     self.frame.size.height * -frequencyDatas[index].floatValue);
    }
}
@end
