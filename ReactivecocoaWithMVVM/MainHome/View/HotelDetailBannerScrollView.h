//
//  BannerScrollView.h
//  BHFangChuang
//
//  Created by Kenvin on 16/8/9.
//  Copyright © 2016年 上海方创金融股份信息服务有限公司. All rights reserved.
//

//banner默认数量
#define DefaultBannerNumber 4

@interface HotelDetailBannerScrollView : UIView

@property (nonatomic,strong) UIPageControl *pagecontrol;

@property (nonatomic ,strong) UILabel *pictureLabel;

@property (nonatomic,strong) UILabel *projectNameLabel;

@property (nonatomic,strong) UILabel *projectDetailLabel;

/**
 *  顶部模型数据类型
 */
@property (nonatomic,strong) NSMutableArray *topListArray;


- (void)loadBannerSourceSignal:(RACSignal *)source isLoop:(BOOL)isLoop;

@property (nonatomic, strong) RACSubject *delegateSubject;

- (void)layoutHeaderViewForScrollViewOffset:(CGPoint)offset;

@end
