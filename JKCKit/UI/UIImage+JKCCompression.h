//
//  UIImage+JKCCompression.h
//  Demo
//
//  Created by yct on 2018/9/29.
//  Copyright © 2018年 JKC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (JKCCompression)

- (UIImage * _Nonnull)jkc_compressWithMaxSize:(NSUInteger)maxSize;

- (UIImage * _Nonnull)jkc_compressWithMaxSize:(NSUInteger)maxSize threshold:(NSUInteger)threshold;

- (UIImage * _Nonnull)jkc_compressToReferenceLength:(NSUInteger)referenceLength;
@end
