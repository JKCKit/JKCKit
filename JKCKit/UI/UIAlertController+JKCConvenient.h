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

+ (instancetype _Nonnull )jkc_showLoadingAlertWithTitle:( NSString * _Nonnull )title
                                      message:( NSString * _Nullable )message;

+ (void)jkc_showProgressAlertWithTitle:( NSString * _Nonnull )title
                               message:( NSString * _Nullable )message
                               handler:(void (^_Nullable)(UIProgressView * _Nullable progressView, UIAlertController * _Nonnull alertController))handler;
@end
