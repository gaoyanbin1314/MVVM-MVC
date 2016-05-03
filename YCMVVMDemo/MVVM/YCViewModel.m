//
//  YCViewModel.m
//  YCMVVMDemo
//
//  Created by 高艳彬 on 16/5/3.
//  Copyright © 2016年 gaoyanbin. All rights reserved.
//

#import "YCViewModel.h"
#import "YCMVVMModel.h"

@implementation YCViewModel



-(NSMutableArray *)datas{
    if (!_datas) {
        _datas = [[NSMutableArray alloc] init];
    }
    return _datas;
}

- (void)loadFromArray:(NSArray *)array{

    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        YCMVVMModel *model = [[YCMVVMModel alloc] init];
        [model upDataFromDic:obj];
//        [self.datas addObject:model];
        [[self mutableArrayValueForKey:@"datas"] addObject:model];
        
        
    }];
    
}

- (void)loadDataFromNetwotk{

    NSArray *datas = [[YCNetWorkManager shareManager] loadData];
    [self loadFromArray:datas];
}

- (void)loadMoreDataFromNetWork{

    NSArray *datas = [[YCNetWorkManager shareManager] loadMoreData];
    [self loadFromArray:datas];
}

- (void)likeButtonClick:(NSIndexPath *)indexPath{

    YCMVVMModel *model = self.datas[indexPath.row];
    model.likeStatus   = !model.likeStatus;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"likeButtonStatusChanged" object:indexPath];
    
    
    
}



















@end
