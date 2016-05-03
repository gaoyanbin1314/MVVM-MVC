//
//  YCWildTableViewController.m
//  YCMVVMDemo
//
//  Created by 高艳彬 on 16/4/29.
//  Copyright © 2016年 gaoyanbin. All rights reserved.
//

#import "YCWildTableViewController.h"

#import "YCNetWorkManager.h"


@interface YCWildTableViewController ()

@property(nonatomic,strong) NSMutableArray    *datas;

@end

@implementation YCWildTableViewController


-(NSMutableArray *)datas{
    if (!_datas) {
        _datas = [[NSMutableArray alloc] init];
    }
    return _datas;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"WildTableView";
    
    [self.datas addObjectsFromArray:[[YCNetWorkManager shareManager] loadData]];
    
    
}

- (void)loadMore{
 
    [self.datas addObjectsFromArray:[[YCNetWorkManager shareManager] loadMoreData]];
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

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"wildCell"];
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"wildCell"];
    }
    
    [cell.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    
    NSDictionary *dict    = [_datas objectAtIndex:indexPath.row];
    NSString     *name    = [dict objectForKey:@"name"];
    NSString     *content = [dict objectForKey:@"content"];
    
    
    UILabel *titleLabel  = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH - 20, 20)];
    titleLabel.font      = [UIFont systemFontOfSize:18];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.text      = name;
    if ([name isEqualToString:@"我的内容"]) {
        
        titleLabel.textColor = [UIColor redColor];
    }
    
    [cell addSubview:titleLabel];
    
    UIButton *button     = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 50, 12, 40, 15)];
    [button setTitle:@"like" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    [button addTarget:self action:@selector(likeBUtton:) forControlEvents:UIControlEventTouchUpInside];
    [cell addSubview:button];
    
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 35, SCREEN_WIDTH - 20, 0)];
    contentLabel.font = [UIFont systemFontOfSize:15];
    contentLabel.numberOfLines = 0;
    contentLabel.textColor = [UIColor blackColor];
    contentLabel.text = content;
    [contentLabel sizeToFit];
    [cell addSubview:contentLabel];
    
    
    
    return cell;
}

- (void)likeBUtton:(UIButton *)sender{

    if ([sender.titleLabel.text isEqualToString:@"like"]) {
     
        [sender setTitle:@"unlike" forState:UIControlStateNormal];
    }else if ([sender.titleLabel.text isEqualToString:@"unlike"]){
    
        [sender setTitle:@"like" forState:UIControlStateNormal];
    }else{
    
        NSLog(@"🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀\n  不可能吧");
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dict = [_datas objectAtIndex:indexPath.row];
    NSString *content = [dict objectForKey:@"content"];
    CGFloat height = 10 + 20 + 5 + [YCBaseTableViewTableViewController heightWithMessage:content] + 10;
    return height;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
