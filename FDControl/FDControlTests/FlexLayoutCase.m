//
//  FlexLayoutCase.m
//  FDControlTests
//
//  Created by zhangyu528 on 2019/10/31.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <FDControl/FDControl.h>

@interface FlexLayoutCase : XCTestCase

@end

@implementation FlexLayoutCase

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    UIView* rootView;
    FLVStack* vStack = [[FLVStack alloc]initWithAlignement:FL_leading];
    [vStack contentView:^(FLVStack * _Nonnull stack) {
        UIView* sub = [UIView new];
        sub.padding(@3).backgroundColor([UIColor redColor]);
        [stack addSubview:sub];
    }];
    [rootView addSubview:vStack];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
