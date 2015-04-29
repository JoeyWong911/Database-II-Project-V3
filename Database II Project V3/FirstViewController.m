//
//  FirstViewController.m
//  Database II Project
//
//  Created by Joey Wong on 4/28/15.
//  Copyright (c) 2015 Joey & Jacky. All rights reserved.
//

#import "FirstViewController.h"
#import "DataClass.h"


@interface FirstViewController ()<UITextFieldDelegate>
{
    PlayerModel *_playerModel;
    NSArray *_feedItems;
    
}

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set this view controller object as the delegate and data source for the table view
    self.listTableView.delegate = self;
    self.listTableView.dataSource = self;
    
    // Create array object and assign it to _feedItems variable
    _feedItems = [[NSArray alloc] init];
    
    // Create new HomeModel object and assign it to _homeModel variable
    _playerModel = [[PlayerModel alloc] init];
    
    // Set this view controller object as the delegate for the home model object
    _playerModel.delegate = self;
    
    // Call the download items method of the home model object
    [_playerModel downloadItems];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    DataClass *obj=[DataClass getInstance];

    NSLog(@"You entered %@",self.myTextField.text);
    [self.myTextField resignFirstResponder];
    obj.searchCol = _myTextField.text;
    
    NSLog(@"It is %@", obj.searchCol);

    
    return YES;
}


-(void)itemsDownloaded:(NSArray *)items
{
    // This delegate method will get called when the items are finished downloading
    
    // Set the downloaded items to the array
    _feedItems = items;
    
    // Reload the table view
    [self.listTableView reloadData];
}


#pragma mark Table View Delegate Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of feed items (initially 0)
    return _feedItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Retrieve cell
    NSString *cellIdentifier = @"BasicCell";
    UITableViewCell *myCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    // Get the location to be shown
    Master *item = _feedItems[indexPath.row];
    
    // Get references to labels of cell
    myCell.textLabel.text = item.playerID;
    
    return myCell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
