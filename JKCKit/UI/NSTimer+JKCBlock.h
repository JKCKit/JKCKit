//
//  NSTimer+JKCBlock.h
//  Demo
//
//  Created by yct on 2018/9/5.
//  Copyright © 2018年 JKC. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ScheduledActionBlock) (NSTimer * _Nonnull timer);

typedef void (^NormalActionBlock) (NSTimer * _Nonnull timer);

@interface NSTimer (JKCBlock)

+ (void)jkc_scheduledTimerWithTimeInterval:(NSTimeInterval)ti
                                  userInfo:(nullable id)userInfo
                                   repeats:(BOOL)yesOrNo
                               actionBlock:(_Nonnull ScheduledActionBlock)actionBlock;

+ (_Nullable instancetype)jkc_timerWithTimeInterval:(NSTimeInterval)ti
                                           userInfo:(nullable id)userInfo
                                            repeats:(BOOL)yesOrNo
                                        actionBlock:(_Nonnull ScheduledActionBlock)actionBlock;
@end
