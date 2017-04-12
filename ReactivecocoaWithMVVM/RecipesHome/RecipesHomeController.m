//
//  RecipesHomeController.m
//  ReactivecocoaWithMVVM
//
//  Created by Kenvin on 16/10/20.
//  Copyright © 2017年 上海方创金融信息服务股份有限公司. All rights reserved.
//

#import "RecipesHomeController.h"

@interface RecipesHomeController ()

@property (nonatomic,strong) UITextField *textField;

@end

@implementation RecipesHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, 50)];
    self.textField.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.textField];
    
    
    [[[[[[self.textField.rac_textSignal throttle:0.3]distinctUntilChanged]ignore:@""] map:^id(id value) {
        NSLog(@">>>>>>   %@",value);
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            
            //  network request
            [subscriber sendNext:value];
            [subscriber sendCompleted];
            
            return [RACDisposable disposableWithBlock:^{
                
                //  cancel request
            }];
        }];
    }]switchToLatest] subscribeNext:^(id x) {
        
        NSLog(@"x = %@",x);
    }];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
