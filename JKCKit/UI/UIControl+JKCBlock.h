//
//  UIControl+JKCBlock.h
//  Demo
//
//  Created by yct on 2018/8/30.
//  Copyright © 2018年 JKC. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ActionBlock) (id sender);

@interface UIControl (JKCBlock)

@property (nonatomic, copy, readonly) ActionBlock actionBlock;

- (void)jkc_addActionBlock:(_Nonnull ActionBlock)actionBlock
          forControlEvents:(UIControlEvents)controlEvents;

@end