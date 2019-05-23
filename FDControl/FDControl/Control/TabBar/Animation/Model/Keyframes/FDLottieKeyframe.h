//
//  FDLottieKeyframe.h
//  FDControl
//
//  Created by zhangyu528 on 2019/5/22.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "FDLottieVector2D.h"

NS_ASSUME_NONNULL_BEGIN

@interface FDLottieKeyframe <__covariant T> : NSObject
{
@private
    /// The value of the keyframe
    T _value;
    
    /// The time in frames of the keyframe.
    CGFloat _time;
    
    /// A hold keyframe freezes interpolation until the next keyframe that is not a hold.
    BOOL _isHold;
    
    /// The in tangent for the time interpolation curve.
    FDLottieVector2D* _inTangent;
    
    /// The out tangent for the time interpolation curve.
    FDLottieVector2D* _outTangent;
    
    /// The spacial in tangent of the vector.
//    let spatialInTangent: Vector3D?
    /// The spacial out tangent of the vector.
//    let spatialOutTangent: Vector3D?
    
}

- (instancetype)initWithValue:(T)value;

@end

NS_ASSUME_NONNULL_END
