//
//  ViewModelService.h
//  ReactivecocoaWithMVVM
//
//  Created by Kenvin on 16/10/20.
//  Copyright © 2017年 上海方创金融信息服务股份有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainHomeProtocol.h"

@protocol ViewModelService <NSObject>

- (id<MainHomeProtocol>)getMainHomeRecommendService;


@end
