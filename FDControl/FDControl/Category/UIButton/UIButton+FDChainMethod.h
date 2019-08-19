//
//  UIButton+FDChainMethod.h
//  FDControl
//
//  Created by zhangyu528 on 2019/8/19.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (FDChainMethod)

- (UIButton* (^)(NSString*))normalTitle;
- (UIButton* (^)(NSString*))selectedTitle;
- (UIButton* (^)(NSString*))highlightedTitle;
- (UIButton* (^)(NSString*))disabledTitle;

- (UIButton* (^)(UIColor*))normalTitleColor;
- (UIButton* (^)(UIColor*))selecteTitleColor;
- (UIButton* (^)(UIColor*))higlightedTitleColor;
- (UIButton* (^)(UIColor*))disabledTitleColor;

- (UIButton* (^)(UIImage*))normalImage;
- (UIButton* (^)(UIImage*))selectedImage;
- (UIButton* (^)(UIImage*))highlightedImage;
- (UIButton* (^)(UIImage*))disabledImage;

- (UIButton* (^)(UIImage*))normalBackgroundImage;
- (UIButton* (^)(UIImage*))selectedBackgroundImage;
- (UIButton* (^)(UIImage*))highlightedBackgroundImage;
- (UIButton* (^)(UIImage*))disabledBackgroundImage;

@end

NS_ASSUME_NONNULL_END
