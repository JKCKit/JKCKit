//
//  UIView+JKCUtils.h
//  Demo
//
//  Created by yct on 2018/9/10.
//  Copyright © 2018年 JKC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JKCUtils)
- (CGSize)size;
- (CGPoint)origin;
- (CGFloat)top;
- (CGFloat)left;
- (CGFloat)bottom;
- (CGFloat)right;
- (CGFloat)width;
- (CGFloat)height;
#pragma mark Setter
- (void)jkc_setSize:(CGSize)size;
- (void)jkc_setOrigin:(CGPoint)origin;
- (void)jkc_setTop:(CGFloat)top;
- (void)jkc_setLeft:(CGFloat)left;
- (void)jkc_setBottom:(CGFloat)bottom;
- (void)jkc_setRight:(CGFloat)right;
- (void)jkc_setWidth:(CGFloat)width;
- (void)jkc_setHeight:(CGFloat)height;
@end
