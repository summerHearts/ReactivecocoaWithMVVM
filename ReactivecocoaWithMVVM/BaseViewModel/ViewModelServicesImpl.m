//
//  ViewModelServicesImpl.m
//  ReactivecocoaWithMVVM
//
//  Created by Kenvin on 16/10/20.
//  Copyright © 2017年 上海方创金融信息服务股份有限公司. All rights reserved.
//

#import "ViewModelServicesImpl.h"
#import "MainHomeProtocolImpl.h"

@interface ViewModelServicesImpl()

@property (nonatomic,strong) MainHomeProtocolImpl *mainHomeService;

@end

@implementation ViewModelServicesImpl

- (instancetype)initModelServiceImpl{
    
    if (self = [super init]) {
        
        _mainHomeService = [MainHomeProtocolImpl new];
        
    }
    return self;
}

- (id<MainHomeProtocol>)getMainHomeRecommendService{
    return self.mainHomeService;
}

@end
