//
//  JKCMacro.h
//  Demo
//
//  Created by yct on 2018/8/30.
//  Copyright © 2018年 JKC. All rights reserved.
//

#ifndef JKCMacro_h
#define JKCMacro_h

#endif /* JKCMacro_h */


#define JKCWeakObject(object)  __weak typeof(object) object##Weak = object;
#define JKCStrongObject(object)  __strong typeof(object) object = object##Weak;

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]    //设置color
