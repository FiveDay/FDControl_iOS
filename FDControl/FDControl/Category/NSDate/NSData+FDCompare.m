//
//  NSDate+FDCompare.m
//  FDControl
//
//  Created by zhangyu528 on 2019/8/16.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "NSData+FDCompare.h"

@implementation NSDate (FDCompare)

- (BOOL)isSameDay:(NSDate*)date {
    
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents* comp1 = [calendar components:unit fromDate:self];
    NSDateComponents* comp2 = [calendar components:unit fromDate:date];
    
    return (comp1.year == comp2.year) && (comp1.month == comp2.month) && (comp1.day == comp2.day);
}

@end
