//
//  UIImage+JKCCompression.m
//  Demo
//
//  Created by yct on 2018/9/29.
//  Copyright © 2018年 JKC. All rights reserved.
//

#import "UIImage+JKCCompression.h"

@implementation UIImage (JKCCompression)

- (UIImage * _Nonnull)jkc_compressWithMaxSize:(NSUInteger)maxSize {
    return [self jkc_compressWithMaxSize:maxSize threshold:100 * 1024];
}

- (UIImage * _Nonnull)jkc_compressWithMaxSize:(NSUInteger)maxSize threshold:(NSUInteger)threshold {
    if (!self.CGImage) {
        return self;
    }
    
    NSData *imageData = UIImageJPEGRepresentation(self, 1.0f);
    if (imageData.length <= maxSize) {
        return self;
    }
    
    CGFloat (^dichotomyFactor)(CGFloat start, CGFloat end) = ^(CGFloat start, CGFloat end) {
        return (CGFloat)((start + end) / 2.0);
    };
    BOOL (^isCompressImageFinsh)(NSUInteger dataLength, NSUInteger threshold) = ^(NSUInteger dataLength, NSUInteger threshold) {
        if (dataLength < (maxSize + threshold)) {
            return YES;
        }
        return NO;
    };
    UIImage *targetImage = self;
    CGFloat imageWidth = self.size.width * self.scale;
    CGFloat imageHeight = self.size.height * self.scale;
    CGFloat referenceLengthStart = 0.0f;
    CGFloat referenceLengthEnd = 1.0f;
    CGFloat referenceLengthFactor = dichotomyFactor(referenceLengthStart, referenceLengthEnd);
    CGFloat scaleStart = 0.0f;
    CGFloat scaleEnd = (maxSize * 1.0) / imageData.length;
    CGFloat scaleFactor = scaleEnd;
    NSData *compressData;
    NSUInteger lastReferenceLengthCompressDataLength = imageData.length;
    @autoreleasepool {
        while (1) {
            compressData = UIImageJPEGRepresentation(targetImage, scaleFactor);
            if (isCompressImageFinsh(compressData.length, threshold)) {
                break;
            } else {
                if (compressData.length > lastReferenceLengthCompressDataLength) {
                    scaleFactor = .09;
                }
                if (scaleFactor > .1) {
                    if (compressData.length > maxSize) {
                        scaleEnd = scaleFactor;
                        scaleFactor = dichotomyFactor(scaleStart, scaleEnd);
                    } else {
                        scaleStart = scaleFactor;
                        scaleFactor = dichotomyFactor(scaleStart, scaleEnd);
                    }
                } else {
                    lastReferenceLengthCompressDataLength = MIN(compressData.length, lastReferenceLengthCompressDataLength);
                    if (!CGSizeEqualToSize(self.size, targetImage.size)) {
                        referenceLengthEnd = referenceLengthFactor;
                        referenceLengthFactor = dichotomyFactor(referenceLengthStart, referenceLengthEnd);
                    }
                    targetImage = [self jkc_compressToReferenceLength:MAX(imageWidth, imageHeight) * referenceLengthFactor];
                    scaleFactor = 1.0f;
                }
            }
        }
    }
    return [UIImage imageWithData:compressData];
}

- (UIImage * _Nonnull)jkc_compressToReferenceLength:(NSUInteger)referenceLength {
    CGFloat imageWidth = self.size.width * self.scale;
    CGFloat imageHeight = self.size.height * self.scale;
    CGFloat scaleFactor = 1.0f;
    if (imageWidth <= referenceLength && imageHeight <= referenceLength) {
        return self;
    } else if (imageWidth > referenceLength && imageHeight <= referenceLength) {
        scaleFactor = referenceLength / imageHeight;
    } else if (imageWidth <= referenceLength && imageHeight > referenceLength) {
        scaleFactor = referenceLength / imageWidth;
    } else {
        scaleFactor = referenceLength / MIN(imageWidth, imageHeight);
    }
    
    CGFloat scaledWidth = imageWidth * scaleFactor;
    CGFloat scaledHeight = imageHeight * scaleFactor;
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(scaledWidth / self.scale, scaledHeight / self.scale), YES, [UIScreen mainScreen].scale);
    [self drawInRect:CGRectMake(0, 0, scaledWidth / self.scale, scaledHeight / self.scale)];
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resultImage;
}
@end
