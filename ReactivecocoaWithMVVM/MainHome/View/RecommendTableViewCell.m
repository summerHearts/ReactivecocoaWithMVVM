//
//  MRCExploreTableViewCell.m
//  MVVMReactiveCocoa
//
//  Created by leichunfeng on 16/3/26.
//  Copyright © 2016年 leichunfeng. All rights reserved.
//

#import "RecommendTableViewCell.h"
#import "MainHomeViewModel.h"
#import "RecommendCollectionViewCell.h"
#import "MRCExploreItemViewModel.h"
#import "MRCExploreCollectionViewCellViewModel.h"
@interface RecommendTableViewCell () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UIButton *seeAllButton;
@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) MainHomeViewModel *viewModel;

@end

@implementation RecommendTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"RecommendCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"RecommendCollectionViewCell"];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)bindViewModel:(id)viewModel withParams:(NSDictionary *)params{
    self.viewModel = viewModel;
    [self.collectionView reloadData];

}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section >= self.viewModel.mainHomeModel.data.count) return 0;
    return self.viewModel.mainHomeModel.data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    id cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RecommendCollectionViewCell" forIndexPath:indexPath];
    [cell bindViewModel:self.viewModel withParams:@{DataIndex:@(indexPath.row)}];
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    MRCExploreCollectionViewCellViewModel *viewModel = self.viewModel.dataSource[indexPath.section][indexPath.row];
//    [viewModel.didSelectCommand execute:viewModel];
}

@end
