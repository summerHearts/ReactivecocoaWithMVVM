//
//  UIButton+Convenience.m
//  Consultant997
//
//  Created by 韩承海 on 2017/3/26.
//  Copyright © 2017年 上海房产. All rights reserved.
//

#import "UIButton+Convenience.h"

@implementation UIButton (Convenience)
@dynamic title;

- (NSString *)title{
    return self.titleLabel.text;
}
- (void)setTitle:(NSString *)title{
    [self setTitle:title forState:UIControlStateNormal];
}
@end
