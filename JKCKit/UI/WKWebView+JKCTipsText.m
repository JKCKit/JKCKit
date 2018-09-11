//
//  WKWebView+JKCTipsText.m
//  Demo
//
//  Created by yct on 2018/9/10.
//  Copyright © 2018年 JKC. All rights reserved.
//

#import "WKWebView+JKCTipsText.h"
#import <objc/runtime.h>

static const NSInteger tag = 01233210;

@implementation WKWebView (JKCTipsText)
+ (void)load {
    {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            Class class = [self class];
            SEL originalSelector = @selector(didChangeValueForKey:);
            SEL swizzledSelector = @selector(jkc_wkwebViewDidChangeValueForKey:);
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

- (void)jkc_wkwebViewDidChangeValueForKey:(NSString *)key {
    [self jkc_wkwebViewDidChangeValueForKey:key];
//    if ([key isEqualToString:@"estimatedProgress"]) {
//        if (self.estimatedProgress == 1.0f) {
//            UILabel *label = (UILabel *)[self viewWithTag:tag];
//            label.hidden = NO;
//            self.scrollView.backgroundColor = [UIColor clearColor];
//        }
//    }
}


- (void)jkc_setTipsText:(NSString *)text {
    UILabel *label = (UILabel *)[self viewWithTag:tag];
    if ([label isKindOfClass:[UILabel class]]) {
        if (text) {
            label.text = text;
        } else {
            [label removeFromSuperview];
        }
    } else {
        label = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, self.bounds.size.width, 20)];
        label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        label.backgroundColor = [UIColor clearColor];
        label.text = text;
        label.tag = tag;
        label.font = [UIFont systemFontOfSize:13.0f];
        label.textColor = [UIColor lightGrayColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.alpha = 0.0f;
        [self insertSubview:label belowSubview:self.scrollView];
    }
}


@end
