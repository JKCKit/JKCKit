//
//  UIViewController+NavItem.m
//  Demo
//
//  Created by Dc on 2018/9/18.
//  Copyright © 2018年 JKC. All rights reserved.
//

#define BackButtonImageName @"fh_"
#define DefaultColorOfNavigationBar UIColorFromRGB(0xFF9B17)
#define DefaultFontOfNavigationBarTitle [UIFont systemFontOfSize:16]
#define DefaultTextColorOfNavigationBarTitle UIColorFromRGB(0x333333)
#define DefaultTextColorOfNavigationItem UIColorFromRGB(0x333333)
#define DefaultButtonFontSize 16


#import "UIViewController+NavItem.h"
#import <objc/runtime.h>
#import "JKCKit.h"

static id leftBlockKey;
static id rightBlockKey;

@implementation UIViewController (NavItem)

- (void)configNavigationBackAction:(voidBlock)action{
    [self configNavigationLeftItemWith:[UIImage imageNamed:BackButtonImageName] andAction:action];
}

- (void)configNavigationLeftItemWith:(id)object andAction:(voidBlock)action{
    [self configNavigationItemWith:object leftOrRight:YES andAction:action];
}

- (void)configNavigationLeftItemWith:(UIImage *)image title:(NSString *)title action:(voidBlock)action {
    if (action) {
        objc_setAssociatedObject(self,
                                 &leftBlockKey,
                                 action,
                                 OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
    UIButton* customButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [customButton setImage:image forState:UIControlStateNormal];
    [customButton setTitle:[@" " stringByAppendingString:title] forState:UIControlStateNormal];
    [customButton setTitleColor:DefaultTextColorOfNavigationItem forState:UIControlStateNormal];
    [customButton.titleLabel setFont:[UIFont systemFontOfSize:DefaultButtonFontSize]];
    [customButton sizeToFit];
    [customButton addTarget:self action:@selector(pressLeft:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* customBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:customButton];
    self.navigationItem.leftBarButtonItem = customBarButtonItem;
}

- (void)configNavigationRightItemWith:(id)object andAction:(voidBlock)action{
    [self configNavigationItemWith:object leftOrRight:NO andAction:action];
}

- (void)configNavigationLeftString:(NSString*)text textFont:(UIFont*)font andAction:(voidBlock)action{
    [self configNavigationItemString:text withFont:font leftOrRight:YES andAction:action];
}

- (void)configNavigationRightString:(NSString*)text textFont:(UIFont*)font andAction:(voidBlock)action{
    [self configNavigationItemString:text withFont:font leftOrRight:NO andAction:action];
}

- (void)configNavigationBarTintColor:(UIColor*)color{
    const CGFloat *designValues = CGColorGetComponents(color.CGColor);
    CGFloat *realValues = malloc( sizeof(CGFloat) * 3);
    for (int i = 0 ; i < 3; i++) {
        realValues[i] = (designValues[i] - 0.23) / 0.6;
    }
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:realValues[0] green:realValues[1] blue:realValues[2] alpha:1]];
}

- (void)configNavigationBarTitleAppearance{
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowOffset = CGSizeZero;
    [self.navigationController.navigationBar setTintColor:DefaultTextColorOfNavigationBarTitle];
    NSDictionary *attributes = @{ NSFontAttributeName: DefaultFontOfNavigationBarTitle,
                                  NSForegroundColorAttributeName: DefaultTextColorOfNavigationBarTitle,
                                  NSShadowAttributeName : shadow};
    [self.navigationController.navigationBar setTitleTextAttributes:attributes];
}

- (void)configDefaultNavigationBarStyle{
    [self configNavigationBarTintColor:DefaultColorOfNavigationBar];
    [self configNavigationBarTitleAppearance];
}

- (void)configNavigationItemString:(NSString*)text withFont:(UIFont*)font leftOrRight:(BOOL)left andAction:(voidBlock)action{
    NSCAssert([text isKindOfClass:[NSString class]], @"the text must be class of NSString");
    
    if (action) {
        objc_setAssociatedObject(self, left ? &leftBlockKey : &rightBlockKey,
                                 action,
                                 OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithTitle:text style:UIBarButtonItemStyleDone target:self action:left ? @selector(pressLeft:) : @selector(pressRight:)];
    NSDictionary * attributes = @{NSFontAttributeName: font};
    [barButtonItem setTitleTextAttributes:attributes forState:UIControlStateNormal];
    [barButtonItem setTintColor:DefaultTextColorOfNavigationItem];
    if (left) {
        self.navigationItem.leftBarButtonItem = barButtonItem;
    }else {
        self.navigationItem.rightBarButtonItem = barButtonItem;
    }
}

- (void)configNavigationItemWith:(id)object leftOrRight:(BOOL)left andAction:(voidBlock)action{
    
    NSCAssert([object isKindOfClass:[NSString class]] || [object isKindOfClass:[UIImage class]], @"the object must be class of NSString or UIImage");
    
    if ([object isKindOfClass:[UIImage class]]) {
        if (action) {
            objc_setAssociatedObject(self, left ? &leftBlockKey : &rightBlockKey,
                                     action,
                                     OBJC_ASSOCIATION_COPY_NONATOMIC);
        }
        UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithImage:[object imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:left ? @selector(pressLeft:) : @selector(pressRight:)];
        if (left) {
            self.navigationItem.leftBarButtonItem = barButtonItem;
        }else {
            self.navigationItem.rightBarButtonItem = barButtonItem;
        }
    }else {
        [self configNavigationItemString:object withFont:DefaultFontOfNavigationBarTitle leftOrRight:left andAction:action];
    }
}

#pragma mark -
#pragma mark -------------------- User Action ---------------------
- (void)pressLeft:(id)sender{
    voidBlock action = objc_getAssociatedObject(self, &leftBlockKey);
    if (action) {
        action();
    }
}

- (void)pressRight:(id)sender{
    voidBlock action = objc_getAssociatedObject(self, &rightBlockKey);
    if (action) {
        action();
    }
}

@end
