//
//  UIControl+JKCBlock.m
//  Demo
//
//  Created by yct on 2018/8/30.
//  Copyright © 2018年 JKC. All rights reserved.
//

#import "UIControl+JKCBlock.h"
#import <objc/runtime.h>

static NSString *UIControl_BlocksKey = @"BlocksKey";
static const char *UIControl_acceptEventInterval = "UIControl_acceptEventInterval";

@implementation UIControl (JKCBlock)

- (NSDictionary <NSNumber *, NSString *> *)selectors {
    return @{@(UIControlEventTouchDown) : @"jkc_controlAction_UIControlEventTouchDown:",
             @(UIControlEventTouchDownRepeat) : @"jkc_controlAction_UIControlEventTouchDownRepeat:",
             @(UIControlEventTouchDragInside) : @"jkc_controlAction_UIControlEventTouchDragInside:",
             @(UIControlEventTouchDragOutside) : @"jkc_controlAction_UIControlEventTouchDragOutside:",
             @(UIControlEventTouchDragEnter) : @"jkc_controlAction_UIControlEventTouchDragEnter:",
             @(UIControlEventTouchDragExit) : @"jkc_controlAction_UIControlEventTouchDragExit:",
             @(UIControlEventTouchUpInside) : @"jkc_controlAction_UIControlEventTouchUpInside:",
             @(UIControlEventTouchUpOutside) : @"jkc_controlAction_UIControlEventTouchUpOutside:",
             @(UIControlEventValueChanged) : @"jkc_controlAction_UIControlEventValueChanged:",
             @(UIControlEventPrimaryActionTriggered) : @"jkc_controlAction_UIControlEventPrimaryActionTriggered:",
             @(UIControlEventEditingDidBegin) : @"jkc_controlAction_UIControlEventEditingDidBegin:",
             @(UIControlEventEditingChanged) : @"jkc_controlAction_UIControlEventEditingChanged:",
             @(UIControlEventEditingDidEnd) : @"jkc_controlAction_UIControlEventEditingDidEnd:",
             @(UIControlEventEditingDidEndOnExit) : @"jkc_controlAction_UIControlEventEditingDidEndOnExit:",
             @(UIControlEventAllTouchEvents) : @"jkc_controlAction_UIControlEventAllTouchEvents:",
             @(UIControlEventAllEditingEvents) : @"jkc_controlAction_UIControlEventAllEditingEvents:",
             @(UIControlEventApplicationReserved) : @"jkc_controlAction_UIControlEventApplicationReserved:",
             @(UIControlEventSystemReserved) : @"jkc_controlAction_UIControlEventSystemReserved:",
             @(UIControlEventAllEvents) : @"jkc_controlAction_UIControlEventAllEvents:",
             };
}

- (NSMutableDictionary <NSNumber *, ActionBlock> *)blocks {
    return objc_getAssociatedObject(self, (__bridge const void * _Nonnull)(UIControl_BlocksKey));
}

#pragma mark -

