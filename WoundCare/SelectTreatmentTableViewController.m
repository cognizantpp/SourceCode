//
//   SelectTreatmentTableViewController.m
//  TreatmentApp
//
//  Created by Antony on 17/03/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import "SelectTreatmentTableViewController.h"

@implementation  SelectTreatmentTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
        // Uncomment the following line to preserve selection between presentations.
        // self.clearsSelectionOnViewWillAppear = NO;
    
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    
    
        // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.tableView.allowsMultipleSelection = YES;
    

    
    
    _itemsToBePassed=[[NSMutableArray alloc]init];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.opaque = NO;
  
     _footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    
        self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"popup.png"]];

    self.tableView.tableFooterView=_footerView;
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 10, 100, 30)];
    
    
    UIImage *buttonImage = [UIImage imageNamed:@"button_ok.png"];
    [button setImage:buttonImage forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(footerTapped) forControlEvents:UIControlEventTouchUpInside];
    
    [_footerView addSubview:button];
    
}
-(void)viewDidAppear:(BOOL)animated
{
    
    if (_itemsToBePassed) {
        [_itemsToBePassed removeAllObjects];
    }
    if ([self.array containsObject:@"Select"]) {
        [self.array  removeObject:@"Select"];
    }
    self.itemsToBePassed=self.array;
    
    [self.tableView reloadData];
    
  
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
 
        return [self.selectedArray count];
        
  
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    
    static NSString *simpleTableIdentifier = @"Treatment";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
         cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
         cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"popup.png"]];
  

    cell.textLabel.text=[self.selectedArray objectAtIndex:indexPath.row];
    
    if ([self.itemsToBePassed indexOfObject:cell.textLabel.text] != NSNotFound) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    
    return cell;
    
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    


    
    UITableViewCell *newCell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (newCell.accessoryType == UITableViewCellAccessoryNone) {
        newCell.accessoryType = UITableViewCellAccessoryCheckmark;
        [self.itemsToBePassed addObject:[self.selectedArray objectAtIndex:indexPath.row]];
    }else {
        newCell.accessoryType = UITableViewCellAccessoryNone;
         [_itemsToBePassed removeObject:[self.selectedArray objectAtIndex:indexPath.row]];
    }
     [tableView deselectRowAtIndexPath:indexPath animated:NO];
//    [self.tableView reloadData];
    
    
}




//
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//    
//        // height of the footer
//        // this needs to be set, otherwise the height is zero and no footer will show
//    return 50;
//}
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
//    
//        // creates a custom view inside the footer
//   
//    
//        // create a button with image and add it to the view
//
//   
//
//    return _footerView;
//}

- (void)footerTapped {
    
    if([_selectedString isEqualToString:@"Cleansing"])
    {
        [self.dataDelegate getData:self.itemsToBePassed];

           }
    else if ([_selectedString isEqualToString:@"Dressing"])
    {
        [self.dataDelegate getDressingData:self.itemsToBePassed];
        

    }
    else if ([_selectedString isEqualToString:@"Negative"])
    {
        [self.dataDelegate getNegativePressureWoundData:self.itemsToBePassed];

    }
    else if ([_selectedString isEqualToString:@"SkinCare"])
    {
        [self.dataDelegate getSkinCareData:self.itemsToBePassed];

    }
    
    
    
}



@end
