//
//  YCMVCTableViewCell.m
//  YCMVVMDemo
//
//  Created by 高艳彬 on 16/4/29.
//  Copyright © 2016年 gaoyanbin. All rights reserved.
//

#import "YCMVCTableViewCell.h"

@implementation YCMVCTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH - 20, 20)];
        _nameLabel.font = [UIFont systemFontOfSize:18];
        _nameLabel.textColor = [UIColor blackColor];
        [self addSubview:_nameLabel];
        
        _contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 35, SCREEN_WIDTH - 20, 0)];
        _contentLabel.font = [UIFont systemFontOfSize:15];
        _contentLabel.numberOfLines = 0;
        _contentLabel.textColor = [UIColor blackColor];
//        [_contentLabel sizeToFit];
        [self addSubview:_contentLabel];
        
        _likeButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 50, 12.5, 40, 15)];
        [_likeButton setTitle:@"like" forState:UIControlStateNormal];
        _likeButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_likeButton addTarget:self action:@selector(likeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        _likeButton.backgroundColor = [UIColor grayColor];
        [self addSubview:_likeButton];
        
        _line = [[UIImageView alloc]initWithFrame:CGRectMake(0, _contentLabel.frame.origin.y + _contentLabel.frame.size.height + 9, SCREEN_WIDTH, 1)];
        _line.backgroundColor = [UIColor blackColor];
//        [self addSubview:_line];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)likeButtonClick:(UIButton *)btn{
    _likeBlock(btn);
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



@end
