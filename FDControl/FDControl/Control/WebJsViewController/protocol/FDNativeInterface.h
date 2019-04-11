//
//  FDNativeInterface.h
//  FDControl
//
//  Created by zhangyu528 on 2019/4/9.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol FDNativeInterface <NSObject>

@optional
- (NSDictionary*)getTokenUserId:(id)data;
- (NSDictionary*)regBackBtnClicked;
- (NSDictionary*)showDailog;
- (NSDictionary*)showToast;
- (NSDictionary*)pickContact;
- (NSDictionary*)goCallPage;
- (NSDictionary*)startLoading;
- (NSDictionary*)endLoading;
- (NSDictionary*)setTitleText;
- (NSDictionary*)jumpNativePage;
- (NSDictionary*)closeWebView;
- (NSDictionary*)openBrowser;
- (NSDictionary*)goLoginPage;
- (NSDictionary*)getCurrentPosition;
@end

NS_ASSUME_NONNULL_END
