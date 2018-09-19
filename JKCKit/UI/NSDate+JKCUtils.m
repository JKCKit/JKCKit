//
//  NSDate+JKCUtils.m
//  Demo
//
//  Created by yct on 2018/9/14.
//  Copyright © 2018年 JKC. All rights reserved.
//

#import "NSDate+JKCUtils.h"

@implementation NSDate (JKCUtils)
+ (NSString *)jkc_dateStringWithDate:(NSDate *)date
                              format:(NSString *)format {
    if (!date || !format) {
        return nil;
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = format;
    formatter.calendar = [[NSCalendar alloc]
                          initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    return [formatter stringFromDate:date];
}
                    
+ (NSDateComponents *)jkc_dateComponentsWithDate:(NSDate *)date {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    unsigned unitFlags = NSCalendarUnitYear |
    NSCalendarUnitMonth |  NSCalendarUnitDay |
    NSCalendarUnitHour |  NSCalendarUnitMinute |
    NSCalendarUnitSecond | NSCalendarUnitWeekday;
    NSDateComponents *dateComponents = [gregorian components:unitFlags
                                          fromDate:date];
    return dateComponents;
}
@end
