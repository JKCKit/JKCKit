//
//  WKWebView+JKCProgressView.m
//  Demo
//
//  Created by yct on 2018/9/4.
//  Copyright © 2018年 JKC. All rights reserved.
//

#import "WKWebView+JKCProgressView.h"
#import <objc/runtime.h>

static NSString *progressViewKey = @"progressViewKey";
static NSString *classShowProgressViewKey = @"classShowProgressViewKey";
static NSString *instancehowProgressViewKey = @"instancehowProgressViewKey";

@implementation WKWebView (JKCProgressView)

+ (void)setShowProgressView:(BOOL)showProgressView {
    objc_setAssociatedObject(self, (__bridge const void * _Nonnull)(classShowProgressViewKey), @(showProgressView), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (BOOL)isShowProgressView {
    return [objc_getAssociatedObject(self, (__bridge const void * _Nonnull)(classShowProgressViewKey)) boolValue];
}

- (void)setShowProgressView:(BOOL)showProgressView {
    objc_setAssociatedObject(self, (__bridge const void * _Nonnull)(instancehowProgressViewKey), @(showProgressView), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self addProgressView];
}

- (BOOL)isShowProgressView {
    return [objc_getAssociatedObject(self, (__bridge const void * _Nonnull)(instancehowProgressViewKey)) boolValue];
}

- (void)setProgressView:(UIProgressView *)progressView {
    objc_setAssociatedObject(self, (__bridge const void * _Nonnull)(progressViewKey), progressView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIProgressView *)progressView {
    return objc_getAssociatedObject(self, (__bridge const void * _Nonnull)(progressViewKey));
}



+ (void)load {
    {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            Class class = [self class];
            SEL originalSelector = @selector(willMoveToSuperview:);
            SEL swizzledSelector = @selector(jkc_progressViewWillMoveToSuperView:);
            Method originalMethod = class_getInstanceMethod(class, originalSelector);
            Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
            BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod),
                                                method_getTypeEncoding(swizzledMethod));
            
            if (didAddMethod) {
                class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod),
                                    method_getTypeEncoding(originalMethod));
            } else {
                method_exchangeImplementations(originalMethod, swizzledMethod);
            }
        });
    }
    {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            Class class = [self class];
            SEL originalSelector = @selector(didChangeValueForKey:);
            SEL swizzledSelector = @selector(jkc_progressViewDidChangeValueForKey:);
            Method originalMethod = class_getInstanceMethod(class, originalSelector);
            Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
            BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod),
                                                method_getTypeEncoding(swizzledMethod));
            
            if (didAddMethod) {
                class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod),
                                    method_getTypeEncoding(originalMethod));
            } else {
                method_exchangeImplementations(originalMethod, swizzledMethod);
            }
        });
    }
}

- (void)jkc_progressViewWillMoveToSuperView:(UIView *)newSuperview {
    [self jkc_progressViewWillMoveToSuperView:newSuperview];
    [self addProgressView];
}

- (void)addProgressView {
    if ([self.class isShowProgressView] || (![self.class isShowProgressView] && [self isShowProgressView])) {
        if (!self.progressView) {
            self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 1.0f)];
            self.progressView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
            self.progressView.trackTintColor = [UIColor clearColor];
            self.progressView.progress = 0.05;
        }
        [self addSubview:self.progressView];
    }
}

- (void)jkc_progressViewDidChangeValueForKey:(NSString *)key {
    [self jkc_progressViewDidChangeValueForKey:key];
    if (self.progressView && [key isEqualToString:@"estimatedProgress"]) {
        [self setProgress:self.estimatedProgress animated:YES];
    }
}

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated {
    if (progress == 1.0f) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:.25f animations:^{
                self.progressView.alpha = 0.0f;
            }];
        });
    }
    self.progressView.alpha = 1.0f;
    if (progress < self.progressView.progress) {
        [self.progressView setProgress:progress animated:NO];
    } else {
        [self.progressView setProgress:progress animated:animated];
    }
}
@end
