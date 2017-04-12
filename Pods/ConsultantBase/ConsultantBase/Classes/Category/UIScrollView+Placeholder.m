//
//  UIScrollView+Placeholder.m
//  ShanghaiEstate
//
//  Created by 韩承海 on 2016/11/2.
//  Copyright © 2016年 OrientFinance. All rights reserved.
//

#import "UIScrollView+Placeholder.h"
#import <objc/runtime.h>
static char const * const kEmptyTitle        = "kEmptyTitle";
static char const * const kEmptyImage        = "kEmptyImage";
static char const * const kEmptyBtnTitle     = "kEmptyBtnTitle";
static char const * const kEmptySubtitle     = "kEmptySubtitle";


static char const * const kNetFailedTitle    = "kNetFailedTitle";
static char const * const kNetFailedImage    = "kNetFailedImage";
static char const * const kNetFailedBtnTitle = "kNetFailedBtnTitle";
static char const * const kNetFailedSubtitle = "kNetFailedSubtitle";

@implementation UIScrollView (Placeholder)


#pragma mark - 空视图
- (NSString *)emptyTitle{
    return  objc_getAssociatedObject(self, kEmptyTitle);
}

- (void)setEmptyTitle:(NSString *)emptyTitle{
    objc_setAssociatedObject(self, kEmptyTitle, emptyTitle, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)emptySubtitle{
    return  objc_getAssociatedObject(self, kEmptySubtitle);
}

- (void)setEmptySubtitle:(NSString *)emptySubtitle{
    objc_setAssociatedObject(self, kEmptySubtitle, emptySubtitle, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)emptyBtntitle{
    return  objc_getAssociatedObject(self, kEmptyBtnTitle);
}

- (void)setEmptyBtntitle:(NSString *)emptyBtntitle{
    objc_setAssociatedObject(self, kEmptyBtnTitle, emptyBtntitle, OBJC_ASSOCIATION_COPY_NONATOMIC);
}



- (UIImage *)emptyImage{
    return  objc_getAssociatedObject(self, kEmptyImage);
}

- (void)setEmptyImage:(UIImage *)emptyImage{
    objc_setAssociatedObject(self, kEmptyImage, emptyImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


#pragma mark - 网络请求失败
- (NSString *)netFailedTitle{
    return  objc_getAssociatedObject(self, kNetFailedTitle);
}

- (void)setNetFailedTitle:(NSString *)netFailedTitle{
    objc_setAssociatedObject(self, kNetFailedTitle, netFailedTitle, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


- (NSString *)netFailedSubtitle{
    return  objc_getAssociatedObject(self, kNetFailedSubtitle);
}

- (void)setNetFailedSubtitle:(NSString *)netFailedSubtitle{
    objc_setAssociatedObject(self, kNetFailedSubtitle, netFailedSubtitle, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


- (NSString *)netFailedBtntitle{
    return  objc_getAssociatedObject(self, kNetFailedBtnTitle);
}

- (void)setNetFailedBtntitle:(NSString *)netFailedBtntitle{
    objc_setAssociatedObject(self, kNetFailedBtnTitle, netFailedBtntitle, OBJC_ASSOCIATION_COPY_NONATOMIC);
}



- (UIImage *)netFailedImage{
    return  objc_getAssociatedObject(self, kNetFailedImage);
}

- (void)setNetFailedImage:(UIImage *)netFailedImage{
    objc_setAssociatedObject(self, kNetFailedImage, netFailedImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


#pragma mark - 是否网络失败
- (BOOL)isNetFailed{
    NSNumber *netFailed = objc_getAssociatedObject(self, @selector(isNetFailed));
    return [netFailed boolValue];
}

- (void)setIsNetFailed:(BOOL)isNetFailed{
    objc_setAssociatedObject(self, @selector(isNetFailed), @(isNetFailed), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


#pragma mark - 是否自定义占位视图
- (BOOL)isCustomPlaceHolder{
    NSNumber *isCustom = objc_getAssociatedObject(self, @selector(isCustomPlaceHolder));
    return [isCustom boolValue];
}
- (void)setIsCustomPlaceHolder:(BOOL)isCustomPlaceHolder{
    objc_setAssociatedObject(self, @selector(isCustomPlaceHolder), @(isCustomPlaceHolder), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}



@end
