//
//  MainHomeModel.h
//  ReactivecocoaWithMVVM
//
//  Created by Kenvin on 16/10/20.
//  Copyright © 2017年 上海方创金融信息服务股份有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RecommendListData;

@interface MainHomeModel : NSObject

@property (nonatomic, copy) NSString * code;

@property (nonatomic, strong) NSArray <RecommendListData *>* data;

@property (nonatomic, copy) NSString * msg;

@end


@interface RecommendListData : NSObject

@property (nonatomic, copy) NSString * area;

@property (nonatomic, assign) NSInteger beginDate;

@property (nonatomic, copy) NSString * content;

@property (nonatomic, assign) NSInteger createDate;

@property (nonatomic, assign) NSInteger endDate;

@property (nonatomic, copy) NSString * filemImg;

@property (nonatomic, assign) NSInteger idField;

@property (nonatomic, copy) NSString * linkType;

@property (nonatomic, copy) NSString * live;

@property (nonatomic, assign) NSInteger modifyDate;

@property (nonatomic, copy) NSString * pageInfo;

@property (nonatomic, copy) NSString * path;

@property (nonatomic, copy) NSString * releasePlat;

@property (nonatomic, copy) NSString * title;

@property (nonatomic, copy) NSString * type;

@property (nonatomic, copy) NSString * url;

@end
