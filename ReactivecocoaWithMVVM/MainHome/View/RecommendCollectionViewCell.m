//
//  RecommendCollectionViewCell.m
//  MVVMReactiveCocoa
//
//  Created by leichunfeng on 16/3/27.
//  Copyright © 2016年 leichunfeng. All rights reserved.
//

#import "RecommendCollectionViewCell.h"
#import "MRCExploreCollectionViewCellViewModel.h"
#import <SDWebImage/UIButton+WebCache.h>
#import "MainHomeModel.h"
#import "MainHomeViewModel.h"
@interface RecommendCollectionViewCell ()

@property (nonatomic, weak) IBOutlet UIImageView *avatarImageView;
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;

@end

@implementation RecommendCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.avatarImageView.layer.cornerRadius  = 15;
    self.avatarImageView.layer.masksToBounds = YES;
    self.avatarImageView.contentMode = UIViewContentModeScaleAspectFill;
}

- (void)bindViewModel:(id)viewModel withParams:(NSDictionary *)params{
   MainHomeViewModel *mainHomeiewModel  = (MainHomeViewModel *)viewModel;
    
    RecommendListData *model = mainHomeiewModel.mainHomeModel.data[[params[DataIndex] integerValue]];
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:model.path] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
    self.nameLabel.text = model.title;
}


@end
