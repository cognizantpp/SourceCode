//
//  SelectLegTableViewController.m
//  PainView
//
//  Created by Antony on 31/03/14.
//  Copyright (c) 2014 Cognizant. All rights reserved.
//

#import "SelectLegTableViewController.h"

@implementation SelectLegTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
        // Uncomment the following line to preserve selection between presentations.
        // self.clearsSelectionOnViewWillAppear = NO;
    
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    CoreDataHelper *cdh=[CoreDataHelper sharedInstance];
    self.legArray= [cdh fetchTheFlaccFields:@"2"];
    self.legScore= [cdh fetchTheFlaccScore:@"2"];

    
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"popup.png"]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return [self.legArray count];
    
    
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"myCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"popup.png"]];
    
    _selectedString = [[[NSString stringWithFormat:@"%@",[self.legScore objectAtIndex:indexPath.row]] stringByAppendingString:@" - "] stringByAppendingString:[NSString stringWithFormat:@"%@",[self.legArray objectAtIndex:indexPath.row]]];
    
        //  NSLog(@"%@",_selectedString);
    
    cell.textLabel.text=_selectedString;
    
    return cell;
    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        // now you can use cell.textLabel.text
    
    
    
    [self.dataDelegate getLegString:cell.textLabel.text andScore:(NSInteger)indexPath.row];
    
    
    
    
}



@end
