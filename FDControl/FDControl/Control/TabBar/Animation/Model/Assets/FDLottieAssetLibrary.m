//
//  FDLottieAssetLibrary.m
//  FDControl
//
//  Created by zhangyu528 on 2019/5/23.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDLottieAssetLibrary.h"
#import "FDLottieAsset.h"
#import "FDLottieImageAsset.h"
#import "FDLottiePrecompAsset.h"

@interface FDLottieAssetLibrary ()
/// The Assets
@property(strong, nonatomic)NSDictionary<NSString*, FDLottieAsset*>* assets;
@property(strong, nonatomic)NSDictionary<NSString*, FDLottieImageAsset*>* imageAssets;
@property(strong, nonatomic)NSDictionary<NSString*, FDLottiePrecompAsset*>* precompAssets;
@end

@implementation FDLottieAssetLibrary

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        NSMutableDictionary* assets = [NSMutableDictionary new];
        NSMutableDictionary* imageAssets = [NSMutableDictionary new];
        NSMutableDictionary* precompAssets = [NSMutableDictionary new];
        
        self.assets = [assets copy];
        self.imageAssets = [imageAssets copy];
        self.precompAssets = [precompAssets copy];
    }
    return self;
}
@end
