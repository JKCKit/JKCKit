//
//  UIAlertController+JKCConvenient.h
//  Demo
//
//  Created by yct on 2018/8/30.
//  Copyright © 2018年 JKC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (JKCConvenient)
+ (instancetype _Nonnull )jkc_alertControllerWithTitle:( NSString * _Nonnull )title
                                     message:( NSString * _Nullable )message
                              preferredStyle:(UIAlertControllerStyle)style
                                cancelAction:( UIAlertAction * _Nonnull )cancelAction, ... NS_REQUIRES_NIL_TERMINATION;

+ (instancetype)jkc_loadingAlertWithTitle:( NSString * _Nonnull )title
                                  message:( NSString * _Nullable )message;

+ (instancetype)jkc_progressAlertWithTitle:( NSString * _Nonnull )title
                                   message:( NSString * _Nullable )message
                                   handler:(void (^)(UIProgressView *progressView, UIAlertController *alertController))handler;

@end
