//
//  WKWebView+JKCProgressView.h
//  Demo
//
//  Created by yct on 2018/9/4.
//  Copyright © 2018年 JKC. All rights reserved.
//

#import <WebKit/WebKit.h>
#import <UIKit/UIKit.h>

@interface WKWebView (JKCProgressView)
@property (class, nonatomic, assign, getter=isShowProgressView) BOOL showProgressView;
@property (nonatomic, assign, getter=isShowProgressView) BOOL showProgressView;
@property (nonatomic, strong, nullable) UIProgressView *progressView;
@property (class, nonatomic, strong, nullable) UIProgressView *progressView;
@end
