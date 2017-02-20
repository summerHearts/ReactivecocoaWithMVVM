//
//  MainHomeProtocol.h
//  ReactivecocoaWithMVVM
//
//  Created by Kenvin on 16/10/20.
//  Copyright © 2017年 上海方创金融信息服务股份有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MainHomeProtocol <NSObject>

@optional
// 加载首页数据
- (RACSignal *)requestMainHomeDataSignal:(NSString *)requestUrl params:(NSDictionary *)params;

@end
