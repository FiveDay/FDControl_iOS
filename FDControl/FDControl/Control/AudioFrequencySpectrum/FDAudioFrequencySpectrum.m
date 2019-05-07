//
//  FDAudioFrequencySpectrum.m
//  FDControl
//
//  Created by zhangyu528 on 2019/4/26.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDAudioFrequencySpectrum.h"
#import "FDFrequencySpectrumIndicator.h"

@interface FDAudioFrequencySpectrum () <FDFrequencySpectrumIndicatorDataSource>
@property(strong, nonatomic, nullable)FDFrequencySpectrumIndicator* indicator;
@end

@implementation FDAudioFrequencySpectrum

- (instancetype)init {
    if (self = [super init]) {
    }
    return self;
}

- (void)linkIndicator:(FDFrequencySpectrumIndicator*)indicator {
    _indicator = indicator;
    _indicator.dataSource = self;
}

- (void)startWithFile:(NSURL*)filePath {
    
}

- (void)pause {
    
}

- (void)resume {
    
}

- (void)stop {
    
}

- (void)update {
}
@end
