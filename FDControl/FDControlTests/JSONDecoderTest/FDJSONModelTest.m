//
//  FDJSONModelTest.m
//  FDControlTests
//
//  Created by zhangyu528 on 2019/9/18.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <FDControl/FDControl.h>
#import "GHUser.h"

@interface YYTestNestUser : NSObject <FDCoding>
@property NSNumber* uid;
@property NSString *name;
@end
@implementation YYTestNestUser
- (instancetype)initWithFDCoder:(FDCoder *)coder {
    if (self = [super init]) {
        self.uid  = [coder decode:[NSNumber class] key:@"uid"];
        self.name = [coder decode:[NSString class] key:@"name"];
    }
    return self;
}
@end

@interface YYTestNestRepo : NSObject <FDCoding>
@property NSNumber* repoID;
@property NSString *name;
@property YYTestNestUser *user;
@end
@implementation YYTestNestRepo
- (instancetype)initWithFDCoder:(FDCoder *)coder {
    if (self = [super init]) {
        self.repoID =  [coder decode:[NSNumber class] key:@"repoID"];
        self.name = [coder decode:[NSString class] key:@"name"];
        self.user = [coder decode:[YYTestNestUser class] key:@"user"];
    }
    return self;
}
@end


@interface FDJSONModelTest : XCTestCase

@end

@implementation FDJSONModelTest

- (void)test {
    NSBundle* bundle = [NSBundle bundleForClass: [self class]];
    NSString* path = [bundle pathForResource:@"user" ofType:@"json"];
    NSData* data = [[NSData alloc]initWithContentsOfFile:path];
    NSDictionary* dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    YYTestNestRepo* resp = [FDJSONDecoder decode:[YYTestNestRepo class] dictionary:dictionary];
    XCTAssert(resp.repoID.integerValue == 1234);
    XCTAssert([resp.name isEqualToString:@"YYModel"]);
    XCTAssert(resp.user.uid.integerValue == 5678);
    XCTAssert([resp.user.name isEqualToString:@"ibireme"]);
}

- (void)testPerformace {
    NSBundle* bundle = [NSBundle bundleForClass: [self class]];
    NSString* path = [bundle pathForResource:@"ghuser" ofType:@"json"];
    NSData* data = [[NSData alloc]initWithContentsOfFile:path];
    NSDictionary* dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    CFTimeInterval startTime = CACurrentMediaTime();
    for (int i = 0; i < 10000; i++) {
        FDGHUser* user = [FDJSONDecoder decode:[FDGHUser class] dictionary:dictionary];
    }
    CFTimeInterval endTime = CACurrentMediaTime();
    NSLog(@"%f", (endTime - startTime) * 1000);
}
@end
