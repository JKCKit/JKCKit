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

#define kJKCScreenWidth [UIScreen mainScreen].bounds.size.width

#define kJKCScreenHeight [UIScreen mainScreen].bounds.size.height

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]    //设置color

#define CIColorFromRGB(rgbValue) [CIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#ifdef DEBUG
#define JKCLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define JKCLog(...)
#endif

#define JKCSetupSingletonMethod - (void)jkc_setupSingleton

#define JKCSingletonH(name) + (instancetype)share##name;

#define JKCSingletonM(name) \
static id singleton;\
+ (instancetype)share##name {\
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken, ^{\
        singleton = [[super allocWithZone:nil] init];\
_Pragma("clang diagnostic push")\
_Pragma("clang diagnostic ignored \"-Wundeclared-selector\"")\
        if ([singleton respondsToSelector:@selector(jkc_setupSingleton)]) {\
            [singleton performSelector:@selector(jkc_setupSingleton)];\
        }\
_Pragma("clang diagnostic pop") \
    });\
    return singleton;\
}\
+ (instancetype)allocWithZone:(struct _NSZone *)zone {\
return [self share##name];\
}\
- (id)copy {\
return [self.class share##name];\
}\
