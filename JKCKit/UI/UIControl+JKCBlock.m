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
static const char *UIControl_acceptEventInterval = "UIControl_acceptEventInterval";

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


- (NSTimeInterval)acceptEventInterval
{
    return [objc_getAssociatedObject(self, UIControl_acceptEventInterval) doubleValue];
}


- (void)setAcceptEventInterval:(NSTimeInterval)acceptEventInterval
{
    objc_setAssociatedObject(self, UIControl_acceptEventInterval, @(acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)yct_ignoreEvent
{
    return [objc_getAssociatedObject(self, UIControl_acceptEventInterval) doubleValue];
}

+ (void)load
{
    Method methodA = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method methodB = class_getInstanceMethod(self, @selector(yct_sendAction:to:froEvent:));
    
    method_exchangeImplementations(methodA, methodB);
}

- (void)yct_sendAction:(SEL)action to:(id)target froEvent:(UIEvent *)event
{
    if (self.acceptEventInterval > 0) {
        if (self.userInteractionEnabled) {
            
            [self yct_sendAction:action to:target froEvent:event];
        }
        self.userInteractionEnabled = NO;
        
        [self performSelector:@selector(setUserInteractionEnabled:) withObject:@(YES) afterDelay:self.acceptEventInterval];
        
        
        // GCD 延迟执行 self.acceptEventInterval：为延迟时间
        __weak typeof (self) weakSelf = self;
        dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.acceptEventInterval * NSEC_PER_SEC));
        
        dispatch_after(delayTime, dispatch_get_main_queue(), ^{
            weakSelf.userInteractionEnabled = YES;
        });
        
    } else {
        [self yct_sendAction:action to:target froEvent:event];
    }
    
}


@end
