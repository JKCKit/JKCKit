//
//  UIGestureRecognizer+JKCBlock.m
//  Demo
//
//  Created by yct on 2018/9/14.
//  Copyright © 2018年 JKC. All rights reserved.
//

#import "UIGestureRecognizer+JKCBlock.h"
#import <objc/runtime.h>


@implementation UIGestureRecognizer (JKCBlock)
- (void)jkc_addAction:(ActionBlock)actionBlock {
    if (actionBlock) {
        objc_setAssociatedObject(self, (__bridge const void * _Nonnull)(key), actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [self addTarget:self action:@selector(jkc_actionBlock:)];
    }
}

static NSString *key = @"Block";
- (ActionBlock)actionBlock {
    return objc_getAssociatedObject(self, (__bridge const void * _Nonnull)(key));
}

- (void)jkc_actionBlock:(id)sender {
    if (self.actionBlock) {
        self.actionBlock(sender);
    }
}
@end
