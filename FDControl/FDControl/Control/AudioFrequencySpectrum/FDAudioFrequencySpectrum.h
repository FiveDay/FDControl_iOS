//
//  FDAudioFrequencySpectrum.h
//  FDControl
//
//  Created by zhangyu528 on 2019/4/26.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class FDFrequencySpectrumIndicator;
@interface FDAudioFrequencySpectrum : NSObject

- (instancetype)init;
- (void)linkIndicator:(FDFrequencySpectrumIndicator*)indicator;

- (void)startWithFile:(NSURL*)filePath;

@end

NS_ASSUME_NONNULL_END
