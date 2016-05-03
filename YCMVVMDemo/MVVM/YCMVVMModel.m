//
//  YCMVVMModel.m
//  YCMVVMDemo
//
//  Created by 高艳彬 on 16/5/3.
//  Copyright © 2016年 gaoyanbin. All rights reserved.
//

#import "YCMVVMModel.h"

@implementation YCMVVMModel

@synthesize name;
@synthesize content;
@synthesize likeStatus;

- (void)upDataFromDic:(NSDictionary *)dic{

    self.name    = [dic valueForKey:@"name"];
    self.content = [dic valueForKey:@"content"];

}








@end
