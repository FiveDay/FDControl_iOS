//
//  FDFrequencySpectrumIndicator.m
//  FDControl
//
//  Created by zhangyu528 on 2019/4/26.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDFrequencySpectrumIndicator.h"
#import <QuartzCore/QuartzCore.h>

@interface FDFrequencySpectrumIndicator ()
@property(strong, nonatomic)NSNumber* frequencyNum;
@property(strong, nonatomic)UIColor* tintColor;
@property(strong, nonatomic)CADisplayLink* link;
@property(strong, nonatomic)NSArray<NSNumber*>* frequencyDatas;
@property(strong, nonatomic)NSMutableArray<CALayer*>* frequencyLayers;
@end

@implementation FDFrequencySpectrumIndicator

- (instancetype)initWithFrequencyNum:(NSNumber*)num {
    if (self = [super init]) {
        self.backgroundColor = [UIColor blackColor];
        
        _frequencyNum = num;
        
        _frequencyLayers = [NSMutableArray new];
        for (int index = 0; index < _frequencyNum.intValue; index++) {
            CALayer* frequencyLayer = [CALayer new];
            frequencyLayer.backgroundColor = [UIColor yellowColor].CGColor;
            [self.layer addSublayer:frequencyLayer];
            [_frequencyLayers addObject:frequencyLayer];
        }
        CGFloat margin = 8;
        CGFloat frequencyWidth = 10;
        int index = 0;
        for (CALayer* subLayer in self.frequencyLayers) {
            subLayer.frame = CGRectMake(10 + index * frequencyWidth + index * margin,
                                        0, frequencyWidth, 0);
            index ++;
        }
        
        _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
        [_link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    }
    return self;
}

- (void)startTest {
    [NSTimer scheduledTimerWithTimeInterval:0.1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        self.frequencyDatas = @[@(drand48()), @(drand48()), @(drand48()), @(drand48()), @(drand48()), @(drand48())];
    }];
}

- (void)update {
    for (int index = 0; index < self.frequencyNum.intValue; index ++) {
        self.frequencyLayers[index].frame
        = CGRectMake(self.frequencyLayers[index].frame.origin.x,
                     self.layer.frame.size.height,
                     self.frequencyLayers[index].frame.size.width,
                     self.layer.frame.size.height * -self.frequencyDatas[index].floatValue);
    }
}
@end
