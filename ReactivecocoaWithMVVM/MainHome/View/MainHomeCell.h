//
//  MainHomeCell.h
//  ReactivecocoaWithMVVM
//
//  Created by Kenvin on 17/2/21.
//  Copyright © 2017年 上海方创金融信息服务股份有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReactiveView.h"

@interface MainHomeCell : UITableViewCell<ReactiveView>

@property (weak, nonatomic) IBOutlet UIImageView *contentPicImageView;

@end
