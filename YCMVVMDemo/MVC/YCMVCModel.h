//
//  YCMVCModel.h
//  YCMVVMDemo
//
//  Created by 高艳彬 on 16/4/29.
//  Copyright © 2016年 gaoyanbin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YCMVCModel : NSObject

@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *content;
- (void)updataFromDict:(NSDictionary *)dict;

@end
