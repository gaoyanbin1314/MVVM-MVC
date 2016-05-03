//
//  YCMVVMTableViewCell.m
//  YCMVVMDemo
//
//  Created by 高艳彬 on 16/5/3.
//  Copyright © 2016年 gaoyanbin. All rights reserved.
//

#import "YCMVVMTableViewCell.h"

@implementation YCMVVMTableViewCell


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
        [self addSubview:_contentLabel];
        
        _likeButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 50, 12.5, 40, 15)];
        [_likeButton setTitle:@"like" forState:UIControlStateNormal];
        _likeButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_likeButton addTarget:self action:@selector(likeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        _likeButton.backgroundColor = [UIColor grayColor];
        [self addSubview:_likeButton];
        
        _line = [[UIImageView alloc]init];
        _line.backgroundColor = [UIColor blackColor];
        [self addSubview:_line];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return self;
}

- (void)setupData:(id)object{

    if ([object respondsToSelector:@selector(name)]) {
        
        NSString *name = [object performSelector:@selector(name) withObject:nil];
        _nameLabel.text = name;
        
        if ([name isEqualToString:@"我的内容"]) {
            
            _nameLabel.textColor = [UIColor redColor];
        }else{
        
            _nameLabel.textColor = [UIColor blackColor];
        }
    }
    
    if ([object respondsToSelector:@selector(content)]) {
        
        NSString *content = [object performSelector:@selector(content) withObject:nil];
        
        CGFloat height = [YCBaseTableViewTableViewController heightWithMessage:content];
        CGRect frame   = _contentLabel.frame;
        
        frame.size.height   = height;
        _contentLabel.frame = frame;
        _contentLabel.text  = content;
    }
    
    if ([object respondsToSelector:@selector(likeStatus)]) {
        
        BOOL status = [object performSelector:@selector(likeStatus) withObject:nil];
        if (status) {
            
            [_likeButton setTitle:@"unLike" forState:UIControlStateNormal];
        }else{
        
            [_likeButton setTitle:@"like" forState:UIControlStateNormal];
        }
    }
    
    
}

- (void)likeButtonClick:(UIButton *)sender{

    _likeBlock();
}

+ (float)heightOfData:(id)object{

    CGFloat height = 10 + 20 + 5 + 10;
    
    if ([object respondsToSelector:@selector(content)]) {
        
        NSString *content = [object performSelector:@selector(content) withObject:nil];
        
        height += [YCBaseTableViewTableViewController heightWithMessage:content];
        
    }

    return height;
}





- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
