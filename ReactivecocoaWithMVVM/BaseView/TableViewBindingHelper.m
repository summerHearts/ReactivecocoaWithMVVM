//
//  TableViewBindingHelper.m
//  ReactivecocoaWithMVVM
//
//  Created by Kenvin on 16/10/20.
//  Copyright © 2017年 上海方创金融信息服务股份有限公司. All rights reserved.
//

#import "TableViewBindingHelper.h"
#import "ReactiveView.h"


@interface TableViewBindingHelper ()<UITableViewDelegate,UITableViewDataSource>
/**
 *  tableView
 */
@property (strong, nonatomic) UITableView *tableView;
/**
 *  数据源
 */
@property (strong, nonatomic) NSArray *data;
/**
 *  selection
 */
@property (strong, nonatomic) RACCommand *didSelectionCommand;
/**
 *  cell重用标识
 */
@property (copy, nonatomic) NSString *cellIdentifier;
/**
 *  viewModel
 */
@property (strong, nonatomic) id viewModel;
@end

@implementation TableViewBindingHelper
#pragma mark - init
- (instancetype)initWithTableView:(UITableView *)tableView sourceSignal:(RACSignal *)source selectionCommand:(RACCommand *)didSelectionCommand templateCell:(NSString *)templateCell withViewModel:(id)viewModel{
    
    if (self = [super init]) {
        
        _tableView = tableView;
        _data = [NSArray array];
        _didSelectionCommand = didSelectionCommand;
        _viewModel = viewModel;
        
        @weakify(self);
        [source subscribeNext:^(id x) {
            @strongify(self);
            self.data = x;
            [self.tableView reloadData];
        }];
        
        _cellIdentifier = templateCell;
        
        
        Class cell =  NSClassFromString(templateCell);
        
        UINib *nib = [UINib nibWithNibName:templateCell bundle:nil];
        if (nib == nil) {
            [_tableView registerClass:cell forCellReuseIdentifier:templateCell];
        }else{
            [_tableView registerNib:nib forCellReuseIdentifier:templateCell];
        }
        
        _tableView.dataSource = self;
        _tableView.delegate = self;

    }
    return self;
}
+ (instancetype)bindingHelperForTableView:(UITableView *)tableView sourceSignal:(RACSignal *)source selectionCommand:(RACCommand *)didSelectionCommand templateCell:(NSString *)templateCell  withViewModel:(id)viewModel
{
    return [[TableViewBindingHelper alloc] initWithTableView:tableView
                                                  sourceSignal:source
                                              selectionCommand:didSelectionCommand
                                                  templateCell:templateCell
                                                 withViewModel:viewModel];
}
- (void)dealloc
{
    self.delegate = nil;
}
#pragma mark - UITableViewDataSource && UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    self.tableView.mj_footer.hidden = (self.data.count == 0) ? YES : NO;
    
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id<ReactiveView> cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];

    [cell bindViewModel:self.viewModel withParams:@{DataIndex:@(indexPath.row)}];
    return (UITableViewCell *)cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self.didSelectionCommand execute:self.data[indexPath.row]];
    
    if ([self.delegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
        [self.delegate tableView:tableView didSelectRowAtIndexPath:indexPath];
    }
}

#pragma mark = UITableViewDelegate forwarding

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if ([self.delegate respondsToSelector:@selector(scrollViewDidScroll:)]) {
        [self.delegate scrollViewDidScroll:scrollView];
    }
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    if ([self.delegate respondsToSelector:aSelector]) {
        return YES;
    }
    return [super respondsToSelector:aSelector];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if ([self.delegate respondsToSelector:aSelector]) {
        return self.delegate;
    }
    return [super forwardingTargetForSelector:aSelector];
}

@end
