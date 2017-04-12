//
//  UIScrollView+Placeholder.h
//  ShanghaiEstate
//
//  Created by 韩承海 on 2016/11/2.
//  Copyright © 2016年 OrientFinance. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (Placeholder)
@property (strong , nonatomic) UIImage  * emptyImage;
@property (copy , nonatomic  ) NSString * emptyTitle;
@property (copy , nonatomic  ) NSString * emptySubtitle;
@property (copy , nonatomic  ) NSString * emptyBtntitle;



@property (strong , nonatomic) UIImage  * netFailedImage;
@property (copy , nonatomic  ) NSString * netFailedTitle;
@property (copy , nonatomic  ) NSString * netFailedSubtitle;
@property (copy , nonatomic  ) NSString * netFailedBtntitle;



//MARK: 是否网络失败
@property (assign , nonatomic) BOOL isNetFailed;
//MARK: 是否自定义占位视图
@property (nonatomic, assign) BOOL isCustomPlaceHolder ;


@end
