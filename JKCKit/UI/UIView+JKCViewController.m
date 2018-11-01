//
//  UIView+JKCViewController.m
//  Demo
//
//  Created by yct on 2018/11/1.
//  Copyright © 2018 JKC. All rights reserved.
//

#import "UIView+JKCViewController.h"

@implementation UIView (JKCViewController)
- (UIViewController * _Nullable)viewController {
    UIResponder *responder = [self nextResponder];
    while (responder) {
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)responder;
        }
        responder = [responder nextResponder];
    }
    return nil;
}
@end
