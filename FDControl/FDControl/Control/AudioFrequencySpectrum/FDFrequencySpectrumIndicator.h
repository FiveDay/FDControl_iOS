//
//  FDFrequencySpectrumIndicator.h
//  FDControl
//
//  Created by zhangyu528 on 2019/4/26.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol FDFrequencySpectrumIndicatorDataSource <NSObject>
@end

@interface FDFrequencySpectrumIndicator : UIView

@property(weak, nonatomic)id<FDFrequencySpectrumIndicatorDataSource> dataSource;

- (instancetype)initWithFrequencyNum:(NSNumber*)num;

- (void)startTest;

@end

NS_ASSUME_NONNULL_END
