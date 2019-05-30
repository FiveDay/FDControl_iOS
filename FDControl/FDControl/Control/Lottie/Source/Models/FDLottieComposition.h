//
//  FDLottieComposition.h
//  FDControl
//
//  Created by zhangyu528 on 2019/5/30.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FDLottieLayer;

NS_ASSUME_NONNULL_BEGIN

@interface FDLottieComposition : NSObject

+ (nullable instancetype)animationNamed:(NSString*)name;


@property(strong, nonatomic, readonly)NSString* version;
@property(strong, nonatomic, readonly)NSNumber* startFrame;
@property(strong, nonatomic, readonly)NSNumber* endFrame;
@property(strong, nonatomic, readonly)NSNumber* framerate;
@property(strong, nonatomic, readonly)NSNumber* width;
@property(strong, nonatomic, readonly)NSNumber* height;
@property(strong, nonatomic, readonly)NSArray<FDLottieLayer*>* layers;

@end

NS_ASSUME_NONNULL_END
