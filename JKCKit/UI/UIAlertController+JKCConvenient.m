//
//  UIAlertController+JKCConvenient.m
//  Demo
//
//  Created by yct on 2018/8/30.
//  Copyright © 2018年 JKC. All rights reserved.
//

#import "UIAlertController+JKCConvenient.h"
#import "JKCMacro.h"

@implementation UIAlertController (JKCConvenient)
+ (instancetype)jkc_alertControllerWithTitle:( NSString * _Nonnull )title
                                     message:( NSString * _Nullable )message
                              preferredStyle:(UIAlertControllerStyle)style
                                cancelAction:( UIAlertAction * _Nonnull )cancelAction, ... NS_REQUIRES_NIL_TERMINATION {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:style];
    
    if (cancelAction) {
        [alertController addAction:cancelAction];
    }
    
    va_list args;
    UIAlertAction *arg;
    va_start(args, cancelAction);

    while((arg = va_arg(args, UIAlertAction *))) {
        if ([arg isKindOfClass:[UIAlertAction class]]) {
            [alertController addAction:arg];
        }
    }
    return alertController;
}

+ (instancetype)jkc_showLoadingAlertWithTitle:( NSString * _Nonnull )title
                                      message:( NSString * _Nullable )message {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    [self addLoadingWithView:alertController.view];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
    
    return alertController;
}

#pragma mark Utils -
+ (void)addLoadingWithView:(nonnull UIView *)aView {
    for (UIView *subView in aView.subviews) {
        if ([subView isKindOfClass:NSClassFromString(@"_UIInterfaceActionGroupHeaderScrollView")]) {
            UIActivityIndicatorView *loading = [[UIActivityIndicatorView alloc] init];
            loading.translatesAutoresizingMaskIntoConstraints = NO;
            loading.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
            loading.color = [UIColor grayColor];
            loading.hidden = NO;
            [loading startAnimating];
            if (subView.subviews.count > 0) {
                UIView *tempView = subView.subviews[0];
                [tempView addSubview:loading];
                if (tempView.subviews.count > 2) {
                    UIView *titleLabel = tempView.subviews[0];
                    UIView *messageLabel = tempView.subviews[1];
                    if ([titleLabel isKindOfClass:[UILabel class]] && !([messageLabel isKindOfClass:[UILabel class]])) {
                        NSLayoutConstraint *constraintX = [NSLayoutConstraint constraintWithItem:loading attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:titleLabel attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
                        NSLayoutConstraint *constraintY = [NSLayoutConstraint constraintWithItem:loading attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:titleLabel attribute:NSLayoutAttributeBottom multiplier:1.0 constant:10];
                        NSLayoutConstraint *constraintBottom = [NSLayoutConstraint constraintWithItem:tempView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:titleLabel attribute:NSLayoutAttributeBottom multiplier:1.0 constant:55];
                        [tempView addConstraints:@[constraintX, constraintY, constraintBottom]];
                    } else if ([titleLabel isKindOfClass:[UILabel class]] && [messageLabel isKindOfClass:[UILabel class]]){
                        NSLayoutConstraint *constraintX = [NSLayoutConstraint constraintWithItem:loading attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:messageLabel attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
                        NSLayoutConstraint *constraintY = [NSLayoutConstraint constraintWithItem:loading attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:messageLabel attribute:NSLayoutAttributeBottom multiplier:1.0 constant:10];
                        NSLayoutConstraint *constraintBottom = [NSLayoutConstraint constraintWithItem:tempView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:messageLabel attribute:NSLayoutAttributeBottom multiplier:1.0 constant:55];
                        [tempView addConstraints:@[constraintX, constraintY, constraintBottom]];
                    }
                }
            }
            break;
        } else if (subView.subviews.count > 0) {
            [self addLoadingWithView:subView];
        }
    }
}

+ (void)addProgressViewWithView:(nonnull UIView *)aView
                alertController:(nonnull UIAlertController *)alertController
                        handler:(void (^)(UIProgressView *progressView, UIAlertController *alertController))handler {
    for (UIView *subView in aView.subviews) {
        if ([subView isKindOfClass:NSClassFromString(@"_UIInterfaceActionGroupHeaderScrollView")]) {
            UIProgressView *progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 0, 270, 50)];
            progressView.translatesAutoresizingMaskIntoConstraints = NO;
            progressView.progressTintColor = [UIApplication sharedApplication].keyWindow.rootViewController.view.tintColor;
            if (subView.subviews.count > 0) {
                UIView *tempView = subView.subviews[0];
                [tempView addSubview:progressView];
                if (tempView.subviews.count > 2) {
                    UIView *titleLabel = tempView.subviews[0];
                    UIView *messageLabel = tempView.subviews[1];
                    if ([titleLabel isKindOfClass:[UILabel class]] && !([messageLabel isKindOfClass:[UILabel class]])) {
                        NSLayoutConstraint *constraintX = [NSLayoutConstraint constraintWithItem:progressView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:titleLabel attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
                        NSLayoutConstraint *constraintY = [NSLayoutConstraint constraintWithItem:progressView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:titleLabel attribute:NSLayoutAttributeBottom multiplier:1.0 constant:10];
                        NSLayoutConstraint *constraintBottom = [NSLayoutConstraint constraintWithItem:tempView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:titleLabel attribute:NSLayoutAttributeBottom multiplier:1.0 constant:30];
                        NSLayoutConstraint *constraintW = [NSLayoutConstraint constraintWithItem:progressView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:titleLabel attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0];
                        NSLayoutConstraint *constraintH = [NSLayoutConstraint constraintWithItem:progressView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:1];
                        [tempView addConstraints:@[constraintX, constraintY, constraintBottom, constraintW, constraintH]];
                        if (handler) {
                            handler(progressView, alertController);
                        }
                        break;
                    } else if ([titleLabel isKindOfClass:[UILabel class]] && [messageLabel isKindOfClass:[UILabel class]]){
                        NSLayoutConstraint *constraintX = [NSLayoutConstraint constraintWithItem:progressView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:messageLabel attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
                        NSLayoutConstraint *constraintY = [NSLayoutConstraint constraintWithItem:progressView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:messageLabel attribute:NSLayoutAttributeBottom multiplier:1.0 constant:10];
                        NSLayoutConstraint *constraintBottom = [NSLayoutConstraint constraintWithItem:tempView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:messageLabel attribute:NSLayoutAttributeBottom multiplier:1.0 constant:30];
                        NSLayoutConstraint *constraintW = [NSLayoutConstraint constraintWithItem:progressView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:messageLabel attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0];
                        NSLayoutConstraint *constraintH = [NSLayoutConstraint constraintWithItem:progressView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:1];
                        [tempView addConstraints:@[constraintX, constraintY, constraintBottom, constraintW, constraintH]];
                        if (handler) {
                            handler(progressView, alertController);
                        }
                        break;
                    }
                }
            }
        } else {
            if (subView.subviews.count > 0) {
                [self addProgressViewWithView:subView alertController:alertController handler:handler];
            }
        }
    }
    if (handler) {
        handler(nil, nil);
    }
}

+ (void)jkc_showProgressAlertWithTitle:( NSString * _Nonnull )title
                               message:( NSString * _Nullable )message
                               handler:(void (^)(UIProgressView *progressView, UIAlertController *alertController))handler {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    [self addProgressViewWithView:alertController.view alertController:alertController handler:handler];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
}
@end
