//
//  UIGestureRecognizer+JKCBlock.h
//  Demo
//
//  Created by yct on 2018/9/14.
//  Copyright © 2018年 JKC. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ActionBlock) (id sender);

@interface UIGestureRecognizer (JKCBlock)
@property (nonatomic, copy, readonly) ActionBlock actionBlock;

- (void)jkc_addAction:(ActionBlock)actionBlock;
@end
