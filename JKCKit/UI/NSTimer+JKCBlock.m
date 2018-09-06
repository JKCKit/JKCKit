//
//  NSTimer+JKCBlock.m
//  Demo
//
//  Created by yct on 2018/9/5.
//  Copyright © 2018年 JKC. All rights reserved.
//

#import "NSTimer+JKCBlock.h"
#import <objc/runtime.h>

static NSString *scheduleTimerKey = @"scheduleTimerKey";
static NSString *normalTimerKey = @"normalTimerKey";

@implementation NSTimer (JKCBlock)
+ (ScheduledActionBlock)scheduledActionBlock {
    return objc_getAssociatedObject(self, (__bridge const void * _Nonnull)(scheduleTimerKey));
}

+ (void)jkc_scheduledTimerWithTimeInterval:(NSTimeInterval)ti
                                    userInfo:(nullable id)userInfo
                                   repeats:(BOOL)yesOrNo
                               actionBlock:(_Nonnull ScheduledActionBlock)actionBlock {
    if (actionBlock) {
        objc_setAssociatedObject(self, (__bridge const void * _Nonnull)(scheduleTimerKey), actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
         [NSTimer scheduledTimerWithTimeInterval:ti target:self selector:@selector(jkc_scheduledTimerAction:) userInfo:userInfo repeats:yesOrNo];
    }
}

+ (void)jkc_scheduledTimerAction:(NSTimer *)timer {
    if (self.scheduledActionBlock) {
        self.scheduledActionBlock(timer);
    }
}

+ (NormalActionBlock)normalActionBlock {
    return objc_getAssociatedObject(self, (__bridge const void * _Nonnull)(normalTimerKey));
}

+ (_Nullable instancetype)jkc_timerWithTimeInterval:(NSTimeInterval)ti
                                  userInfo:(nullable id)userInfo
                                   repeats:(BOOL)yesOrNo
                               actionBlock:(_Nonnull ScheduledActionBlock)actionBlock {
    if (actionBlock) {
        objc_setAssociatedObject(self, (__bridge const void * _Nonnull)(normalTimerKey), actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
        return [NSTimer timerWithTimeInterval:ti target:self selector:@selector(jkc_normalTimerAction:) userInfo:userInfo repeats:yesOrNo];
    }
    return nil;
}

+ (void)jkc_normalTimerAction:(NSTimer *)timer {
    if (self.normalActionBlock) {
        self.normalActionBlock(timer);
    }
}
@end
