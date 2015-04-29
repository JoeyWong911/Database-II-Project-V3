//
//  FirstViewController.h
//  Database II Project
//
//  Created by Joey Wong on 4/28/15.
//  Copyright (c) 2015 Joey & Jacky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerModel.h"
#import "Master.h"

@interface FirstViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, PlayerModelProtocol>

@property (weak, nonatomic) IBOutlet UITextField *myTextField;

@property (weak, nonatomic) IBOutlet UITableView *listTableView;


- (BOOL)textFieldShouldReturn:(UITextField *)textField;

@end

