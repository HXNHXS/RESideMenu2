//
//  RTimePush.h
//  PushDemo
//
//  Created by qianfeng007 on 15/8/27.
//  Copyright (c) 2015年 Rain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface RTimePush : NSObject
+(void)RTimePushapplication:(UIApplication *)application pushtime:(NSString*)shotTime pushWords:(NSString*)words pushSound:(NSString*)sound;
+(void)RTimePushapplication:(UIApplication *)application pushLongLime:(NSString*)longTime pushWords:(NSString*)words;
@end
