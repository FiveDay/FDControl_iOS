//
//  FDPermissionMng.h
//  FDControl
//
//  Created by zhangyu528 on 2019/4/12.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FDPermissionMng : NSObject

+ (instancetype)new UNAVAILABLE_ATTRIBUTE;
- (instancetype)init UNAVAILABLE_ATTRIBUTE;

+ (instancetype)shared;

//申请地理位置权限
- (void)requestLocationPermission;
- (BOOL)checkLocationEnabled;
//申请Push消息通知权限
- (void)requestNotificationPermission;
- (BOOL)checkNotificationEnabled;
//申请相册访问权限
- (void)requestPhotoPermission;
- (BOOL)checkPhotoEnabled;
//申请相机访问权限
- (void)requestCameraPermission;
- (BOOL)checkCameraEnabled;
//申请通讯录访问权限
- (void)requestContactsPermission;
- (BOOL)checkContactsEnabled;
@end

NS_ASSUME_NONNULL_END
