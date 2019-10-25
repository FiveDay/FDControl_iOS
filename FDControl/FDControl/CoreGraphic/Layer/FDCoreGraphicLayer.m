//
//  FDCoreGraphicLayer.m
//  KeyApp
//
//  Created by zhangyu528 on 2019/10/23.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDCoreGraphicLayer.h"
#import "FDCoreGraphicContext.h"

@interface FDCoreGraphicLayer ()
@property(assign, nonatomic)CGLayerRef cgLayer;
@property(strong, nonatomic)FDCoreGraphicContext* context;
@property(strong, nonatomic)FDCoreGraphicContext* layerContext;
@end

@implementation FDCoreGraphicLayer

- (instancetype)initWithContext:(FDCoreGraphicContext*)context size:(CGSize)size {
    if (self = [super init]) {
        _context = context;
        _cgLayer = CGLayerCreateWithContext(_context.cgContext, size, NULL);
    }
    return self;
}

- (void)dealloc {
    CGLayerRelease(self.cgLayer);
}

//Drawing Layer Content

//Draws the contents of a layer object into the specified rectangle.
- (void)drawLayerInRect:(CGRect)rect {
    CGContextDrawLayerInRect(self.context.cgContext, rect, self.cgLayer);
}

//Draws the contents of a CGLayer object at the specified point.
- (void)drawLayerAtPoint:(CGPoint)point {
    CGContextDrawLayerAtPoint(self.context.cgContext, point, self.cgLayer);
}

//Getting the CFType ID for a Layer
- (CFTypeID)getTypeID {
    return CGLayerGetTypeID();
}

//Getting Layer Information

//Returns the width and height of a layer object.
- (CGSize)getSize {
    return CGLayerGetSize(self.cgLayer);
}

- (FDCoreGraphicContext*)getContext {
    if (self.layerContext) {
        return self.layerContext;
    }
    self.layerContext = [[FDCoreGraphicContext alloc]initWithContextRef:CGLayerGetContext(self.cgLayer)];
    return self.layerContext;
}


@end
