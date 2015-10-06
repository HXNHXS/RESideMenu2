//
//  LicalViewController.h
//  RESideMenuExample
//
//  Created by qianfeng007 on 15/8/22.
//  Copyright (c) 2015年 Roman Efimov. All rights reserved.
//

#import "RootViewController.h"
#import "NoteTableViewCell.h"
@interface LicalViewController : RootViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSMutableArray *_dataArr;
}
@property (nonatomic, strong)UITableView *   tableView;
@property (nonatomic, strong)NSMutableArray *dataArr;
@end
