//
//  SelectOstomySiteTVController.m
//  Ostomy
//
//  Created by keerthana on 07/04/15.
//  Copyright (c) 2015 keerthana. All rights reserved.
//

#import "SelectOstomySiteTVController.h"

@interface SelectOstomySiteTVController ()

@end

@implementation SelectOstomySiteTVController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
   
  //  self.OstomySiteArray = [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Other", nil];
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [self.selectedArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    static NSString *simpleTableIdentifier = @"myCell";
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
    
    if([_selectedString isEqualToString:@"OstomySite"])
    {
        [self.dataDelegate getOstomySiteData:self.itemsToBePassed ];
        
    }
    else if ([_selectedString isEqualToString:@"StomaOutputCharacter"])
    {
        [self.dataDelegate getStomaOutputCharacterData:self.itemsToBePassed];
        
    }
    else if ([_selectedString isEqualToString:@"StomaOutputCharacter"])
    {
        [self.dataDelegate getStomaOutputCharacterData:self.itemsToBePassed];
        
    }
    else if ([_selectedString isEqualToString:@"Character"])
    {
        [self.dataDelegate getPeristomalSkinCharacterData:self.itemsToBePassed];
        
    }
    else if ([_selectedString isEqualToString:@"ExudateCharacter"])
    {
        [self.dataDelegate getPeristomalSkinExudateCharacterData:self.itemsToBePassed];
        
    }
    
}



@end
