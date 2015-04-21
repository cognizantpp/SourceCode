//
//  SelectGastrostomySiteTableViewController.m
//  GastrostomyVC
//
//  Created by Sujitha on 08/04/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import "SelectGastrostomySiteTableViewController.h"

@implementation SelectGastrostomySiteTableViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView.allowsMultipleSelection = YES;
//    self.GastroSiteArray = [NSArray arrayWithObjects:@"Egg", @"Apple", @"Msngo", @"Burger", @"Ham and Egg Sandwich", @"Sandwich", @"Pizza",@"Other", nil];
    
    _itemsToBePassed=[[NSMutableArray alloc]init];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.opaque = NO;
    
    
    
    _footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    
   // self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"popup.png"]];
    
    self.tableView.tableFooterView=_footerView;
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 10, 100, 30)];
    
    
    UIImage *buttonImage = [UIImage imageNamed:@"button_ok.png"];
    [button setImage:buttonImage forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(footerTapped) forControlEvents:UIControlEventTouchUpInside];
    
    [_footerView addSubview:button];

    
    //_footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"popup.png"]];
    
    //self.tableView.tableFooterView=_footerView;
    
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return [self.selectedArray count];
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"cell";
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
    
    
    
}
- (void)footerTapped {
    
    
    
    
    
    
    
    
    if([_selectedString isEqualToString:@"Gastrostomy Site"])
    {
        [self.dataDelegate getGastrostomySite:self.itemsToBePassed ];
        
    }
    else if ([_selectedString isEqualToString:@"Gastrostomy Tube Type"])
    {
        [self.dataDelegate getGastrostomyTubeType:self.itemsToBePassed];
        
        
    }
    else if ([_selectedString isEqualToString:@"Character"])
    {
        [self.dataDelegate getCharacter:self.itemsToBePassed];
        
        
        
    }
    else if ([_selectedString isEqualToString:@"Retention Disk"])
    {
        [self.dataDelegate getRetentionDisk:self.itemsToBePassed];
        
        
        
    }
    else if ([_selectedString isEqualToString:@"Peristomal Skin Character"])
    {
        [self.dataDelegate getPeristomalSkinCharacter:self.itemsToBePassed];
        
        
        
    }
    else if ([_selectedString isEqualToString:@"Exudate Character"])
    {
        [self.dataDelegate getExudateCharacter:self.itemsToBePassed];
        
        
        
    }




    
    
    
}




@end
