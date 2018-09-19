//
//  UIButton+JKCUtils.h
//  Demo
//
//  Created by Dc on 2018/9/18.
//  Copyright © 2018年 JKC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (JKCUtils)

//设置图片
-(void)setNormolImage:(NSString*)normalImageName
       highlightImage:(NSString *)highlightImageName;

//设置背景图片
-(void)setBackgroundNormolImage:(NSString*)normalImageName
       highlightImage:(NSString *)highlightImageName;

//设置按钮的额外点击区域
- (UIEdgeInsets)touchAreaInsets;

/**
 *   为按钮添加倒计时样式
 *
 *   timeLimit 时间
 *   tittle  按钮标题
 *   waitTittle 倒计时标题
     在创建Button时设置Button的样式:
     当type为UIButtonTypeCustom时是正常读秒的效果.
     当type为其他时有闪动效果
 */
-(void)add_startTime:(NSInteger )timeLimit
               title:(NSString *)tittle
          waitTittle:(NSString *)waitTittle;

@end
