//
//  YCMVCModel.m
//  YCMVVMDemo
//
//  Created by 高艳彬 on 16/4/29.
//  Copyright © 2016年 gaoyanbin. All rights reserved.
//

#import "YCMVCModel.h"

@implementation YCMVCModel

- (void)updataFromDict:(NSDictionary *)dict
{
    self.name = [dict objectForKey:@"name"];
    self.content = [dict objectForKey:@"content"];
}


@end
