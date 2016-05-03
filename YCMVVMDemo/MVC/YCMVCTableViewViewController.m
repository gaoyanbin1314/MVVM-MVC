//
//  YCMVCTableViewViewController.m
//  YCMVVMDemo
//
//  Created by 高艳彬 on 16/4/29.
//  Copyright © 2016年 gaoyanbin. All rights reserved.
//

#import "YCMVCTableViewViewController.h"
#import "YCMVCModel.h"
#import "YCMVCTableViewCell.h"

@interface YCMVCTableViewViewController ()

@property(nonatomic,strong) NSMutableArray    *datas;

@end

@implementation YCMVCTableViewViewController

-(NSMutableArray *)datas{
    if (!_datas) {
        _datas = [[NSMutableArray alloc] init];
    }
    return _datas;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"MVC";
    
    [self loadDataFormArray:[[YCNetWorkManager shareManager] loadData]];
    
    
}

- (void)loadDataFormArray:(NSArray *)array{

    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        YCMVCModel *model = [[YCMVCModel alloc] init];
        [model updataFromDict:obj];
        [self.datas addObject:model];
        
    }];

}
- (void)loadMore{

    [self loadDataFormArray:[[YCNetWorkManager shareManager] loadMoreData]];
    [self.tableView reloadData];
    
}

#pragma mark --- UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    NSString *identifier = @"MVCCell";
    YCMVCTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[YCMVCTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    YCMVCModel *model = _datas[indexPath.row];
    
    cell.nameLabel.text = model.name;
    if ([model.name isEqualToString:@"我的内容"]) {
        cell.nameLabel.textColor = [UIColor redColor];
    }
    
    cell.contentLabel.text = model.content;
    [cell.contentLabel sizeToFit];
    
    
//    [cell setlikeBlock:^(UIButton *sender){
    
    cell.likeBlock = ^(UIButton *sender){
    
        if ([sender.titleLabel.text isEqualToString:@"like"]) {
            
            [sender setTitle:@"unlike" forState:UIControlStateNormal];
//            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
            
        }else{
        
            [sender setTitle:@"like" forState:UIControlStateNormal];
//            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
        }
    };
    
    
    return cell;
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    YCMVCModel *model = _datas[indexPath.row];
    
    CGFloat height = 10 + 20 + 5 + [YCBaseTableViewTableViewController heightWithMessage:model.content] + 10;
    
    return  height;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
}


@end
