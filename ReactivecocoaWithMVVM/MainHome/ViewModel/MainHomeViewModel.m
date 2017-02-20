//
//  MainHomeViewModel.m
//  ReactivecocoaWithMVVM
//
//  Created by Kenvin on 16/10/20.
//  Copyright © 2017年 上海方创金融信息服务股份有限公司. All rights reserved.
//

#import "MainHomeViewModel.h"

@interface MainHomeViewModel ()
@property (strong , nonatomic) id<ViewModelService> services;
@end

@implementation MainHomeViewModel
- (instancetype)initWithServices:(id<ViewModelService>)services{
    if (self = [super init]) {
        
        _services = services;
        
        [self initialize];
    }
    return self;
}

- (void)initialize{

    _isSearch = NO;
    
    RACSignal *visibleStateChanged = [RACObserve(self, isSearch) skip:1];
    
    
    [visibleStateChanged subscribeNext:^(NSNumber *visible) {
        
        _isSearch = visible.boolValue;
    }];
    
    @weakify(self)
    
    _mainHomeCommand= [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        
        return [[[_services getMainHomeRecommendService] requestMainHomeDataSignal:@"http://api.daydaycook.com.cn/daydaycook/server/ad/listAds.do?version=2.7.1&deviceId=329040BD-EA81-4209-BF43-C213850FDE9C&languageId=3&uid=192581&regionCode=156&mainland=1" params:nil] doNext:^(id  _Nullable result) {
            @strongify(self)
            self.mainHomeModel = result;
        }];
    }];
    
    _rightBarButtonItemCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        
        return  [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            [subscriber sendNext:[NSNumber numberWithBool:self.isSearch]];
            [subscriber sendCompleted];
            return nil;
        }];
    }];
    
    
    
    _mainHomeConnectionErrors= _mainHomeCommand.errors;
}

@end
