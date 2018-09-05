//
//  UIControl+JKCBlock.m
//  Demo
//
//  Created by yct on 2018/8/30.
//  Copyright © 2018年 JKC. All rights reserved.
//

#import "UIControl+JKCBlock.h"
#import <objc/runtime.h>

static NSString *key = @"Block";

@implementation UIControl (JKCBlock)

- (void)jkc_addActionBlock:(_Nonnull ActionBlock)actionBlock
          forControlEvents:(UIControlEvents)controlEvents {
    if (actionBlock) {
        objc_setAssociatedObject(self, (__bridge const void * _Nonnull)(key), actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [self addTarget:self action:@selector(jkc_actionBlock:) forControlEvents:controlEvents];
    }
}

- (ActionBlock)actionBlock {
    return objc_getAssociatedObject(self, (__bridge const void * _Nonnull)(key));
}

- (void)jkc_actionBlock:(id)sender {
    if (self.actionBlock) {
        self.actionBlock(sender);
    }
}

@end
