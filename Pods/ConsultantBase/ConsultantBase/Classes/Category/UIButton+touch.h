//
//  UIButton+touch.h
//  ShanghaiEstate
//
//  Created by 韩承海 on 16/10/10.
//  Copyright © 2016年 OrientFinance. All rights reserved.
//

#import <UIKit/UIKit.h>

#define defaultInterval 0.5  //默认时间间隔
@interface UIButton (touch)
/**设置点击时间间隔*/
@property (nonatomic, assign) NSTimeInterval timeInterval;
/**
 *  用于设置单个按钮不需要被hook
 */
@property (nonatomic, assign) BOOL isIgnore;
@end
