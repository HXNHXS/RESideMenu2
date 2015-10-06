//
//  RTimePush.m
//  PushDemo
//
//  Created by qianfeng007 on 15/8/27.
//  Copyright (c) 2015年 Rain. All rights reserved.
//

#import "RTimePush.h"

@implementation RTimePush
+(void)RTimePushapplication:(UIApplication *)application pushtime:(NSString*)shotTime pushWords:(NSString*)words pushSound:(NSString*)sound
{
//删除所有的通知
[[UIApplication sharedApplication]cancelAllLocalNotifications];
//IOS8本地推送 添加授权
if ([UIApplication instancesRespondToSelector:@selector(registerUserNotificationSettings:)]) {
    [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert |UIUserNotificationTypeBadge|UIUserNotificationTypeSound categories:nil]];
}
//创建本地推送
UILocalNotification *local=[[UILocalNotification alloc]init];
//设置推送内容
local.alertBody=words;
//设置呻吟 声音要小于30秒  并且声音本地要有
local.soundName=sound;
local.repeatInterval=kCFCalendarUnitDay;
//设置红色标示 用来显示 多少条 新的通知
local.applicationIconBadgeNumber=0;
/*
 20150825145300
 20110826134106
 NSString* string = @"20110826134106";
 NSDateFormatter *inputFormatter = [[[NSDateFormatter alloc] init] autorelease];
 [inputFormatter setLocale:[[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"] autorelease]];
 [inputFormatter setDateFormat:@"yyyyMMddHHmmss"];
 NSDate* inputDate = [inputFormatter dateFromString:string];
 NSLog(@"date = %@", inputDate);
 */
NSTimeZone *tz=[NSTimeZone systemTimeZone];
// NSLog(@"%@",tz);
NSInteger sub=[tz secondsFromGMT];
// NSLog(@"%ld",sub);
NSDate *date=[NSDate date];
NSDate *local1= [date dateByAddingTimeInterval:sub];
//NSLog(@"%@",local1);
// sub+=10;
// NSLog(@"%ld",sub);
NSString *str=[NSString stringWithFormat:@"%@",local1];
NSString *dataStr=[str componentsSeparatedByString:@" "][0];
//NSLog(@"dataStr:%@",dataStr);
//    NSString *dataNow=[NSString stringWithFormat:@"%@ ",dataStr];
//    NSLog(@"dataNow:%@",dataNow);
NSArray *dataYear=[dataStr componentsSeparatedByString:@"-"];
NSString *strYear=nil;
strYear=[NSString stringWithFormat:@"%@%@%@",dataYear[0],dataYear[1],dataYear[2]];
//// NSLog(@"%@",strYear);
//strYear=[strYear componentsSeparatedByString:@" "][0];
strYear=[strYear stringByAppendingString:shotTime];
//NSLog(@"%@",strYear);
NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init] ;
[inputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]] ;
[inputFormatter setDateFormat:@"yyyyMMddHHmmss"];

NSDate* inputDate = [inputFormatter dateFromString:strYear];
//NSLog(@"date = %@", inputDate);


NSTimeZone *fromzone = [NSTimeZone systemTimeZone];

NSInteger frominterval = [fromzone secondsFromGMTForDate: inputDate];

inputDate = [inputDate  dateByAddingTimeInterval: frominterval] ;
//NSLog(@"inputDate:%@",inputDate);


//    NSDateFormatter * df2 = [[NSDateFormatter alloc] init];
//    [df2 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//    // NSDate* inputDate1 = [df2 dateFromString:strYear];
//    NSString * str1 = [df2 stringFromDate:inputDate];
//     NSLog(@" = %@", str1);
//    NSLog(@" =111 %@", [df2 dateFromString:str1]);
// NSDate *local2= [date dateByAddingTimeInterval:sub];
//NSDate *dat=[df2 stringFromDate:inputDate];
    if ([inputDate timeIntervalSinceDate: local1]>=0) {
        NSLog(@"%f秒之后推送", [inputDate timeIntervalSinceDate: local1]);
    }
    else
    {
        NSString *str=[NSString stringWithFormat:@"%f",((24*60+[inputDate timeIntervalSinceDate: local1]/(60))/60)];
        NSLog(@"%@",str);
       NSString *strhour=[str componentsSeparatedByString:@"."][1];
        NSLog(@"%@",str);
        float min=strhour.floatValue/1000000;
        min=min*60;
        NSLog(@"%@小时%.0f分钟以后推送消息",[str componentsSeparatedByString:@"."][0],min);
    }
//    NSDate *local3=];
// NSLog(@"%f",[local2 timeIntervalSinceDate:local1]);
//设置 开始时间
local.fireDate=[NSDate dateWithTimeIntervalSinceNow:[inputDate timeIntervalSinceDate: local1]];
// local.fireDate=[local2 timeIntervalSinceDate:local1];
//把推送通知 加入到队列中 需要注意 推送通知加入以后 程序就算被kill掉推送通知仍然可以运行

//如果要弹出推送通知 需要程序 退出后台
[[UIApplication sharedApplication]scheduleLocalNotification:local];

