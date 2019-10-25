//
//  FDCoreGraphicContext.m
//  KeyApp
//
//  Created by zhangyu528 on 2019/10/22.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDCoreGraphicContext.h"

@implementation FDCoreGraphicContext

- (instancetype)initWithContextRef:(CGContextRef)contextRef {
    if (self = [super init]) {
        _cgContext = contextRef;
        CGContextRetain(contextRef);
    }
    return self;
}

//Managing Graphics Contexts
- (void)dealloc {
    CGContextRelease(self.cgContext);
}

//Returns the type identifier for a graphics context.
- (CFTypeID)getTypeID {
    return CGContextGetTypeID();
}

//Forces all pending drawing operations in a window context to be rendered immediately to the destination device.
- (void)flush {
    CGContextFlush(self.cgContext);
}

//Marks a window context for update.
- (void)synchronize {
    CGContextSynchronize(self.cgContext);
}

//Saving and Restoring the Current Graphics State

//Pushes a copy of the current graphics state onto the graphics state stack for the context.
- (void)saveGState {
    CGContextSaveGState(self.cgContext);
}

//Sets the current graphics state to the state most recently saved.
- (void)restoreGState {
    CGContextRestoreGState(self.cgContext);
}

//Getting and Setting Graphics State Parameters
- (CGInterpolationQuality)getInterpolationQuality {
    return CGContextGetInterpolationQuality(self.cgContext);
}

- (void)setFlatness:(CGFloat)flatness {
    CGContextSetFlatness(self.cgContext, flatness);
}

- (void)setInterpolationQuality:(CGInterpolationQuality)quality{
    CGContextSetInterpolationQuality(self.cgContext, quality);
}

- (void)setLineCap:(CGLineCap)cap {
    CGContextSetLineCap(self.cgContext, cap);
}

- (void)setLineDash:(CGFloat)phase lengths:(const CGFloat*)lengths count:(size_t)count {
    CGContextSetLineDash(self.cgContext, phase, lengths, count);
}

- (void)setLineJoin:(CGLineJoin)join {
    CGContextSetLineJoin(self.cgContext, join);
}

- (void)setLineWidth:(CGFloat)width {
    CGContextSetLineWidth(self.cgContext, width);
}

//Sets the miter limit for the joins of connected lines in a graphics context.
- (void)setMiterLimit:(CGFloat)limit {
    CGContextSetMiterLimit(self.cgContext, limit);
}

//Sets the pattern phase of a context.
- (void)setPatternPhase:(CGSize)phase {
    CGContextSetPatternPhase(self.cgContext, phase);
}

//Sets the fill pattern in the specified graphics context.
- (void)setFillPatter:(CGPatternRef)pattern components:(const CGFloat*)components {
    CGContextSetFillPattern(self.cgContext, pattern, components);
}

//Sets the rendering intent in the current graphics state.
- (void)setRenderIntent:(CGColorRenderingIntent)intent {
    CGContextSetRenderingIntent(self.cgContext, intent);
}

//Sets antialiasing on or off for a graphics context.
- (void)setShouldAntialias:(BOOL)shouldAntialias {
    CGContextSetShouldAntialias(self.cgContext, shouldAntialias);
}

//Sets the stroke pattern in the specified graphics context.
- (void)setStrokePatter:(CGPatternRef)pattern components:(const CGFloat*)components {
    CGContextSetStrokePattern(self.cgContext, pattern, components);
}

//Sets how sample values are composited by a graphics context.
- (void)setBlendMode:(CGBlendMode)mode {
    CGContextSetBlendMode(self.cgContext, mode);
}

//Sets whether or not to allow antialiasing for a graphics context.
- (void)setAllowsAntialiasing:(BOOL)allowsAntialiasing {
    CGContextSetAllowsAntialiasing(self.cgContext, allowsAntialiasing);
}

//Sets whether or not to allow font smoothing for a graphics context.
- (void)setAllowsFontSmoothing:(BOOL)allowsFontSmoothing {
    CGContextSetAllowsFontSmoothing(self.cgContext, allowsFontSmoothing);
}

//Enables or disables font smoothing in a graphics context.
- (void)setShouldSmoothFonts:(BOOL)shouldSmoothFonts {
    CGContextSetShouldSmoothFonts(self.cgContext, shouldSmoothFonts);
}

