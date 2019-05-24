//
//  FDLottieTransform.m
//  FDControl
//
//  Created by zhangyu528 on 2019/5/23.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDLottieTransform.h"
#import "FDLottieKeyframeGroup.h"

@interface FDLottieTransform ()
/// The anchor point of the transform.
@property(strong, nonatomic)FDLottieKeyframeGroup<FDLottieVector3D*>* anchorPoint;

/// The position of the transform. This is nil if the position data was split.
@property(strong, nonatomic, nullable)FDLottieKeyframeGroup<FDLottieVector3D*>* position;

/// The positionX of the transform. This is nil if the position property is set.
@property(strong, nonatomic, nullable)FDLottieKeyframeGroup<FDLottieVector1D*>* positionX;

/// The positionY of the transform. This is nil if the position property is set.
@property(strong, nonatomic, nullable)FDLottieKeyframeGroup<FDLottieVector1D*>* positionY;

/// The scale of the transform
@property(strong, nonatomic)FDLottieKeyframeGroup<FDLottieVector3D*>* scale;

/// The rotation of the transform. Note: This is single dimensional rotation.
@property(strong, nonatomic)FDLottieKeyframeGroup<FDLottieVector1D*>* rotation;

/// The opacity of the transform.
@property(strong, nonatomic)FDLottieKeyframeGroup<FDLottieVector1D*>* opacity;

/// Should always be nil.
@property(strong, nonatomic, nullable)FDLottieKeyframeGroup<FDLottieVector1D*>* rotationZ;

@end

@implementation FDLottieTransform

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"anchorPoint" : @"a",
             @"position" : @"p",
             @"positionX" : @"px",
             @"positionY" : @"py",
             @"scale" : @"s",
             @"rotation" : @"r",
             @"opacity" : @"o",
             @"ratationZ" : @"rz"
             };
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value should be Class or Class name.
    return @{@"anchorPoint" : [FDLottieKeyframeGroup class],
             @"position" : [FDLottieKeyframeGroup class],
             @"positionX" : [FDLottieKeyframeGroup class],
             @"positionY" : [FDLottieKeyframeGroup class],
             @"scale" : [FDLottieKeyframeGroup class],
             @"rotation" : [FDLottieKeyframeGroup class],
             @"opacity" : [FDLottieKeyframeGroup class],
             @"ratationZ" : [FDLottieKeyframeGroup class],
             };
}

//- (instancetype)initWithCoder:(NSCoder *)aDecoder {
//    if (self = [super init]) {
//        self.anchorPoint = [aDecoder decodeObjectForKey:@"a"];
//        self.position = [aDecoder decodeObjectForKey:@"p"];
//        self.positionX = [aDecoder decodeObjectForKey:@"px"];
//        self.positionY = [aDecoder decodeObjectForKey:@"py"];
//        self.scale = [aDecoder decodeObjectForKey:@"s"];
//        self.rotation = [aDecoder decodeObjectForKey:@"r"];
//        self.opacity = [aDecoder decodeObjectForKey:@"o"];
//        self.rotationZ = [aDecoder decodeObjectForKey:@"rz"];
//    }
//    return self;
//}
@end