- (void)jkc_addActionBlock:(_Nonnull ActionBlock)actionBlock
          forControlEvents:(UIControlEvents)controlEvents {
    if (actionBlock) {
        if (![self blocks]) {
            objc_setAssociatedObject(self, (__bridge const void * _Nonnull)(UIControl_BlocksKey), [NSMutableDictionary dictionary], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
        [self blocks][@(controlEvents)] = actionBlock;
        [self addTarget:self action:NSSelectorFromString([self selectors][@(controlEvents)]) forControlEvents:controlEvents];
    }
}

#pragma mark -

- (void)jkc_controlAction_UIControlEventTouchDown:(id)sender {
    ActionBlock targetBlock = [self blocks][@(UIControlEventTouchDown)];
    if (targetBlock) {
        targetBlock(sender);
    }
}
- (void)jkc_controlAction_UIControlEventTouchDownRepeat:(id)sender {
    ActionBlock targetBlock = [self blocks][@(UIControlEventTouchDownRepeat)];
    if (targetBlock) {
        targetBlock(sender);
    }
}
- (void)jkc_controlAction_UIControlEventTouchDragInside:(id)sender {
    ActionBlock targetBlock = [self blocks][@(UIControlEventTouchDragInside)];
    if (targetBlock) {
        targetBlock(sender);
    }
}
- (void)jkc_controlAction_UIControlEventTouchDragOutside:(id)sender {
    ActionBlock targetBlock = [self blocks][@(UIControlEventTouchDragOutside)];
    if (targetBlock) {
        targetBlock(sender);
    }
}
- (void)jkc_controlAction_UIControlEventTouchDragEnter:(id)sender {
    ActionBlock targetBlock = [self blocks][@(UIControlEventTouchDragEnter)];
    if (targetBlock) {
        targetBlock(sender);
    }
}
- (void)jkc_controlAction_UIControlEventTouchDragExit:(id)sender {
    ActionBlock targetBlock = [self blocks][@(UIControlEventTouchDragExit)];
    if (targetBlock) {
        targetBlock(sender);
    }
}
- (void)jkc_controlAction_UIControlEventTouchUpInside:(id)sender {
    ActionBlock targetBlock = [self blocks][@(UIControlEventTouchUpInside)];
    if (targetBlock) {
        targetBlock(sender);
    }
}
- (void)jkc_controlAction_UIControlEventTouchUpOutside:(id)sender {
    ActionBlock targetBlock = [self blocks][@(UIControlEventTouchUpOutside)];
    if (targetBlock) {
        targetBlock(sender);
    }
}
- (void)jkc_controlAction_UIControlEventTouchCancel:(id)sender {
    ActionBlock targetBlock = [self blocks][@(UIControlEventTouchCancel)];
    if (targetBlock) {
        targetBlock(sender);
    }
}
- (void)jkc_controlAction_UIControlEventValueChanged:(id)sender {
    ActionBlock targetBlock = [self blocks][@(UIControlEventValueChanged)];
    if (targetBlock) {
        targetBlock(sender);
    }
}
- (void)jkc_controlAction_UIControlEventPrimaryActionTriggered:(id)sender {
    ActionBlock targetBlock = [self blocks][@(UIControlEventPrimaryActionTriggered)];
    if (targetBlock) {
        targetBlock(sender);
    }
}
- (void)jkc_controlAction_UIControlEventEditingDidBegin:(id)sender {
    ActionBlock targetBlock = [self blocks][@(UIControlEventEditingDidBegin)];
    if (targetBlock) {
        targetBlock(sender);
    }
}
- (void)jkc_controlAction_UIControlEventEditingChanged:(id)sender {
    ActionBlock targetBlock = [self blocks][@(UIControlEventEditingChanged)];
    if (targetBlock) {
        targetBlock(sender);
    }
}- (void)jkc_controlAction_UIControlEventEditingDidEnd:(id)sender {
    ActionBlock targetBlock = [self blocks][@(UIControlEventEditingDidEnd)];
    if (targetBlock) {
        targetBlock(sender);
    }
}
- (void)jkc_controlAction_UIControlEventEditingDidEndOnExit:(id)sender {
    ActionBlock targetBlock = [self blocks][@(UIControlEventEditingDidEndOnExit)];
    if (targetBlock) {
        targetBlock(sender);
    }
}
- (void)jkc_controlAction_UIControlEventAllTouchEvents:(id)sender {
    ActionBlock targetBlock = [self blocks][@(UIControlEventAllTouchEvents)];
    if (targetBlock) {
        targetBlock(sender);
    }
}
- (void)jkc_controlAction_UIControlEventAllEditingEvents:(id)sender {
    ActionBlock targetBlock = [self blocks][@(UIControlEventAllEditingEvents)];
    if (targetBlock) {
        targetBlock(sender);
    }
}
- (void)jkc_controlAction_UIControlEventApplicationReserved:(id)sender {
    ActionBlock targetBlock = [self blocks][@(UIControlEventApplicationReserved)];
    if (targetBlock) {
        targetBlock(sender);
    }
}
- (void)jkc_controlAction_UIControlEventSystemReserved:(id)sender {
    ActionBlock targetBlock = [self blocks][@(UIControlEventSystemReserved)];
    if (targetBlock) {
        targetBlock(sender);
    }
}
- (void)jkc_controlAction_UIControlEventAllEvents:(id)sender {
    ActionBlock targetBlock = [self blocks][@(UIControlEventAllEvents)];
    if (targetBlock) {
        targetBlock(sender);
    }
}

#pragma mark -

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
