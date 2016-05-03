//
//  YCMVCTableViewCell.h
//  YCMVVMDemo
//
//  Created by 高艳彬 on 16/4/29.
//  Copyright © 2016年 gaoyanbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YCMVCTableViewCell : UITableViewCell

@property (nonatomic,strong)UILabel *nameLabel;
@property (nonatomic,strong)UILabel *contentLabel;
@property (nonatomic,strong)UIImageView *line;
@property (nonatomic,strong)UIButton *likeButton;

@property (nonatomic,copy) void (^likeBlock)(UIButton *);

@end
