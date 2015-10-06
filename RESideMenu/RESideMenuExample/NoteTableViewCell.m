//
//  NoteTableViewCell.m
//  RESideMenuExample
//
//  Created by qianfeng007 on 15/8/22.
//  Copyright (c) 2015年 Roman Efimov. All rights reserved.
//

#import "NoteTableViewCell.h"

@implementation NoteTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

- (IBAction)sw:(id)sender {
    //开关按钮
    
//    //控制开关 yes 开 no  关
//    self.sw.on=YES;
//    //设置颜色
//    //关闭下颜色
//    self.sw.tintColor=[UIColor redColor];
//    //打开下 颜色
//    self.sw.onTintColor=[UIColor blackColor];
//    [self.sw addTarget:self action:@selector(valueChande:) forControlEvents:UIControlEventValueChanged];
    NSLog(@"开关状态：%d",self.sw.on);
    [[NSUserDefaults standardUserDefaults] setBool:self.sw.on forKey:@"ifopen"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
}

@end
