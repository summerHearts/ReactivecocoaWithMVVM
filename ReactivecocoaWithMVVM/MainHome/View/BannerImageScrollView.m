//
//  BannerImageScrollView.m
//  BHFangChuang
//
//  Created by Kenvin on 16/8/9.
//  Copyright © 2016年 上海方创金融股份信息服务有限公司. All rights reserved.
//

#import "BannerImageScrollView.h"
//202灰
#define COLOR_202GRAY RGB(202,202,202)
@interface BannerImageScrollView()<UIScrollViewDelegate>

@end

@implementation BannerImageScrollView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        //self
        self.scrollEnabled=NO;
        self.showsHorizontalScrollIndicator=NO;
        self.showsVerticalScrollIndicator=NO;
        self.clipsToBounds = NO;
        //imageView
        _imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,frame.size.height)];
        _imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _imageView.contentMode = UIViewContentModeScaleToFill;
        _imageView.backgroundColor=[UIColor clearColor];
        [self addSubview:_imageView];
    }
    return self;
}

- (void)scrollHorizontalRatio:(CGFloat)ratio
{
    [self setContentOffset:CGPointMake(SCREEN_WIDTH/2 + ratio * SCREEN_WIDTH/2, self.contentOffset.y)];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
}

@end
