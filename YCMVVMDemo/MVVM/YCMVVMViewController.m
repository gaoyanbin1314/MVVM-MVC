//
//  YCMVVMViewController.m
//  YCMVVMDemo
//
//  Created by 高艳彬 on 16/5/3.
//  Copyright © 2016年 gaoyanbin. All rights reserved.
//

#import "YCMVVMViewController.h"
#import "YCMVVMTableViewCell.h"
#import "YCViewModel.h"


@interface YCMVVMViewController ()

@property(nonatomic,strong)YCViewModel     *viewModel;

@end

@implementation YCMVVMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"MVVM";
    
    _viewModel = [[YCViewModel alloc] init];
    
    [_viewModel addObserver:self forKeyPath:@"datas" options:NSKeyValueObservingOptionNew context:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(likeStatusChange:) name:@"likeButtonStatusChanged" object:nil];
    [_viewModel loadDataFromNetwotk];
    
}

- (void)loadMore{

    [_viewModel loadMoreDataFromNetWork];
    
}

#pragma mark --- KVO && Notification

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{

    if ([keyPath isEqualToString:@"datas"]) {
        
        [self.tableView reloadData];
    }

}

- (void)likeStatusChange:(NSNotification *)noti{

    NSIndexPath *indexPath = [noti object];
    
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
};

#pragma mark --- UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _viewModel.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    NSString *identifier = @"mvvmCell";
    YCMVVMTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        
        cell = [[YCMVVMTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    [cell setupData:[_viewModel.datas objectAtIndex:indexPath.row]];
    
    [cell setLikeBlock:^{
       
        [_viewModel likeButtonClick:indexPath];
    }];
    

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return [YCMVVMTableViewCell heightOfData:[_viewModel.datas objectAtIndex:indexPath.row]];
}




















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