//Sets whether or not to allow subpixel positioning for a graphics context.
- (void)setAllowsFontSubpixelPositioning:(BOOL)allowsFontSubpixelPositioning {
    CGContextSetAllowsFontSubpixelPositioning(self.cgContext, allowsFontSubpixelPositioning);
}

//Enables or disables subpixel positioning in a graphics context.
- (void)setShouldSubpixelPositionFonts:(BOOL)shouldSubpixelPositionFonts {
    CGContextSetShouldSubpixelPositionFonts(self.cgContext, shouldSubpixelPositionFonts);
}

//Sets whether or not to allow subpixel quantization for a graphics context.
- (void)setAllowsFontSubpixelQuantization:(BOOL)allowsFontSubpixelQuantization {
    CGContextSetAllowsFontSubpixelQuantization(self.cgContext, allowsFontSubpixelQuantization);
}

//Enables or disables subpixel quantization in a graphics context.
- (void)setShouldSubpixelQuantizeFonts:(BOOL)shouldSubpixelQuantizeFonts {
    CGContextSetShouldSubpixelQuantizeFonts(self.cgContext, shouldSubpixelQuantizeFonts);
}

// Constructing Paths

//Adds an arc of a circle to the current path, possibly preceded by a straight line segment
- (void)addArc:(CGFloat)x y:(CGFloat)y radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(int)clockwise {
    CGContextAddArc(self.cgContext, x, y, radius, startAngle, endAngle, clockwise);
}

//Adds an arc of a circle to the current path, using a radius and tangent points.
- (void)addArcToPoint:(CGFloat)x1 y1:(CGFloat)y1 x2:(CGFloat)x2 y2:(CGFloat)y2 radius:(CGFloat)radius {
    CGContextAddArcToPoint(self.cgContext, x1, y1, x2, y2, radius);
}

//Appends a cubic Bézier curve from the current point, using the provided control points and end point .
- (void)addCurvetoPoint:(CGFloat)cp1x cp1y:(CGFloat)cp1y cp2x:(CGFloat)cp2x cp2y:(CGFloat)cp2y x:(CGFloat)x y:(CGFloat)y {
    CGContextAddCurveToPoint(self.cgContext, cp1x, cp1y, cp2x, cp2y, x, y);
}

//Adds a sequence of connected straight-line segments to the current path.
- (void)addLines:(const CGPoint*)points count:(size_t)count {
    CGContextAddLines(self.cgContext, points, count);
}

//Appends a straight line segment from the current point to the provided point .
- (void)addLineToPoint:(CGFloat)x y:(CGFloat)y {
    CGContextAddLineToPoint(self.cgContext, x, y);
}

//Adds a previously created path object to the current path in a graphics context.
- (void)addPath:(CGPathRef)path {
    CGContextAddPath(self.cgContext, path);
}

//Returns a path object built from the current path information in a graphics context.
- (CGPathRef)copypath {
    return CGContextCopyPath(self.cgContext);
}

//Appends a quadratic Bézier curve from the current point, using a control point and an end point you specify.
- (void)addQuadCurevToPoint:(CGFloat)cpx cpy:(CGFloat)cpy x:(CGFloat)x y:(CGFloat)y {
    CGContextAddQuadCurveToPoint(self.cgContext, cpx, cpy, x, y);
}

//Adds a rectangular path to the current path.
- (void)addRect:(CGRect)rect {
    CGContextAddRect(self.cgContext, rect);
}

//Adds a set of rectangular paths to the current path.
- (void)addRects:(const CGRect*)rects count:(size_t)count {
    CGContextAddRects(self.cgContext, rects, count);
}

//Creates a new empty path in a graphics context.
- (void)beginPath {
    CGContextBeginPath(self.cgContext);
}

- (void)closePath {
    CGContextClosePath(self.cgContext);
}

//Begins a new subpath at the point you specify.
- (void)moveToPoint:(CGFloat)x y:(CGFloat)y {
    CGContextMoveToPoint(self.cgContext, x, y);
}

//Adds an ellipse that fits inside the specified rectangle.
- (void)addEllipseInRect:(CGRect)rect {
    CGContextAddEllipseInRect(self.cgContext, rect);
}
@end




































