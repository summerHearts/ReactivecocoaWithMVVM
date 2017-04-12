//
//  NSTimer+Extention.m
//  ShanghaiEstate
//
//  Created by 韩承海 on 2016/10/31.
//  Copyright © 2016年 OrientFinance. All rights reserved.
//

#import "NSTimer+Extention.h"

@implementation NSTimer (Extention)
- (void)pause{
    if (self.isValid) {
        [self setFireDate:[NSDate distantFuture]];
    }
    return;
}
- (void)resume{
    if (self.isValid) {
        [self setFireDate:[NSDate date]];
    }
    return;
}

@end
