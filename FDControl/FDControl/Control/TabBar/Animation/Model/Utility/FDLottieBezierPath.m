//
//  FDLottieBezierPath.m
//  FDControl
//
//  Created by zhangyu528 on 2019/5/23.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDLottieBezierPath.h"
#import <CoreGraphics/CoreGraphics.h>
#import "FDLottiePathElement.h"

@interface FDLottieBezierPath ()

/// The elements of the path
@property(strong, nonatomic)NSArray<FDLottiePathElement*>* elements;

/// If the path is closed or not.
@property(strong, nonatomic)NSNumber* closed;

/// The total length of the path.
@property(strong, nonatomic)NSNumber* length;

@end

@implementation FDLottieBezierPath

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.closed = [aDecoder decodeObjectForKey:@"c"];
        
    }
    return self;
}
@end
