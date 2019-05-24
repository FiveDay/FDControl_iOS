//
//  FDLottieLayerModel.m
//  FDControl
//
//  Created by zhangyu528 on 2019/5/22.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDLottieLayerModel.h"
#import "FDLottieTransform.h"
#import "FDlottieMask.h"

typedef enum : NSUInteger {
    FDLottieLayerTypePrecomp,
    FDLottieLayerTypeSolid,
    FDLottieLayerTypeImage,
    FDLottieLayerTypeNull,
    FDLottieLayerTypeShape,
    FDLottieLayerTypeText
} FDLottieLayerType;

typedef enum : NSUInteger {
    FDLottieMattTypeNone,
    FDLottieMattTypeAdd,
    FDLottieMattTypeInvert,
    FDLottieMattTypeUnknown
} FDLottieMattType;

typedef enum : NSUInteger {
    FDLottieBlendModeNormal,
    FDLottieBlendModeMultiply,
    FDLottieBlendModeScreen,
    FDLottieBlendModeOverlay,
    FDLottieBlendModeDarken,
    FDLottieBlendModeLighten,
    FDLottieBlendModeColorDodge,
    FDLottieBlendModeColorBurn,
    FDLottieBlendModeHardLight,
    FDLottieBlendModeSoftLight,
    FDLottieBlendModeDifference,
    FDLottieBlendModeExclusion,
    FDLottieBlendModeHue,
    FDLottieBlendModeSturation,
    FDLottieBlendModeColor,
    FDLottieBlendModeLuminosity,
} FDLottieBlendMode;

@interface FDLottieLayerModel ()
/// The readable name of the layer
@property(copy, nonatomic)NSString* name;

/// The index of the layer
@property(strong, nonatomic)NSNumber* index;

/// The type of the layer.
/// FDLottieLayerType
@property(strong, nonatomic)NSNumber* type;

/// The coordinate space
/// FDLottieCoordinateSpace
@property(strong, nonatomic)NSNumber* coordinateSpace;

/// The in time of the layer in frames.
@property(strong, nonatomic)NSNumber* inFrame;

/// The out time of the layer in frames.
@property(strong, nonatomic)NSNumber* outFrame;

/// The start time of the layer in frames.
@property(strong, nonatomic)NSNumber* startTime;

/// The transform of the layer
@property(strong, nonatomic)FDLottieTransform* transform;

/// The index of the parent layer, if applicable.
@property(strong, nonatomic)NSNumber* parent;

/// The blending mode for the layer
/// FDLottieBlendMode
@property(strong, nonatomic)NSNumber* blendMode;

/// An array of masks for the layer.
@property(strong, nonatomic, nullable)NSArray<FDLottieMask*>* masks;

/// A number that stretches time by a multiplier
@property(strong, nonatomic)NSNumber* timeStretch;

/// The type of matte if any.
/// FDLottieMattType
@property(assign, nonatomic)NSNumber* matte;

@property(strong, nonatomic)NSNumber* hidden;

@end

@implementation FDLottieLayerModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"name" : @"nm",
             @"index" : @"ind",
             @"type" : @"ty",
             @"coordinateSpace" : @"ddd",
             @"inFrame" : @"ip",
             @"outFrame" : @"op",
             @"startTime" : @"st",
             @"transform" : @"ks",
             @"parent" : @"parent",
             @"blendMode" : @"bm",
             @"masks" : @"masksProperties",
             @"timeStretch" : @"sr",
             @"matte" : @"tt",
             @"hidden" : @"hd"
             };
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value should be Class or Class name.
    return @{@"transform" : [FDLottieTransform class],
             @"masks" : [FDLottieMask class],
             };
}

//- (instancetype)initWithCoder:(NSCoder *)aDecoder {
//    if (self = [super init]) {
//        self.name = [aDecoder decodeObjectForKey:@"nm"];
//        self.index = [aDecoder decodeObjectForKey:@"ind"];
//        self.type = [aDecoder decodeIntegerForKey:@"ty"];
//        self.coordinateSpace = [aDecoder decodeIntegerForKey:@"ddd"];
//        self.inFrame = [aDecoder decodeObjectForKey:@"ip"];
//        self.outFrame = [aDecoder decodeObjectForKey:@"op"];
//        self.startTime = [aDecoder decodeObjectForKey:@"st"];
//        self.transform = [aDecoder decodeObjectForKey:@"ks"];
//        self.parent = [aDecoder decodeObjectForKey:@"parent"];
//        self.blendMode = [aDecoder decodeIntegerForKey:@"bm"];
//        self.masks = [aDecoder decodeObjectForKey:@"masksProperties"];
//        self.timeStretch = [aDecoder decodeObjectForKey:@"sr"];
//        self.matte = [aDecoder decodeIntegerForKey:@"tt"];
//        self.hidden = [aDecoder decodeObjectForKey:@"hd"];
//    }
//    return self;
//}
//
//- (void)encodeWithCoder:(NSCoder *)aCoder {
//    
//}
@end
