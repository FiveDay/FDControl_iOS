//
//  FDLottieLayer.m
//  FDControl
//
//  Created by zhangyu528 on 2019/5/30.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDLottieLayer.h"
#import "FDLottieShapeLayer.h"

@interface FDLottieLayer ()

@end

@implementation FDLottieLayer

- (instancetype)initWithFDCoder:(FDCoder *)coder {
    if (self = [super init]) {
        NSNumber* type = [coder decode:[NSNumber class] key:@"ty"];
        _type = type.integerValue;
        
        if ([self isMemberOfClass:[FDLottieLayer class]]) {
            switch (_type) {
                case FDLottieLayerTypePrecomp:
                    
                    break;
                case FDLottieLayerTypeSolid:
                    
                    break;
                case FDLottieLayerTypeImage:
                    
                    break;
                case FDLottieLayerTypeNull:
                    
                    break;
                case FDLottieLayerTypeShape:
                    return [[FDLottieShapeLayer alloc]initWithFDCoder:coder];
                    break;
                case FDLottieLayerTypeUnknown:
                    
                    break;
                default:
                    break;
            }
        }

        _name = [coder decode:[NSString class] key:@"nm"];
        _index = [coder decode:[NSNumber class] key:@"ind"];
        _startFrame = [coder decode:[NSNumber class] key:@"st"];
        _inFrame = [coder decode:[NSNumber class] key:@"ip"];
        _outFrame = [coder decode:[NSNumber class] key:@"op"];
    }
    return self;
}
@end
