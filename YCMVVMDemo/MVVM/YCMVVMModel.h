//
//  YCMVVMModel.h
//  YCMVVMDemo
//
//  Created by 高艳彬 on 16/5/3.
//  Copyright © 2016年 gaoyanbin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YCMVVMModel : NSObject


@property(nonatomic,strong) NSString    *name;
@property(nonatomic,strong) NSString    *content;
@property(nonatomic,assign) BOOL        likeStatus;

- (void)upDataFromDic:(NSDictionary *)dic;




@end
