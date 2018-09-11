//
//  UILabel+JKCUtils.m
//  Demo
//
//  Created by yct on 2018/9/7.
//  Copyright © 2018年 JKC. All rights reserved.
//

#import "UILabel+JKCUtils.h"
#import <objc/runtime.h>

static NSString *optimizeHeightKey = @"optimizeHeightKey";

@implementation UILabel (JKCUtils)

- (BOOL)isOptimizeHeight {
    return [objc_getAssociatedObject(self, (__bridge const void * _Nonnull)(optimizeHeightKey)) boolValue];
}

- (void)setOptimizeHeight:(BOOL)optimizeHeight {
    if (optimizeHeight) {
        self.numberOfLines = 0;
    }
    objc_setAssociatedObject(self, (__bridge const void * _Nonnull)(optimizeHeightKey), @(optimizeHeight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (void)load {
    {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            Class class = [self class];
            SEL originalSelector = @selector(didChangeValueForKey:);
            SEL swizzledSelector = @selector(jkc_labelDidChangeValueForKey:);
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

- (void)jkc_labelDidChangeValueForKey:(NSString *)key {
    [self jkc_labelDidChangeValueForKey:key];
    if (self.isOptimizeHeight) {
        if ((self && [key isEqualToString:@"text"])) {
//            self si
//            [self.text boundingRectWithSize:CGSizeMake(self.bounds.size.width, MAXFLOAT) options:kNilOptions attributes:nil context:NULL];
        } else if ((self && [key isEqualToString:@"attributedText"])) {
            
        }
    }
}
@end
