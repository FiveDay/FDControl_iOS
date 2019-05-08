//
//  FDUserGuideView.h
//  FDControl
//
//  Created by zhangyu528 on 2019/5/8.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FDUserGuideView : UIView
@property(strong, nonatomic, readonly)UIButton* startBtn;
@property(strong, nonatomic, readonly)UIPageControl* pageControl;

+ (instancetype)new UNAVAILABLE_ATTRIBUTE;
- (instancetype)init UNAVAILABLE_ATTRIBUTE;

- (instancetype)initWithImages:(NSArray<UIImage*>*)images;

@end

NS_ASSUME_NONNULL_END
