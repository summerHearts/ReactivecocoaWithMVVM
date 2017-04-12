//
//  UITextView+SMK_Kit.h
//  SMKKit
//
//  Created by Kenvin on 16/3/19.
//  Copyright © 2016年 Kenvin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITextView+SMKLimit.h"
#import "UITextView+SMK_Placeholder.h"
@interface UITextView (SMK_Kit)

@end
@interface UITextView (SMK_inputAccessoryView)

@property (weak, nonatomic) UIResponder *smk_lastFirstResponder;
@property (weak, nonatomic) UIResponder *smk_nextFirstResponder;
@property (assign, nonatomic) BOOL smk_showInputAccessoryView; // 自动展示SMKInputAccessoryView工具条

@end