//如何删除通知
//首先 要获取 推送消息
//    NSArray *localArry=[[UIApplication sharedApplication]scheduledLocalNotifications];
////便利通知
//    for (UILocalNotification *notification in localArry) {
//        if ([notification.alertBody isEqualToString:@"你妈炸了你妈炸了"]) {
//            //删除 通知
//            [[UIApplication sharedApplication]cancelLocalNotification:notification];
//        }
//    }
//删除所有的通知
//    [[UIApplication sharedApplication]cancelAllLocalNotifications];
/*
 本地推送的 加入方式 ，隔段时间没有打开应用，程序启动 会把原来的旧通知删除，饼计算3天后的时间
 NSInteger num=[UIApplication sharedApplication].applicationIconBadgeNumber;
 num+=1;
 local.applicationIconBadgeNumber=num;
 
 */
}
+(void)RTimePushapplication:(UIApplication *)application pushLongLime:(NSString*)longTime pushWords:(NSString *)words
{
    //删除所有的通知
    [[UIApplication sharedApplication]cancelAllLocalNotifications];
    //IOS8本地推送 添加授权
    if ([UIApplication instancesRespondToSelector:@selector(registerUserNotificationSettings:)]) {
        [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert |UIUserNotificationTypeBadge|UIUserNotificationTypeSound categories:nil]];
    }
    //创建本地推送
    UILocalNotification *local=[[UILocalNotification alloc]init];
    //设置推送内容
    local.alertBody=words;
    //设置呻吟 声音要小于30秒  并且声音本地要有
    local.soundName=@"音效.caf";
    local.repeatInterval=kCFCalendarUnitDay;
    //设置红色标示 用来显示 多少条 新的通知
//    local.applicationIconBadgeNumber=10;
    [UIApplication sharedApplication].applicationIconBadgeNumber=0;
    /*
     20150825145300
     20110826134106
     NSString* string = @"20110826134106";
     NSDateFormatter *inputFormatter = [[[NSDateFormatter alloc] init] autorelease];
     [inputFormatter setLocale:[[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"] autorelease]];
     [inputFormatter setDateFormat:@"yyyyMMddHHmmss"];
     NSDate* inputDate = [inputFormatter dateFromString:string];
     NSLog(@"date = %@", inputDate);
     */
    NSTimeZone *tz=[NSTimeZone systemTimeZone];
    // NSLog(@"%@",tz);
    NSInteger sub=[tz secondsFromGMT];
    // NSLog(@"%ld",sub);
    NSDate *date=[NSDate date];
    NSDate *local1= [date dateByAddingTimeInterval:sub];
    NSLog(@"%@",local1);
    // sub+=10;
    // NSLog(@"%ld",sub);
    NSString *str=[NSString stringWithFormat:@"%@",local1];
    NSString *dataStr=[str componentsSeparatedByString:@" "][0];
   // NSLog(@"dataStr:%@",dataStr);
    //    NSString *dataNow=[NSString stringWithFormat:@"%@ ",dataStr];
    //    NSLog(@"dataNow:%@",dataNow);
    NSArray *dataYear=[dataStr componentsSeparatedByString:@"-"];
    NSString *strYear=nil;
    strYear=[NSString stringWithFormat:@"%@%@%@",dataYear[0],dataYear[1],dataYear[2]];
    //// NSLog(@"%@",strYear);
    //strYear=[strYear componentsSeparatedByString:@" "][0];
    strYear=[strYear stringByAppendingString:longTime];
    NSLog(@"%@",strYear);
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init] ;
    [inputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]] ;
    [inputFormatter setDateFormat:@"yyyyMMddHHmmss"];
    
    NSDate* inputDate = [inputFormatter dateFromString:strYear];
    //NSLog(@"date = %@", inputDate);
    
    
    NSTimeZone *fromzone = [NSTimeZone systemTimeZone];
    
    NSInteger frominterval = [fromzone secondsFromGMTForDate: inputDate];
    
    inputDate = [inputDate  dateByAddingTimeInterval: frominterval] ;
   // NSLog(@"inputDate:%@",inputDate);
    
    
    //    NSDateFormatter * df2 = [[NSDateFormatter alloc] init];
    //    [df2 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //    // NSDate* inputDate1 = [df2 dateFromString:strYear];
    //    NSString * str1 = [df2 stringFromDate:inputDate];
    //     NSLog(@" = %@", str1);
    //    NSLog(@" =111 %@", [df2 dateFromString:str1]);
    // NSDate *local2= [date dateByAddingTimeInterval:sub];
    //NSDate *dat=[df2 stringFromDate:inputDate];
    if ([inputDate timeIntervalSinceDate: local1]>=0) {
        NSLog(@"%f秒之后推送", [inputDate timeIntervalSinceDate: local1]);
    }
    else
    {
        NSLog(@"今天不会推送");
    }
    
    //    NSDate *local3=];
    // NSLog(@"%f",[local2 timeIntervalSinceDate:local1]);
    //设置 开始时间
    local.fireDate=[NSDate dateWithTimeIntervalSinceNow:[inputDate timeIntervalSinceDate: local1]];
    // local.fireDate=[local2 timeIntervalSinceDate:local1];
    //把推送通知 加入到队列中 需要注意 推送通知加入以后 程序就算被kill掉推送通知仍然可以运行
    
    //如果要弹出推送通知 需要程序 退出后台
    [[UIApplication sharedApplication]scheduleLocalNotification:local];
    
    //如何删除通知
    //首先 要获取 推送消息
    //    NSArray *localArry=[[UIApplication sharedApplication]scheduledLocalNotifications];
    ////便利通知
    //    for (UILocalNotification *notification in localArry) {
    //        if ([notification.alertBody isEqualToString:@"你妈炸了你妈炸了"]) {
    //            //删除 通知
    //            [[UIApplication sharedApplication]cancelLocalNotification:notification];
    //        }
    //    }
    //删除所有的通知
    //    [[UIApplication sharedApplication]cancelAllLocalNotifications];
    /*
     本地推送的 加入方式 ，隔段时间没有打开应用，程序启动 会把原来的旧通知删除，饼计算3天后的时间
     NSInteger num=[UIApplication sharedApplication].applicationIconBadgeNumber;
     num+=1;
     local.applicationIconBadgeNumber=num;
     
     */
}
@end
