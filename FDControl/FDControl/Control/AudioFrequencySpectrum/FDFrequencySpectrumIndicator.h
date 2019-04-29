//
//  FDFrequencySpectrumIndicator.h
//  FDControl
//
//  Created by zhangyu528 on 2019/4/26.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FDFrequencySpectrumIndicatorConfig : NSObject
//default:@8
@property(strong, nonatomic, nullable)NSNumber* frequencyNum;
//default:[UIColor colorWithRed:52.f/255 green:232.f/255 blue:158.f/255 alpha:1.0f]
@property(strong, nonatomic, nullable)UIColor* tintColor;
//default:6.0
@property(assign, nonatomic)CGFloat frequencyWidth;
//defatul:4.0
@property(assign, nonatomic)CGFloat frequencyMargin;
@end

@protocol FDFrequencySpectrumIndicatorDataSource <NSObject>
@end

@interface FDFrequencySpectrumIndicator : UIView

@property(weak, nonatomic)id<FDFrequencySpectrumIndicatorDataSource> dataSource;

- (instancetype)initWithConfig:(FDFrequencySpectrumIndicatorConfig*)config;
- (instancetype)init;

- (void)startTest;

@end

NS_ASSUME_NONNULL_END
