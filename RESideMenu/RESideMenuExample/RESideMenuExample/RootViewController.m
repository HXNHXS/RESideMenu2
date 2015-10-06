//
//  RootViewController.m
//  RESideMenuExample
//
//  Created by Roman Efimov on 6/26/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "RootViewController.h"
#import "DemoViewController.h"
#import "SecondViewController.h"
#import "ThirViewController.h"
#import "LicalViewController.h"
#import "AppDelegate.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    double v=[UIDevice currentDevice].systemVersion.doubleValue;
    if(v>8.0)
    {
	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"菜单" style:UIBarButtonItemStylePlain target:self action:@selector(showMenu)];
    }
    else
    {
        //忽略警告
#pragma clang diagnostic push
        //#pragma clang diagnostic ignored "-Wmultichar"
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        //警告
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"菜单" style:UIBarButtonItemStyleBordered target:self action:@selector(showMenu)];
#pragma clang diagnostic pop
        
    }
}

#pragma mark -
#pragma mark Button actions

- (void)showMenu
{
    if (!_sideMenu) {
        RESideMenuItem *homeItem = [[RESideMenuItem alloc] initWithTitle:@"首页" action:^(RESideMenu *menu, RESideMenuItem *item) {
            DemoViewController *viewController = [[DemoViewController alloc] init];
            viewController.title = item.title;
            UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
            [menu setRootViewController:navigationController];
        }];
        RESideMenuItem *exploreItem = [[RESideMenuItem alloc] initWithTitle:@"语音创建" action:^(RESideMenu *menu, RESideMenuItem *item) {
            SecondViewController *secondViewController = [[SecondViewController alloc] init];
            secondViewController.title = item.title;
            UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:secondViewController];
            [menu setRootViewController:navigationController];
             NSLog(@"Item %@", item);
        }];
        RESideMenuItem *activityItem = [[RESideMenuItem alloc] initWithTitle:@"文字创建" action:^(RESideMenu *menu, RESideMenuItem *item) {
            ThirViewController *thr=[[ThirViewController alloc]init];
            thr.title=item.title;
            UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:thr];
            [menu setRootViewController:nav];
            //[menu hide];
            NSLog(@"Item %@", item);
        }];
        RESideMenuItem *profileItem = [[RESideMenuItem alloc] initWithTitle:@"管理笔记" action:^(RESideMenu *menu, RESideMenuItem *item) {
            [menu hide];
            NSLog(@"Item %@", item);
        }];
        RESideMenuItem *aroundMeItem = [[RESideMenuItem alloc] initWithTitle:@"个性设置" action:^(RESideMenu *menu, RESideMenuItem *item) {
            LicalViewController *lical=[[LicalViewController alloc]init];
            lical.title=item.title;
            UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:lical];
            [menu setRootViewController:nav];
            [menu hide];
            NSLog(@"Item %@", item);
        }];
        
        RESideMenuItem *helpPlus1 = [[RESideMenuItem alloc] initWithTitle:@"使用教程" action:^(RESideMenu *menu, RESideMenuItem *item) {
            NSLog(@"Item %@", item);
            [menu hide];
        }];
        
        RESideMenuItem *helpPlus2 = [[RESideMenuItem alloc] initWithTitle:@"更多详情" action:^(RESideMenu *menu, RESideMenuItem *item) {
            NSLog(@"Item %@", item);
            [menu hide];
        }];
        
        RESideMenuItem *helpCenterItem = [[RESideMenuItem alloc] initWithTitle:@"更多..." action:^(RESideMenu *menu, RESideMenuItem *item) {
            NSLog(@"Item %@", item);
        }];
        helpCenterItem.subItems  = @[helpPlus1,helpPlus2];
        
        RESideMenuItem *itemWithSubItems = [[RESideMenuItem alloc] initWithTitle:@"通用设置" action:^(RESideMenu *menu, RESideMenuItem *item) {
            NSLog(@"Item %@", item);
        }];
        itemWithSubItems.subItems = @[aroundMeItem,helpCenterItem];
        
        RESideMenuItem *logOutItem = [[RESideMenuItem alloc] initWithTitle:@"退出" action:^(RESideMenu *menu, RESideMenuItem *item) {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"确定退出么？" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
            alertView.alertViewStyle=UIAlertViewStyleDefault;
            [alertView show];
        }];
        
        _sideMenu = [[RESideMenu alloc] initWithItems:@[homeItem, exploreItem, activityItem, profileItem,itemWithSubItems, logOutItem]];
        _sideMenu.verticalOffset = IS_WIDESCREEN ? 110 : 76;
        _sideMenu.hideStatusBarArea = [AppDelegate OSVersion] < 7;
    }
    
    [_sideMenu show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"%ld",buttonIndex);
        exit(0);
    
}
@end
