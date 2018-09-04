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


#define WeakObject(object)  __weak typeof(object) object##Weak = object;
#define StrongObject(object)  __strong typeof(object) object = object##Weak;
