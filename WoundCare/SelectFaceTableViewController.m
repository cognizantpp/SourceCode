//
//  SelectFaceTableViewController.m
//  PainView
//
//  Created by Antony on 30/03/14.
//  Copyright (c) 2014 Cognizant. All rights reserved.
//

#import "SelectFaceTableViewController.h"






@implementation SelectFaceTableViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
        // Uncomment the following line to preserve selection between presentations.
        // self.clearsSelectionOnViewWillAppear = NO;
    
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem;
 
    self.faceArray= [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", nil];
    self.faceScore= [NSArray arrayWithObjects:@"0", @"1", @"2", nil];

   self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"popup.png"]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return [self.faceArray count];
    
    
    
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
    
 _selectedString = [[[NSString stringWithFormat:@"%@",[self.faceScore objectAtIndex:indexPath.row]] stringByAppendingString:@" - "] stringByAppendingString:[NSString stringWithFormat:@"%@",[self.faceArray objectAtIndex:indexPath.row]]];
    
        //  NSLog(@"%@",_selectedString);
    
    cell.textLabel.text=_selectedString;
    
    return cell;
    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        // now you can use cell.textLabel.text

    
    
    [self.dataDelegate getFaceString:cell.textLabel.text andScore:(NSInteger)indexPath.row];
    
    
    
    
}




@end
