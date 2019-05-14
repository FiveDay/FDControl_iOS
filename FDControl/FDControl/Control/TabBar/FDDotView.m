//
//  FDDotView.m
//  FDControl
//
//  Created by zhangyu528 on 2019/5/14.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDDotView.h"

@interface FDDotView ()
@property(assign, nonatomic)CGFloat radius;
@end

@implementation FDDotView
@dynamic frame;

- (instancetype)initWithRadius:(CGFloat)radius {
    if (self = [super init]) {
        _radius = radius;
        
        self.layer.cornerRadius = radius;
        self.layer.masksToBounds = YES;
        self.backgroundColor = [UIColor redColor];
        self.bounds = CGRectMake(0, 0, self.radius * 2, self.radius * 2);
    }
    return self;
}

@end
