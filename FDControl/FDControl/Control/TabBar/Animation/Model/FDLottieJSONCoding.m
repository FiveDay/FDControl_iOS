//
//  FDLottieJSONCoding.m
//  FDControl
//
//  Created by zhangyu528 on 2019/5/22.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDLottieJSONCoding.h"

#import <UIKit/UIKit.h>
#import "FDLottieLayerModel.h"
#import "FDLottieGlyph.h"
#import "FDLottieFontList.h"
#import "FDLottieAssetLibrary.h"
#import "FDLottieMarker.h"

@interface FDLottieJSONCoding ()
/// The version of the JSON Schema.
@property(copy, nonatomic)NSString* version;

/// The coordinate space of the composition.
@property(assign, nonatomic)FDLottieCoordinateSpace type;

/// The start time of the composition in frameTime.
@property(strong, nonatomic)NSNumber* startFrame;

/// The end time of the composition in frameTime.
@property(strong, nonatomic)NSNumber* endFrame;

/// The frame rate of the composition.
@property(strong, nonatomic)NSNumber* framerate;

/// The width of the composition in points.
@property(strong, nonatomic)NSNumber* width;

/// The height of the composition in points.
@property(strong, nonatomic)NSNumber* height;

/// The list of animation layers
@property(strong, nonatomic)NSArray<FDLottieLayerModel*>* layers;

/// The list of glyphs used for text rendering
@property(strong, nonatomic, nullable)NSArray<FDLottieGlyph*>* glyphs;

/// The list of fonts used for text rendering
@property(strong, nonatomic, nullable)FDLottieFontList* fonts;

/// Asset Library
@property(strong, nonatomic, nullable)FDLottieAssetLibrary* assetLibrary;

/// Markers
@property(strong, nonatomic, nullable)NSArray<FDLottieMarker*>* markers;
@property(strong, nonatomic, nullable)NSDictionary<NSString*, FDLottieMarker*>* markerMap;
@end

@implementation FDLottieJSONCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.version = [aDecoder decodeObjectForKey:@"v"];
        self.type = [aDecoder decodeIntegerForKey:@"ddd"];
        self.startFrame = [aDecoder decodeObjectForKey:@"ip"];
        self.endFrame = [aDecoder decodeObjectForKey:@"op"];
        self.framerate = [aDecoder decodeObjectForKey:@"fr"];
        self.width = [aDecoder decodeObjectForKey:@"w"];
        self.height = [aDecoder decodeObjectForKey:@"h"];
        self.layers = [aDecoder decodeObjectForKey:@"layers"];
        self.glyphs = [aDecoder decodeObjectForKey:@"chars"];
        self.fonts = [aDecoder decodeObjectForKey:@"fonts"];
        self.assetLibrary = [aDecoder decodeObjectForKey:@"asets"];
        self.markers = [aDecoder decodeObjectForKey:@"markers"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {

}

@end
