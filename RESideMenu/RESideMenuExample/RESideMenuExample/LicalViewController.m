//
//  LicalViewController.m
//  RESideMenuExample
//
//  Created by qianfeng007 on 15/8/22.
//  Copyright (c) 2015年 Roman Efimov. All rights reserved.
//

#import "LicalViewController.h"

@interface LicalViewController ()

@end

@implementation LicalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"个性设置";
    self.automaticallyAdjustsScrollViewInsets = NO;//取消半透明的条 对 滚动视图的影响
     [self createTableView];
}
- (void)createTableView {
    self.dataArr = [[NSMutableArray alloc] init];
    if (!self.tableView) {//懒加载
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64,kScreenSize.width, kScreenSize.height-64-49) style:UITableViewStylePlain];
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        [self.view addSubview:self.tableView];
        //注册cell
        [self.tableView registerNib:[UINib nibWithNibName:@"NoteTableViewCell" bundle:nil] forCellReuseIdentifier:@"NoteTableViewCell"];
    }
}
#pragma mark TableView协议
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if (indexPath.row==0) {
         NoteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NoteTableViewCell" forIndexPath:indexPath];
        return cell;
//    }
//    else
//    {
//        return nil;
//    }
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
