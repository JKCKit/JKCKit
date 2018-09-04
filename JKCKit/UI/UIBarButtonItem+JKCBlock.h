//
//  UIBarButtonItem+JKCBlock.h
//  Demo
//
//  Created by yct on 2018/9/4.
//  Copyright © 2018年 JKC. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ActionBlock) (id sender);

@interface UIBarButtonItem (JKCBlock)
@property (nonatomic, copy, readonly) ActionBlock actionBlock;

- (instancetype)initWithTitle:(NSString *)title
                        style:(UIBarButtonItemStyle)style
                  actionBlock:(ActionBlock)actionBlock;
@end
