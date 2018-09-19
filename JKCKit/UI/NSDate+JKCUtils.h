//
//  NSDate+JKCUtils.h
//  Demo
//
//  Created by yct on 2018/9/14.
//  Copyright © 2018年 JKC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (JKCUtils)
+ (NSString *)jkc_dateStringWithDate:(NSDate *)date
                              format:(NSString *)format;

+ (NSDateComponents *)jkc_dateComponentsWithDate:(NSDate *)date;
@end
