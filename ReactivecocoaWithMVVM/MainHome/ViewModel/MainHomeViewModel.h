//
//  MainHomeViewModel.h
//  ReactivecocoaWithMVVM
//
//  Created by Kenvin on 16/10/20.
//  Copyright © 2017年 上海方创金融信息服务股份有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainHomeModel.h"
#import "ViewModelService.h"


@interface MainHomeViewModel : NSObject

/**
 *  数据请求
 */
@property (strong, nonatomic) RACCommand *mainHomeCommand;
/**
 *  错误信号
 */
@property (strong, nonatomic) RACSignal *mainHomeConnectionErrors;


@property (strong, nonatomic) RACCommand *rightBarButtonItemCommand;

@property (strong, nonatomic) MainHomeModel *mainHomeModel;

@property (assign , nonatomic) BOOL  isSearch;


- (instancetype)initWithServices:(id<ViewModelService>)services;


@end
