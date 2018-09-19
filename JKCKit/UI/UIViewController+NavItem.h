//
//  UIViewController+NavItem.h
//  Demo
//
//  Created by Dc on 2018/9/18.
//  Copyright © 2018年 JKC. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^voidBlock)(void);

@interface UIViewController (NavItem)

/**
 *  config back action of UINavigationItem
 *
 *  @param action block
 */
- (void)configNavigationBackAction:(voidBlock)action;
/**
 *  config left UINavigationItem, the object must be NSString or UIImage object
 *
 *  @param object must be NSString or UIImage object
 *  @param action block
 */
- (void)configNavigationLeftItemWith:(id)object andAction:(voidBlock)action;


- (void)configNavigationLeftItemWith:(UIImage *)image title:(NSString *)title action:(voidBlock)action;

/**
 *  config right UINavigationItem, the object must be NSString or UIImage object
 *
 *  @param object must be NSString or UIImage object
 *  @param action block
 */
- (void)configNavigationRightItemWith:(id)object andAction:(voidBlock)action;

/**
 *  config left UINavigationItem with text and font
 *
 *  @param text NSString object
 *  @param action block
 */
- (void)configNavigationLeftString:(NSString*)text textFont:(UIFont*)font andAction:(voidBlock)action;


/**
 *  config right UINavigationItem with text and font
 *
 *  @param text NSString object
 *  @param action block
 */
- (void)configNavigationRightString:(NSString*)text textFont:(UIFont*)font andAction:(voidBlock)action;

- (void)configNavigationBarTintColor:(UIColor*)color;

- (void)configNavigationBarTitleAppearance;

- (void)configDefaultNavigationBarStyle;

@end
