//
//  BannerImageScrollView.h
//  BHFangChuang
//
//  Created by Kenvin on 16/8/9.
//  Copyright © 2016年 上海方创金融股份信息服务有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BannerImageScrollView : UIScrollView

@property(strong,nonatomic) UIImageView *imageView;

- (void)scrollHorizontalRatio:(CGFloat)ratio;

@end
