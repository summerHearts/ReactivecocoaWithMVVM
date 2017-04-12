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


/*
    传递 值事件 、 完成事件 以及 错误事件 的本质就是向subscriber发送 sendNext: 、 sendComplete 以及 sendError: 消息。
    Signal在其生命周期内，可以传递任意多个值事件，但最多只能传递一个完成事件或错误事件；换句话说，一旦Signal的事件流中出现了错误事件或者完成事件，之后产生的任何事件都是无效的。
 */

- (RACSignal *)requestMainHomeDataSignal:(NSString *)requestUrl params:(NSDictionary *)params{
   	@weakify(self);
    return  [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
      NSURLSessionTask *task =  [HttpSessionRequest   requestWithUrl:requestUrl
                                      params:params
                                    useCache:YES
                                 httpMedthod:POST
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
