//
//  FDLottieCurveVertex.m
//  FDControl
//
//  Created by zhangyu528 on 2019/5/23.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDLottieCurveVertex.h"
#import <CoreGraphics/CoreGraphics.h>
#import "FDLottieMathKit.h"

@interface FDLottieCurveVertex ()
@property(assign, nonatomic)CGPoint point;
@property(assign, nonatomic)CGPoint inTangent;
@property(assign, nonatomic)CGPoint outTangent;
@end


@implementation FDLottieCurveVertex

- (instancetype)initWithPoint:(CGPoint)point
                        inTangent:(CGPoint)inTangent
                       outTangent:(CGPoint)outTangent {
    if (self = [super init]) {
        self.point = point;
        self.inTangent = inTangent;
        self.outTangent = outTangent;
    }
    return self;
}

- (instancetype)initWithPoint:(CGPoint)point
            inTangentRelative:(CGPoint)inTangentRelative
           outTangentRelative:(CGPoint)outTangentRelative {
    if (self = [super init]) {
        self.point = point;
        self.inTangent = [FDLottieMathKit addPointA:self.point pointB:inTangentRelative];
        self.outTangent = [FDLottieMathKit addPointA:self.point pointB:outTangentRelative];
    }
    return self;
}

- (CGPoint)inTangentRelative {
    return [FDLottieMathKit subtractPointA:self.inTangent pointB:self.point];
}

- (CGPoint)outTangentRelative {
    return [FDLottieMathKit subtractPointA:self.outTangent pointB:self.point];
}

- (FDLottieCurveVertex*)reversed {
    return [[FDLottieCurveVertex alloc]initWithPoint:self.point inTangent:self.outTangent outTangent:self.inTangent];
}

- (FDLottieCurveVertex*)translated:(CGPoint)translation {
    CGPoint point = [FDLottieMathKit addPointA:self.point pointB:translation];
    CGPoint inTangent = [FDLottieMathKit addPointA:self.inTangent pointB:translation];
    CGPoint outTangent = [FDLottieMathKit addPointA:self.outTangent pointB:translation];

    return [[FDLottieCurveVertex alloc]initWithPoint:point inTangent:inTangent outTangent:outTangent];
}

/**
 Trims a path defined by two Vertices at a specific position, from 0 to 1
 
 The path can be visualized below.
 
 F is fromVertex.
 V is the vertex of the receiver.
 P is the position from 0-1.
 O is the outTangent of fromVertex.
 F====O=========P=======I====V
 
 After trimming the curve can be visualized below.
 
 S is the returned Start vertex.
 E is the returned End vertex.
 T is the trim point.
 TI and TO are the new tangents for the trimPoint
 NO and NI are the new tangents for the startPoint and endPoints
 S==NO=========TI==T==TO=======NI==E
 */


/**
 Trims a curve of a known length to a specific length and returns the points.
 
 There is not a performant yet accurate way to cut a curve to a specific length.
 This calls splitCurve(toVertex: position:) to split the curve and then measures
 the length of the new curve. The function then iterates through the samples,
 adjusting the position of the cut for a more precise cut.
 Usually a single iteration is enough to get within 0.5 points of the desired
 length.
 
 This function should probably live in PathElement, since it deals with curve
 lengths.
 */

/**
 The distance from the receiver to the provided vertex.
 
 For lines (zeroed tangents) the distance between the two points is measured.
 For curves the curve is iterated over by sample count and the points are measured.
 This is ~99% accurate at a sample count of 30
 */
@end
