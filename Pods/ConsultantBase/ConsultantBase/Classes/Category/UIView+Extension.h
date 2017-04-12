//
//  UIView+Extension.h
//
//  Created by 韩承海 on 16/8/3.
//  Copyright © 2016年 韩小醋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

/*----------------------
 * Absolute coordinate *
 ----------------------*/
@property (nonatomic, assign) CGFloat               x;
@property (nonatomic, assign) CGFloat               y;

@property (nonatomic, assign) CGPoint               origin;
@property (nonatomic, assign) CGSize                size;


@property (nonatomic, assign) CGFloat               centerX;
@property (nonatomic, assign) CGFloat               centerY;

@property (nonatomic, assign) CGFloat               width;
@property (nonatomic, assign) CGFloat               height;

@property (nonatomic, assign) CGFloat               top;
@property (nonatomic, assign) CGFloat               bottom;
@property (nonatomic, assign) CGFloat               left;
@property (nonatomic, assign) CGFloat               right;

/*----------------------
 * Relative coordinate *
 ----------------------*/
@property (nonatomic, readonly) CGFloat middleX;
@property (nonatomic, readonly) CGFloat middleY;
@property (nonatomic, readonly) CGPoint middlePoint;

@property (nonatomic, assign) CGFloat               maxX;
@property (nonatomic, assign) CGFloat               maxY;



@property (nonatomic, assign) CGFloat aniAlphaDuration;

@property (nonatomic, assign) CGFloat animationAlpha;

/**
 *	@brief	缩放系统控件
 */
- (void)scaleToSize:(CGSize)size;


/**
 *	@brief	删除所有子对象
 */
- (void)removeAllSubviews;


/**
 *  @brief  打印视图层级
 *
 *  @return 打印视图层级字符串
 */
-(NSString*)recursiveView;
/**
 *  @brief  打印约束
 *
 *  @return 打印约束字符串
 */
-(NSString*)constraintsDescription;
/**
 *  @brief  打印整个autolayout树的字符串
 *
 *  @return 打印整个autolayout树的字符串
 */
-(NSString*)autolayoutTraceDescription;

/**
 *  打印属性列表
 */
- (void)printIvarList;

/**
 *  从xib加载
 *
 *  @return id
 */
+ (id)viewFromNib;


@end
