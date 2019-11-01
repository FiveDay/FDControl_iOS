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
    FLVStack* vStack = [FLVStack new].alignment(FL_leading);
    [vStack contentView:^(UIView * _Nonnull content) {
        [UIView new].renderTo(content)
                    .padding(@3)
                    .margin(@4)
                    .backgroundColor([UIColor redColor]);
        [UIView new].renderTo(content)
                    .padding(@3, @0, @2.3, @-3.4)
                    .backgroundColor([UIColor greenColor]);
        [[FLVStack new].alignment(FL_leading) contentView:^(UIView * _Nonnull content) {
            
        }].renderTo(content)
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
