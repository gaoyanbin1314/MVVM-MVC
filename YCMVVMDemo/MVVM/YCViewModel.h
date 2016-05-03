//
//  YCViewModel.h
//  YCMVVMDemo
//
//  Created by 高艳彬 on 16/5/3.
//  Copyright © 2016年 gaoyanbin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YCViewModel : NSObject

@property(nonatomic,strong) NSMutableArray    *datas;


- (void)loadDataFromNetwotk;
- (void)loadMoreDataFromNetWork;

- (void)likeButtonClick:(NSIndexPath *)indexPath;


@end
