//
//  YCMVVMTableViewCell.h
//  YCMVVMDemo
//
//  Created by 高艳彬 on 16/5/3.
//  Copyright © 2016年 gaoyanbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YCMVVMTableViewCell : UITableViewCell

@property (nonatomic,strong)UILabel *nameLabel;
@property (nonatomic,strong)UILabel *contentLabel;
@property (nonatomic,strong)UIImageView *line;
@property (nonatomic,strong)UIButton *likeButton;
@property (nonatomic,copy) void (^likeBlock)(void);


+ (float)heightOfData:(id)object;
- (void)setupData:(id)object;




@end
