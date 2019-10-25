//
//  FDCoreGraphicPattern.m
//  KeyApp
//
//  Created by zhangyu528 on 2019/10/25.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDCoreGraphicPattern.h"
#import "FDCoreGraphicContext.h"

@interface FDCoreGraphicPattern ()
@property(assign, nonatomic)CGPatternRef patternRef;
@property(weak, nonatomic)void(^drawBlock)(FDCoreGraphicContext*);
@end


static void drawPatternCallback(void* target, CGContextRef contextRef){
    FDCoreGraphicPattern* obj = (__bridge FDCoreGraphicPattern*)target;
    FDCoreGraphicContext* context = [[FDCoreGraphicContext alloc]initWithContextRef:contextRef];
    obj.drawBlock(context);
}

static void releaseInfoCallback(void* target) {
    
}


@implementation FDCoreGraphicPattern

- (instancetype)init:(CGRect)bounds matrix:(CGAffineTransform)matrix xStep:(CGFloat)xStep yStep:(CGFloat)yStep tiling:(CGPatternTiling)tiling isColored:(BOOL)isColored draw:(void(^)(FDCoreGraphicContext* context))draw {
    if (self = [super init]) {
        CGPatternCallbacks callback = {0, &drawPatternCallback, &releaseInfoCallback};
        _patternRef = CGPatternCreate((__bridge void*)self, bounds, matrix, xStep, yStep, tiling, isColored, &callback);
    }
    return self;
}

- (instancetype)initWithPatterRef:(CGPatternRef)ref {
    if (self = [super init]) {
        _patternRef = ref;
        CGPatternRetain(ref);
    }
    return self;
}

- (void)dealloc {
    CGPatternRelease(self.patternRef);
}
@end
