//
//  UIImage+Tint.h
//  SMKKit
//
//  Created by Kenvin on 16/8/19.
//  Copyright © 2016年 Kenvin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Tint)
- (UIImage *) imageWithTintColor:(UIColor *)tintColor;
- (UIImage *) imageWithGradientTintColor:(UIColor *)tintColor;

@end
