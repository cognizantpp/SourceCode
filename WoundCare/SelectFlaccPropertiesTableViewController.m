//
//  SelectFlaccPropertiesTableViewController.m
//  PainView
//
//  Created by Antony on 30/03/14.
//  Copyright (c) 2014 Cognizant. All rights reserved.
//

#import "SelectFlaccPropertiesTableViewController.h"






@implementation SelectFlaccPropertiesTableViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
        // Uncomment the following line to preserve selection between presentations.
        // self.clearsSelectionOnViewWillAppear = NO;
    
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem;
 
    CoreDataHelper *cdh=[CoreDataHelper sharedInstance];
    self.faceArray= [cdh fetchTheFlaccFields:@"1"];
    self.faceScore= [cdh fetchTheFlaccScore:@"1"];
    self.legArray= [cdh fetchTheFlaccFields:@"2"];
    self.legScore= [cdh fetchTheFlaccScore:@"2"];
    self.activityArray= [cdh fetchTheFlaccFields:@"3"];
    self.activityScore=[cdh fetchTheFlaccScore:@"3"];
    self.cryArray=[cdh fetchTheFlaccFields:@"4"];
    self.cryScore= [cdh fetchTheFlaccScore:@"4"];
    self.consolabilityArray= [cdh fetchTheFlaccFields:@"5"];
    self.consolabilityScore= [cdh fetchTheFlaccScore:@"5"];
    

    
    

    

   
    

   self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"popup.png"]];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self.tableView reloadData];
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
    static NSString *simpleTableIdentifier = @"FlaccProperties";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"popup.png"]];
    
    if([self.selectedCategory isEqualToString:@"Face"])
    {
    
    
 _selectedString = [[[NSString stringWithFormat:@"%@",[self.faceScore objectAtIndex:indexPath.row]] stringByAppendingString:@" - "] stringByAppendingString:[NSString stringWithFormat:@"%@",[self.faceArray objectAtIndex:indexPath.row]]];
    
        //  NSLog(@"%@",_selectedString);
    }
    if([self.selectedCategory isEqualToString:@"Leg"])
    {
        _selectedString = [[[NSString stringWithFormat:@"%@",[self.legScore objectAtIndex:indexPath.row]] stringByAppendingString:@"       "] stringByAppendingString:[NSString stringWithFormat:@"%@",[self.legArray objectAtIndex:indexPath.row]]];
        
        
    }
    else if ([self.selectedCategory isEqualToString:@"Activity"])
    {
        _selectedString = [[[NSString stringWithFormat:@"%@",[self.activityScore objectAtIndex:indexPath.row]] stringByAppendingString:@"       "] stringByAppendingString:[NSString stringWithFormat:@"%@",[self.activityArray objectAtIndex:indexPath.row]]];
    }
    else if ([self.selectedCategory isEqualToString:@"Cry"])
    {
        _selectedString = [[[NSString stringWithFormat:@"%@",[self.cryScore objectAtIndex:indexPath.row]] stringByAppendingString:@"       "] stringByAppendingString:[NSString stringWithFormat:@"%@",[self.cryArray objectAtIndex:indexPath.row]]];
    }
    else if ([self.selectedCategory isEqualToString:@"Consolability"])
   
{
        _selectedString = [[[NSString stringWithFormat:@"%@",[self.consolabilityScore objectAtIndex:indexPath.row]] stringByAppendingString:@"       "] stringByAppendingString:[NSString stringWithFormat:@"%@",[self.consolabilityArray objectAtIndex:indexPath.row]]];
    }
   

    
    cell.textLabel.text=_selectedString;
    
    return cell;
    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        // now you can use cell.textLabel.text

    if([self.selectedCategory isEqualToString:@"Face"])
    {
    
    [self.dataDelegate getFaceString:cell.textLabel.text andScore:(NSInteger)indexPath.row];
    
    }
    else if ([self.selectedCategory isEqualToString:@"Leg"])
    {
        [self.dataDelegate getLegString:cell.textLabel.text andScore:(NSInteger)indexPath.row];
    }
    else if ([self.selectedCategory isEqualToString:@"Activity"])
    {
         [self.dataDelegate getActivityString:cell.textLabel.text andScore:(NSInteger)indexPath.row];
    }
    else if ([self.selectedCategory isEqualToString:@"Cry"])
    {
        
     [self.dataDelegate getCryString:cell.textLabel.text andScore:(NSInteger)indexPath.row];
    }
    else if ([self.selectedCategory isEqualToString:@"Consolability"])
    {
         [self.dataDelegate getConsolabilityString:cell.textLabel.text andScore:(NSInteger)indexPath.row];
    }
    
}




@end
