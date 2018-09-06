//
//  NSTimer+JKCBlock.h
//  Demo
//
//  Created by yct on 2018/9/5.
//  Copyright © 2018年 JKC. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ScheduledActionBlock) (NSTimer *timer);

typedef void (^NormalActionBlock) (NSTimer *timer);

@interface NSTimer (JKCBlock)

@property (class, nonatomic, copy, readonly) ScheduledActionBlock scheduledActionBlock;

@property (class, nonatomic, copy, readonly) NormalActionBlock normalActionBlock;

+ (void)jkc_scheduledTimerWithTimeInterval:(NSTimeInterval)ti
                                  userInfo:(nullable id)userInfo
                                   repeats:(BOOL)yesOrNo
                               actionBlock:(_Nonnull ScheduledActionBlock)actionBlock;

+ (_Nullable instancetype)jkc_timerWithTimeInterval:(NSTimeInterval)ti
                                           userInfo:(nullable id)userInfo
                                            repeats:(BOOL)yesOrNo
                                        actionBlock:(_Nonnull ScheduledActionBlock)actionBlock;
@end
