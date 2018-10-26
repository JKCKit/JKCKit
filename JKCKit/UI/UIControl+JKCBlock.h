//
//  UIControl+JKCBlock.h
//  Demo
//
//  Created by yct on 2018/8/30.
//  Copyright © 2018年 JKC. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ActionBlock) (id _Nonnull sender);

@interface UIControl (JKCBlock)

//点击间隔
@property (assign, nonatomic) NSTimeInterval acceptEventInterval;


- (void)jkc_addActionBlock:(_Nonnull ActionBlock)actionBlock
          forControlEvents:(UIControlEvents)controlEvents;

@end
