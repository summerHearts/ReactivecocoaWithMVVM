//
//  UIView+Extension.m
//
//  Created by 韩承海 on 16/8/3.
//  Copyright © 2016年 韩小醋. All rights reserved.
//

#import "UIView+Extension.h"
#import <objc/runtime.h>

@implementation UIView (Extension)

@dynamic maxX;
@dynamic maxY;

@dynamic top;
@dynamic bottom;
@dynamic left;
@dynamic right;

@dynamic width;
@dynamic height;

@dynamic size;

@dynamic x;
@dynamic y;

@dynamic animationAlpha;
@dynamic aniAlphaDuration;



- (CGFloat)x{
    return self.frame.origin.x;
}
- (void)setX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}



- (CGFloat)y{
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}



- (CGFloat)centerX{
    return self.center.x;
}
- (void)setCenterX:(CGFloat)centerX{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}




- (CGFloat)centerY
{
    return self.center.y;
}
- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}


- (CGFloat)width{
    return self.frame.size.width;
}
- (void)setWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}


- (CGFloat)height{
    return self.frame.size.height;
}
- (void)setHeight:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}


- (CGSize)size{
    return self.frame.size;
}

- (void)setSize:(CGSize)size{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}


- (CGPoint)origin{
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}


- (CGFloat)left{
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)left{
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}


- (CGFloat)right{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right{
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}


- (CGFloat)top{
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)top{
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}



- (CGFloat)bottom{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom{
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}



-(CGFloat)maxX{
    return CGRectGetMaxX(self.frame);
}

-(CGFloat)maxY{
    return CGRectGetMaxY(self.frame);
}


- (CGFloat)middleX {
    
    return CGRectGetWidth(self.bounds) / 2.f;
}

- (CGFloat)middleY {
    
    return CGRectGetHeight(self.bounds) / 2.f;
}

- (CGPoint)middlePoint {
    
    return CGPointMake(CGRectGetWidth(self.bounds) / 2.f, CGRectGetHeight(self.bounds) / 2.f);
}



#pragma mark - private method
- (void)setAniAlphaDuration:(CGFloat)aniAlphaDuration{
    self.alpha = 0.0;
    [UIView animateWithDuration:aniAlphaDuration animations:^{
        self.alpha = 1.0;
    }];
}
- (void)setAnimationAlpha:(CGFloat)animationAlpha{
    self.alpha = animationAlpha;
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 1.0;
    }];
}


- (void)scaleToSize:(CGSize)size{
    CGSize initialSize = self.bounds.size;
    CGFloat scale = size.width / initialSize.width;
    self.transform = CGAffineTransformMakeScale(scale, scale);
}


- (void)removeAllSubviews{
    while (self.subviews.count)
    {
        UIView *child = self.subviews.lastObject;
        [child removeFromSuperview];
    }
}


#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
/**
 *  @brief  打印视图层级
 *
 *  @return 打印视图层级字符串
 */
-(NSString*)recursiveView{
    NSString *description = [NSString stringWithFormat:@"%s [Line %d] \r\r %@",
                             __PRETTY_FUNCTION__, __LINE__,
                             [self performSelector:@selector(recursiveDescription)]];
    return description;
}
/**
 *  @brief  打印约束
 *
 *  @return 打印约束字符串
 */
-(NSString*)constraintsDescription{
    NSString *description = [NSString stringWithFormat:@"%s [Line %d] \r\r %@ \r\r",
                             __PRETTY_FUNCTION__, __LINE__,
                             [[self constraints] description]];
    return description;
}
/**
 *  @brief  打印整个autolayout树的字符串
 *
 *  @return 打印整个autolayout树的字符串
 */
-(NSString*)autolayoutTraceDescription{
    NSString *description = [NSString stringWithFormat:@"%s [Line %d] \r\r %@",
                             __PRETTY_FUNCTION__, __LINE__,
                             [self performSelector:@selector(_autolayoutTrace)]];
    return description;
}
#pragma clang diagnostic pop


+ (id)viewFromNib{
    UIView *result = nil;
    NSArray* elements = [[NSBundle mainBundle] loadNibNamed: NSStringFromClass([self class])
                                                      owner: nil options: nil];
    for (id anObject in elements) {
        if ([anObject isKindOfClass:[self class]]){
            result = anObject;
            break;
        }
    }
    return result;
}

#pragma mark - 打印属性
- (void)printIvarList{
    unsigned int count = 0;
    Ivar *var = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i ++) {
        Ivar _var = *(var + i);
        NSLog(@"%s",ivar_getTypeEncoding(_var));
        NSLog(@"%s",ivar_getName(_var));
    }
}

@end
