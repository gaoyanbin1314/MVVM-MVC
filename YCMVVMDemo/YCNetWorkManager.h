//
//  YCNetWorkManager.h
//  YCMVVMDemo
//
//  Created by 高艳彬 on 16/4/29.
//  Copyright © 2016年 gaoyanbin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YCNetWorkManager : NSObject



+ (instancetype)shareManager;

- (NSArray *)loadData;

- (NSArray *)loadMoreData;

- (BOOL)like:(NSString *)name;

- (BOOL)unlike:(NSString *)name;


@end
