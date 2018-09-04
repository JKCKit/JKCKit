//
//  UIBarButtonItem+JKCBlock.m
//  Demo
//
//  Created by yct on 2018/9/4.
//  Copyright © 2018年 JKC. All rights reserved.
//

#import "UIBarButtonItem+JKCBlock.h"
#import <objc/runtime.h>
static NSString *key = @"Block";

@implementation UIBarButtonItem (JKCBlock)
#pragma clang diagnostic ignored "-Wobjc-designated-initializers"

- (instancetype)initWithTitle:(NSString *)title
                        style:(UIBarButtonItemStyle)style
                  actionBlock:(ActionBlock)actionBlock {
    self = [self initWithTitle:title style:style target:self action:@selector(jkc_itemAction:)];
    if (actionBlock) {
        objc_setAssociatedObject(self, (__bridge const void * _Nonnull)(key), actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
    return self;
}

- (ActionBlock)actionBlock {
    return objc_getAssociatedObject(self, (__bridge const void * _Nonnull)(key));
}

- (void)jkc_itemAction:(id)sender {
    if (self.actionBlock) {
        self.actionBlock(sender);
    }
}
@end
