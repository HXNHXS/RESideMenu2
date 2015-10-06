//
//  NoteTableViewCell.h
//  RESideMenuExample
//
//  Created by qianfeng007 on 15/8/22.
//  Copyright (c) 2015年 Roman Efimov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NoteTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UISwitch *sw;
- (IBAction)sw:(id)sender;

@end
