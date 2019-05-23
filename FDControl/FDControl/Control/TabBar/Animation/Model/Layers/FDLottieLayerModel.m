//
//  FDLottieLayerModel.m
//  FDControl
//
//  Created by zhangyu528 on 2019/5/22.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDLottieLayerModel.h"

typedef enum : NSUInteger {
    precomp,
    solid,
    image,
    null,
    shape,
    text
} FDLottieLayerType;

@interface FDLottieLayerModel ()
/// The readable name of the layer
@property(copy, nonatomic)NSString* name;

/// The index of the layer
@property(strong, nonatomic)NSNumber* index;

/// The type of the layer.
@property(assign, nonatomic)FDLottieLayerType type;

/// The coordinate space
@property(assign, nonatomic)FDLottieCoordinateSpace coordinateSpace;

/// The in time of the layer in frames.
@property(strong, nonatomic)NSNumber* inFrame;

/// The out time of the layer in frames.
@property(strong, nonatomic)NSNumber* outFrame;

/// The start time of the layer in frames.
@property(strong, nonatomic)NSNumber* startTime;

/// The transform of the layer

@end

@implementation FDLottieLayerModel

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
}
@end
