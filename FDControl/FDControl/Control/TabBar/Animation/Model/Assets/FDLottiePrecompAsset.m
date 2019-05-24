//
//  FDLottiePrecompAsset.m
//  FDControl
//
//  Created by zhangyu528 on 2019/5/23.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDLottiePrecompAsset.h"
#import "FDLottieLayerModel.h"

@interface FDLottiePrecompAsset ()
/// Layers of the precomp
@property(strong, nonatomic)NSArray<FDLottieLayerModel*>* layers;
@end

@implementation FDLottiePrecompAsset

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"layers" : @"layers",
             };
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value should be Class or Class name.
    return @{@"layers" : [FDLottieLayerModel class],
             };
}

//- (instancetype)initWithCoder:(NSCoder *)aDecoder {
//    if (self = [super initWithCoder:aDecoder]) {
//        self.layers = [aDecoder decodeObjectForKey:@"layers"];
//    }
//    return self;
//}
@end
