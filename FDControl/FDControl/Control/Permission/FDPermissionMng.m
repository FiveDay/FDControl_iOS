//
//  FDPermissionMng.m
//  FDControl
//
//  Created by zhangyu528 on 2019/4/12.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "FDPermissionMng.h"
#import <UIKit/UIKit.h>
#import <UserNotifications/UserNotifications.h>
#import <CoreLocation/CLLocationManager.h>
#import <Photos/Photos.h>
#import <AVFoundation/AVCaptureDevice.h>
#import <AddressBook/AddressBook.h>
#import <Contacts/Contacts.h>


@interface FDPermissionMng ()
@property (nonatomic, strong) CLLocationManager *locationManager;
@end

@implementation FDPermissionMng

+ (instancetype)shared {
    static FDPermissionMng* _instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc]init];
    });
    return _instance;
}

- (void)requestLocationPermission {
    [self.locationManager requestWhenInUseAuthorization];
}

- (void)requestNotificationPermission {
    float version = [[UIDevice currentDevice].systemVersion floatValue];
    if (version >= 8.0f && version < 10.0f) {
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    }else if (version >= 10.0f) {
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        [center requestAuthorizationWithOptions:UNAuthorizationOptionAlert | UNAuthorizationOptionBadge | UNAuthorizationOptionSound completionHandler:^(BOOL granted, NSError * _Nullable error) {
            
        }];
    }
}

- (BOOL)checkLocationEnabled {
    BOOL enabled = NO;
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse) {
        enabled = YES;
    } else {
        enabled = NO;
    }
    return enabled;
}

- (BOOL)checkNotificationEnabled {
    BOOL enabled = NO;
    float version = [[UIDevice currentDevice].systemVersion floatValue];
    if (version >= __IPHONE_8_0 && version < __IPHONE_10_0) {
        UIUserNotificationSettings *setting = [[UIApplication sharedApplication] currentUserNotificationSettings];
        if (setting.types == UIUserNotificationTypeNone) {
            enabled = NO;
        } else {
            enabled = YES;
        }
    }else if (version >= __IPHONE_10_0) {
        UIRemoteNotificationType type = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
        if (type == UIRemoteNotificationTypeNone) {
            enabled = NO;
        } else {
            enabled = YES;
        }
    }
    return enabled;
}

- (void)requestPhotoPermission {
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
        
    }];
}

- (BOOL)checkPhotoEnabled {
    BOOL enabled = NO;
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if (status == PHAuthorizationStatusAuthorized) {
        enabled = YES;
    }
    return enabled;
}

- (void)requestCameraPermission {
    [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
}

- (BOOL)checkCameraEnabled {
    BOOL enabled = NO;
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (status == AVAuthorizationStatusAuthorized) {
        enabled = YES;
    }
    return enabled;
}

- (void)requestContactsPermission {
    float version = [[UIDevice currentDevice].systemVersion floatValue];
    if (version <= __IPHONE_9_0) {
        
    }else {
        CNContactStore *contactStore = [[CNContactStore alloc] init];
        [contactStore requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
            
        }];
    }
}

- (BOOL)checkContactsEnabled {
    BOOL enabled = NO;
    CNAuthorizationStatus authStatus = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];
    if (authStatus == CNAuthorizationStatusAuthorized) {
        enabled = YES;
    }
    return enabled;
}

- (CLLocationManager*)locationManager {
    if (_locationManager) {
        return _locationManager;
    }
    _locationManager = [[CLLocationManager alloc]init];
    return _locationManager;
}
@end
