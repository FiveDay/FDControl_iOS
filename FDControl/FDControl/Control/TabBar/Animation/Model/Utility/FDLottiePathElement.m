//
//  FDLottiePathElement.m
//  FDControl
//
//  Created by zhangyu528 on 2019/5/23.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDLottiePathElement.h"
#import <CoreGraphics/CoreGraphics.h>
#import "FDLottieCurveVertex.h"

@interface FDLottiePathElement ()

/// The absolute Length of the path element.
@property(assign, nonatomic)CGFloat length;

/// The vertex of the element
@property(strong, nonatomic)FDLottieCurveVertex* vertex;

@end

@implementation FDLottiePathElement

- (instancetype)initWithLength:(CGFloat)length vertex:(FDLottieCurveVertex*)vertex {
    if (self = [super init]) {
        self.length = length;
        self.vertex = vertex;
    }
    return self;
}

- (instancetype)initWithCurveVertex:(FDLottieCurveVertex*)vertex {
    if (self = [self initWithLength:0 vertex:vertex]) {
    }
    return self;
}

- (FDLottiePathElement*)updateVertex:(FDLottieCurveVertex*)vertex {
    return [[FDLottiePathElement alloc]initWithLength:self.length vertex:vertex];
}

/// Splits an element span defined by the receiver and fromElement to a position 0-1

@end
