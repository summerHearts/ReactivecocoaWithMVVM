//
//  UIButton+Layout.h
//
//  Created by hanxiaocu on 16-8-21.
//  Copyright (c) 2015年 hanxiaocu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Extension.h"
typedef NS_ENUM(NSUInteger, ButtonEdgeInsetsStyle) {
    ButtonEdgeInsetsStyleImageLeft,
    ButtonEdgeInsetsStyleImageRight,
    ButtonEdgeInsetsStyleImageTop,
    ButtonEdgeInsetsStyleImageBottom
};


@interface UIButton (Layout)

- (void)setVerticalLayoutWithSpace:(CGFloat)itemSpace;
- (void)setImageRightWithSpace:(CGFloat)space;




- (void)layoutButtonWithEdgeInsetsStyle:(ButtonEdgeInsetsStyle)style imageTitlespace:(CGFloat)space;

@end
