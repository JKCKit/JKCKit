//
//  UIButton+JKCUtils.m
//  Demo
//
//  Created by Dc on 2018/9/18.
//  Copyright © 2018年 JKC. All rights reserved.
//

#import "UIButton+JKCUtils.h"
#import <objc/runtime.h>
static const char *UIControl_acceptEventInterval = "UIControl_acceptEventInterval";

@implementation UIButton (JKCUtils)


- (NSTimeInterval)acceptEventInterval
{
    return [objc_getAssociatedObject(self, UIControl_acceptEventInterval) doubleValue];
}


- (void)setAcceptEventInterval:(NSTimeInterval)acceptEventInterval
{
    objc_setAssociatedObject(self, UIControl_acceptEventInterval, @(acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)yct_ignoreEvent
{
    return [objc_getAssociatedObject(self, UIControl_acceptEventInterval) doubleValue];
}

+ (void)load
{
    Method methodA = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method methodB = class_getInstanceMethod(self, @selector(yct_sendAction:to:froEvent:));
    
    method_exchangeImplementations(methodA, methodB);
}

- (void)yct_sendAction:(SEL)action to:(id)target froEvent:(UIEvent *)event
{
    if (self.acceptEventInterval > 0) {
        if (self.userInteractionEnabled) {
            
            [self yct_sendAction:action to:target froEvent:event];
        }
        self.userInteractionEnabled = NO;
        
        [self performSelector:@selector(setUserInteractionEnabled:) withObject:@(YES) afterDelay:self.acceptEventInterval];
        
        
        // GCD 延迟执行 self.acceptEventInterval：为延迟时间
        __weak typeof (self) weakSelf = self;
        dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.acceptEventInterval * NSEC_PER_SEC));
        
        dispatch_after(delayTime, dispatch_get_main_queue(), ^{
            weakSelf.userInteractionEnabled = YES;
        });
        
    } else {
        [self yct_sendAction:action to:target froEvent:event];
    }
    
}


-(void)setNormolImage:(NSString *)normalImageName
       highlightImage:(NSString *)highlightImageName {
    [self setImage:[UIImage imageNamed:normalImageName] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:highlightImageName] forState:UIControlStateHighlighted];
    [self setImage:[UIImage imageNamed:highlightImageName] forState:UIControlStateSelected];
}

-(void)setBackgroundNormolImage:(NSString *)normalImageName
                 highlightImage:(NSString *)highlightImageName {
    [self setBackgroundImage:[UIImage imageNamed:normalImageName] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage imageNamed:highlightImageName] forState:UIControlStateHighlighted];
    [self setBackgroundImage:[UIImage imageNamed:highlightImageName] forState:UIControlStateSelected];
}

- (UIEdgeInsets)touchAreaInsets {
    return [objc_getAssociatedObject(self, @selector(touchAreaInsets)) UIEdgeInsetsValue];
}

-(void)add_startTime:(NSInteger)timeLimit
               title:(NSString *)tittle
          waitTittle:(NSString *)waitTittle {
    __block NSInteger timeOut=timeLimit; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeOut<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [self setTitle:tittle forState:UIControlStateNormal];
                self.userInteractionEnabled = YES;
            });
        }else {
            //            int minutes = timeout / 60;
            int seconds = timeOut % 60;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                NSLog(@"____%@",strTime);
                [self setTitle:[NSString stringWithFormat:@"%@%@",strTime,waitTittle] forState:UIControlStateNormal];
                self.userInteractionEnabled = NO;
                
            });
            timeOut--;
        }
    });
    dispatch_resume(_timer);
}

- (void)setTouchAreaInsets:(UIEdgeInsets)touchAreaInsets {
    NSValue *value = [NSValue valueWithUIEdgeInsets:touchAreaInsets];
    objc_setAssociatedObject(self, @selector(touchAreaInsets), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    UIEdgeInsets touchAreaInsets = self.touchAreaInsets;
    CGRect bounds = self.bounds;
    bounds = CGRectMake(bounds.origin.x - touchAreaInsets.left,
                        bounds.origin.y - touchAreaInsets.top,
                        bounds.size.width + touchAreaInsets.left + touchAreaInsets.right,
                        bounds.size.height + touchAreaInsets.top + touchAreaInsets.bottom);
    return CGRectContainsPoint(bounds, point);
}

@end
