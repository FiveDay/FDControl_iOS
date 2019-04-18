//
//  RouterAViewController.m
//  Demo
//
//  Created by zhangyu528 on 2019/4/15.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "RouterAViewController.h"

@interface RouterAViewController ()

@end

@implementation RouterAViewController

- (instancetype)initWithParam:(NSDictionary*)param {
    if (self = [super init]) {
        if ([[param objectForKey:@"colorId"]isEqualToString:@"123"]) {
            self.view.backgroundColor = [UIColor greenColor];
        }
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
