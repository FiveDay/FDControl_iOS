//
//  FDLottieComposition.m
//  FDControl
//
//  Created by zhangyu528 on 2019/5/30.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDLottieComposition.h"
#import "FDJSONDecoder.h"
#import "FDLottieLayer.h"

@interface FDLottieComposition () <FDCoding>

@end

@implementation FDLottieComposition

+ (nullable instancetype)animationNamed:(NSString*)name {
    if (!name) {
        return nil;
    }
    NSBundle* mainBundle = [NSBundle mainBundle];
    NSString* path = [mainBundle pathForResource:name ofType:@"json"];
    NSData* jsonData = [NSData dataWithContentsOfFile:path];
    if (!path || !jsonData) {
        return nil;
    }
    return [FDJSONDecoder decode:self JSON:jsonData];
}

- (instancetype)initWithFDCoder:(FDCoder *)coder {
    if (self = [super init]) {
        _width = [coder decode:[NSNumber class] key:@"w"];
        _height = [coder decode:[NSNumber class] key:@"h"];
        _startFrame = [coder decode:[NSNumber class] key:@"ip"];
        _endFrame = [coder decode:[NSNumber class] key:@"op"];
        _framerate = [coder decode:[NSNumber class] key:@"fr"];
        _layers = [coder decode:[FDLottieLayer class] key:@"layers"];
    }
    return self;
}

@end
