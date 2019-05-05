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
#import "FDControl.h"

@interface FDRect180UpDownAni ()
@property(assign, nonatomic)NSUInteger rectNum;
@property(assign, nonatomic)CGFloat rectWidth;
@property(assign, nonatomic)CGFloat rectMargin;
@property(strong, nonatomic)NSMutableArray<CALayer*>* rectLayers;
@end

@implementation FDRect180UpDownAni

- (instancetype)initWithWidth:(CGFloat)width
                       margin:(CGFloat)margin
                          num:(NSUInteger)num {
    if (self = [super init]) {
        _rectWidth = width;
        _rectMargin = margin;
        _rectNum = num;
        
        self.mask = [CALayer new];
        self.colors = @[(__bridge id)[UIColor colorWithHexString:@"#ff0000"].CGColor,
                        (__bridge id)[UIColor colorWithHexString:@"#fff200"].CGColor,
                        (__bridge id)[UIColor colorWithHexString:@"#1e9600"].CGColor];
        self.startPoint = CGPointZero;
        self.endPoint = CGPointMake(1, 1);
        _rectLayers = [NSMutableArray new];
        for (int index = 0; index < _rectNum; index++) {
            CALayer* rect = [CALayer new];
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
    for (int index = 0; index < _rectNum; index++) {
        self.rectLayers[index].frame
        = CGRectMake(self.rectMargin + index * self.rectWidth + index * self.rectMargin,
                     self.frame.size.height,
                     self.rectWidth,
                     0);
    }
    [CATransaction commit];
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
