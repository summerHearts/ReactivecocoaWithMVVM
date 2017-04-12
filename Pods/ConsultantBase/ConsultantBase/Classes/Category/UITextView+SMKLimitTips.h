//
//  UITextView+SMKLimitTips.h
//  SMKKit
//
//  Created by Kenvin on 2017/3/24.
//  Copyright © 2017年 Kenvin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (SMKLimitTips)

@property (nonatomic,strong) NSString *placeholder;//占位符

@property (copy, nonatomic) NSNumber *limitLength;//限制字数

@end
