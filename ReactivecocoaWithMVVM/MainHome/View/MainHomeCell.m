//
//  MainHomeCell.m
//  ReactivecocoaWithMVVM
//
//  Created by Kenvin on 17/2/21.
//  Copyright © 2017年 上海方创金融信息服务股份有限公司. All rights reserved.
//

#import "MainHomeCell.h"
#import "MainHomeViewModel.h"
@implementation MainHomeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)bindViewModel:(id)viewModel withParams:(NSDictionary *)params
{
    MainHomeViewModel *mainHomeiewModel = viewModel;
    RecommendListData *model = mainHomeiewModel.mainHomeModel.data[[params[DataIndex] integerValue]];
    [self.contentPicImageView sd_setImageWithURL:[NSURL URLWithString:model.path] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
