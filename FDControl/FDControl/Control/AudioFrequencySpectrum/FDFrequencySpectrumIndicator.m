//
//  FDFrequencySpectrumIndicator.m
//  FDControl
//
//  Created by zhangyu528 on 2019/4/26.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDFrequencySpectrumIndicator.h"
#import <QuartzCore/QuartzCore.h>

@implementation FDFrequencySpectrumIndicatorConfig
@end

@interface FDFrequencySpectrumIndicator ()
@property(strong, nonatomic)NSNumber* frequencyNum;
@property(strong, nonatomic)UIColor* tintColor;
@property(assign, nonatomic)CGFloat frequencyWidth;
@property(assign, nonatomic)CGFloat frequencyMargin;
@property(strong, nonatomic)CADisplayLink* link;
@property(strong, nonatomic)NSMutableArray<NSNumber*>* frequencyDatas;
@property(strong, nonatomic)NSMutableArray<CAGradientLayer*>* frequencyLayers;
@end

@implementation FDFrequencySpectrumIndicator

- (instancetype)initWithConfig:(FDFrequencySpectrumIndicatorConfig*)config {
    if (self = [super init]) {
        self.backgroundColor = [UIColor blackColor];
        _frequencyNum = config.frequencyNum?config.frequencyNum:@8;
        _tintColor = config.tintColor?config.tintColor:[UIColor colorWithRed:52.f/255 green:232.f/255 blue:158.f/255 alpha:1.0f];
        
        _frequencyMargin = config.frequencyMargin?config.frequencyMargin:4.0f;
        _frequencyWidth = config.frequencyWidth?config.frequencyWidth:6.0f;
        _frequencyDatas = [NSMutableArray new];
        
        _frequencyLayers = [NSMutableArray new];
        for (int index = 0; index < _frequencyNum.intValue; index++) {
            CAGradientLayer* frequencyLayer = [CAGradientLayer new];
            frequencyLayer.colors = @[(__bridge id)_tintColor.CGColor,
                                      (__bridge id)[UIColor colorWithRed:14.f/255 green:52.f/255 blue:67.f/255 alpha:1.0f].CGColor];
            frequencyLayer.locations = @[@0.6, @1.0];
            [self.layer addSublayer:frequencyLayer];
            [_frequencyLayers addObject:frequencyLayer];
        }
        
        _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
        [_link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    }
    return self;
}

- (instancetype)init {
    FDFrequencySpectrumIndicatorConfig* config;
    config = [FDFrequencySpectrumIndicatorConfig new];
    if (self = [self initWithConfig:config]) {
    }
    return self;
}

- (void)startTest {
    [NSTimer scheduledTimerWithTimeInterval:0.2 repeats:YES block:^(NSTimer * _Nonnull timer) {
        [self.frequencyDatas removeAllObjects];
        for (int index = 0; index < self.frequencyNum.intValue; index ++) {
            srand((unsigned)time(NULL));
            [self.frequencyDatas addObject:@((CGFloat)drand48())];
        }
    }];
}

- (void)update {
    for (int index = 0; index < self.frequencyDatas.count; index ++) {
        self.frequencyLayers[index].frame
        = CGRectMake(self.frequencyMargin + index * self.frequencyWidth + index * self.frequencyMargin,
                     self.layer.frame.size.height,
                     self.frequencyWidth,
                     self.layer.frame.size.height * -self.frequencyDatas[index].floatValue);
    }
}
@end
