//
//  YCBaseTableViewTableViewController.m
//  YCMVVMDemo
//
//  Created by 高艳彬 on 16/4/29.
//  Copyright © 2016年 gaoyanbin. All rights reserved.
//

#import "YCBaseTableViewTableViewController.h"

@interface YCBaseTableViewTableViewController ()

@end

@implementation YCBaseTableViewTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle  = UITableViewCellSeparatorStyleSingleLine;
    self.title                     = @"MVVM";
    
//    self.navigationItem.rightBarButtonItem =
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"加载" style:UIBarButtonItemStyleDone target:self action:@selector(loadMore)];
    
    
    
}

- (void)loadMore{

    
}

+ (CGFloat )heightWithMessage:(NSString *)message{

    UIFont *contentFont = [UIFont systemFontOfSize:15];
    CGRect rect = [message boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - 20, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:contentFont} context:nil];
    
    return rect.size.height;

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
