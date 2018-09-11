//
//  UIView+JKCUtils.m
//  Demo
//
//  Created by yct on 2018/9/10.
//  Copyright © 2018年 JKC. All rights reserved.
//

#import "UIView+JKCUtils.h"

@implementation UIView (JKCUtils)
#pragma mark Getter
- (CGSize)size {
    return self.bounds.size;
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (CGFloat)left {
    return self.frame.origin.x;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.bounds.size.height;
}

- (CGFloat)right {
    return self.frame.origin.x + self.bounds.size.width;
}

- (CGFloat)width {
    return self.bounds.size.width;
}

- (CGFloat)height {
    return self.bounds.size.height;
}
#pragma mark Setter
- (void)jkc_setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (void)jkc_setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (void)jkc_setTop:(CGFloat)top {
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}

- (void)jkc_setLeft:(CGFloat)left {
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}

- (void)jkc_setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - self.bounds.size.height;
    self.frame = frame;
}

- (void)jkc_setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - self.bounds.size.width;
    self.frame = frame;
}

- (void)jkc_setWidth:(CGFloat)width {
    CGRect bounds = self.bounds;
    bounds.size.width = width;
    self.bounds = bounds;
}

- (void)jkc_setHeight:(CGFloat)height {
    CGRect bounds = self.bounds;
    bounds.size.height = height;
    self.bounds = bounds;
}
@end
