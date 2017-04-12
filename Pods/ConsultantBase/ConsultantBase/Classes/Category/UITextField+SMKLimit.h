//
//  UITextField+SMKLimit.h
//  SMKKit
//
//  Created by Kenvin on 16/3/19.
//  Copyright © 2016年 Kenvin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (SMKLimit)

/*
 * @brief 设置最大长度
 */
@property (assign,nonatomic) NSUInteger smk_maxLength;
@end
