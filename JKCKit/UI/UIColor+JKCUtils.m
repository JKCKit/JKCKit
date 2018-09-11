//
//  UIColor+JKCUtils.m
//  Demo
//
//  Created by yct on 2018/9/6.
//  Copyright © 2018年 JKC. All rights reserved.
//

#import "UIColor+JKCUtils.h"

@implementation UIColor (JKCUtils)
+ (UIColor * _Nullable)jkc_colorWithHexString:(NSString * _Nonnull)hexString
{
    if (!hexString) {
        return nil;
    }
    NSString *cString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if (cString.length == 6 || cString.length == 8) {
        NSRange range;
        range.location = 0;
        range.length = 2;
        NSString *aString;
        NSString *rString;
        NSString *gString;
        NSString *bString;
        if (cString.length == 6) {
            aString = @"FF";
            rString = [cString substringWithRange:range];
            range.location = 2;
            gString = [cString substringWithRange:range];
            range.location = 4;
            bString = [cString substringWithRange:range];
        } else if (cString.length == 8) {
            aString = [cString substringWithRange:range];
            range.location = 2;
            rString = [cString substringWithRange:range];
            range.location = 4;
            gString = [cString substringWithRange:range];
            range.location = 6;
            bString = [cString substringWithRange:range];
        }
        unsigned int a, r, g, b;
        [[NSScanner scannerWithString:aString] scanHexInt:&a];
        [[NSScanner scannerWithString:rString] scanHexInt:&r];
        [[NSScanner scannerWithString:gString] scanHexInt:&g];
        [[NSScanner scannerWithString:bString] scanHexInt:&b];
        
        return [UIColor colorWithRed:(r / 255.0f) green:(g / 255.0f) blue:(b / 255.0f) alpha:(a / 255.0f)];
    }
    
    return nil;
}
@end
