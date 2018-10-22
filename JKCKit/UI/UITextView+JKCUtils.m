//
//  UITextView+JKCUtils.m
//  Demo
//
//  Created by yct on 2018/10/22.
//  Copyright © 2018 JKC. All rights reserved.
//

#import "UITextView+JKCUtils.h"
#import <objc/runtime.h>
static NSString *UIResponderDiasbleActionsKey = @"UIResponderDiasbleActionsKey";
@implementation UITextView (JKCUtils)
+ (void)load {
    {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            Class class = [self class];
            SEL originalSelector = @selector(canPerformAction:withSender:);
            SEL swizzledSelector = @selector(jkc_canPerformAction:withSender:);
            Method originalMethod = class_getInstanceMethod(class, originalSelector);
            Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
            BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod),
                                                method_getTypeEncoding(swizzledMethod));
            
            if (didAddMethod) {
                class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod),
                                    method_getTypeEncoding(originalMethod));
            } else {
                method_exchangeImplementations(originalMethod, swizzledMethod);
            }
        });
    }
}

#pragma mark setter
- (void)setDiasbleActions:(NSArray<NSString *> *)diasbleActions {
    objc_setAssociatedObject(self, (__bridge const void * _Nonnull)(UIResponderDiasbleActionsKey), diasbleActions, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark getter
- (NSArray <NSString *> *)diasbleActions {
    return objc_getAssociatedObject(self, (__bridge const void * _Nonnull)(UIResponderDiasbleActionsKey));
}

- (BOOL)jkc_canPerformAction:(SEL)action withSender:(id)sender {
    if (sender == [UIMenuController sharedMenuController]) {
        for (NSString *actionName in self.diasbleActions) {
            if ([actionName isKindOfClass:[NSString class]]) {
                if (action == NSSelectorFromString(actionName)) {
                    return NO;
                }
            }
        }
    }
    return [self jkc_canPerformAction:action withSender:sender];
}
@end
