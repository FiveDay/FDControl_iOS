//
//  FDLottieLayer.h
//  FDControl
//
//  Created by zhangyu528 on 2019/5/30.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FDJSONDecoder.h"

typedef enum : NSInteger {
    FDLottieLayerTypePrecomp,
    FDLottieLayerTypeSolid,
    FDLottieLayerTypeImage,
    FDLottieLayerTypeNull,
    FDLottieLayerTypeShape,
    FDLottieLayerTypeUnknown
} FDLottieLayerType;

NS_ASSUME_NONNULL_BEGIN

@interface FDLottieLayer : NSObject <FDCoding>


@property(copy, nonatomic, readonly)NSString* name;
@property(strong, nonatomic, readonly)NSNumber* index;
@property(assign, nonatomic, readonly)FDLottieLayerType type;
@property(strong, nonatomic, readonly)NSNumber* startFrame;
@property(strong, nonatomic, readonly)NSNumber* inFrame;
@property(strong, nonatomic, readonly)NSNumber* outFrame;
@end

NS_ASSUME_NONNULL_END
