//
//  UIImage+JKCUtils.h
//  Demo
//
//  Created by Dc on 2018/9/18.
//  Copyright © 2018年 JKC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (JKCUtils)

//由颜色生成图片
+ (UIImage *) imageWithColor:(UIColor*)color;

//将图片剪裁至目标尺寸
+ (UIImage *) imageByScalingAndCroppingForSourceImage:(UIImage *)sourceImage targetSize:(CGSize)targetSize;

//图片旋转角度
- (UIImage *) imageRotatedByDegrees:(CGFloat)degrees;

//拉伸图片UIEdgeInsets
- (UIImage *) resizableImage:(UIEdgeInsets)insets;

//拉伸图片CGFloat
- (UIImage *) imageByResizeToScale:(CGFloat)scale;

//放大图片CGSize
- (UIImage *) imageByResizeWithMaxSize:(CGSize)size;

//小图片CGSize
- (UIImage *) imageWithThumbnailForSize:(CGSize)size;

//通过Rect剪裁图片
- (UIImage *) imageByCropToRect:(CGRect)rect;

//图片增加圆角
- (UIImage *) imageByRoundCornerRadius:(CGFloat)radius;

//图片增加圆角及边框
- (UIImage *) imageByRoundCornerRadius:(CGFloat)radius
                           borderWidth:(CGFloat)borderWidth
                           borderColor:(UIColor *)borderColor;
//图片转180度
- (UIImage *)imageByRotate180;


@end


@interface UIImage (Blur)
//玻璃化效果
- (UIImage *)imageByBlurSoft;

- (UIImage *)imageByBlurLight;

- (UIImage *)imageByBlurExtraLight;

- (UIImage *)imageByBlurDark;

- (UIImage *)imageByBlurWithTint:(UIColor *)tintColor;

- (UIImage *)imageByBlurRadius:(CGFloat)blurRadius
                     tintColor:(UIColor *)tintColor
                      tintMode:(CGBlendMode)tintBlendMode
                    saturation:(CGFloat)saturation
                     maskImage:(UIImage *)maskImage;

- (UIImage *) boxblurImageWithBlur:(CGFloat)blur exclusionPath:(UIBezierPath *)exclusionPath;
@end





@interface UIImage (ImageEffects)

//图片效果

- (UIImage *)applyLightEffect;
- (UIImage *)applyExtraLightEffect;
- (UIImage *)applyDarkEffect;
- (UIImage *)applyBlurEffect;
- (UIImage *)applyTintEffectWithColor:(UIColor *)tintColor;
- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius
                       tintColor:(UIColor *)tintColor
           saturationDeltaFactor:(CGFloat)saturationDeltaFactor
                       maskImage:(UIImage *)maskImage;

@end
