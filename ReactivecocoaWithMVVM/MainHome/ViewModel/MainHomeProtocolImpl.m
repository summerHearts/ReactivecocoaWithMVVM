//
//  MainHomeProtocolImpl.m
//  ReactivecocoaWithMVVM
//
//  Created by Kenvin on 16/10/20.
//  Copyright © 2017年 上海方创金融信息服务股份有限公司. All rights reserved.
//

#import "MainHomeProtocolImpl.h"
#import "MainHomeModel.h"
#import "HttpSessionRequest.h"
@interface MainHomeProtocolImpl ()

@property (nonatomic,strong) MainHomeModel *mainHomeModel;

@end


@implementation MainHomeProtocolImpl

- (RACSignal *)requestMainHomeDataSignal:(NSString *)requestUrl params:(NSDictionary *)params{
   	@weakify(self);
    return  [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
      NSURLSessionTask *task =  [HttpSessionRequest   requestWithUrl:requestUrl
                                      params:params
                                    useCache:YES
                                 httpMedthod:GET
                               progressBlock:^(int64_t bytesRead, int64_t totalBytes) {
            
        } successBlock:^(id response) {
            @strongify(self);
            self.mainHomeModel = [MainHomeModel mj_objectWithKeyValues:response];
            [subscriber sendNext:self.mainHomeModel];
            [subscriber sendCompleted];
        } failBlock:^(NSError *error) {
            [subscriber sendError:error];
        }];
        
        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }];
}


@end
