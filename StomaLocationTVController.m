//
//  StomaLocationTVController.m
//  Ostomy
//
//  Created by keerthana on 08/04/15.
//  Copyright (c) 2015 keerthana. All rights reserved.
//

#import "StomaLocationTVController.h"

@interface StomaLocationTVController ()

@end

@implementation StomaLocationTVController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //_itemsToBePassed=[[NSMutableArray alloc]init];
    //self.tableView.backgroundColor = [UIColor clearColor];
    //self.tableView.opaque = NO;
    self.stomaLocationArray=[NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Other", nil];
    self.stomaColorArray=[NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Other", nil];
    self.stomaOutputColorArray=[NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Other", nil];
    self.fistulaLocationArray=[NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Other", nil];
     self.fistulaColorArray=[NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Other", nil];
    self.exudateOdourArray=[NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Other", nil];
    self.exudateAmountArray=[NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", nil];
    self.granulationTissueArray=[NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Other", nil];
    self.edemaArray=[NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", nil];
    self.peristomalSkinConditionArray=[NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", nil];
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"popup.png"]];
    

}
-(void)viewDidAppear:(BOOL)animated
{
    
    [super viewWillAppear:YES];

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
    
    if([self.selectedCategory isEqualToString:@"StomaLocation"])
    {
        _selectedString = [self.stomaLocationArray objectAtIndex:indexPath.row];
        
        
    }
    else if ([self.selectedCategory isEqualToString:@"StomaColor"])
    {
        _selectedString = [self.stomaColorArray objectAtIndex:indexPath.row];
    }
    else if ([self.selectedCategory isEqualToString:@"StomaOutputColor"])
    {
        _selectedString = [self.stomaOutputColorArray objectAtIndex:indexPath.row];
    }
    else if ([self.selectedCategory isEqualToString:@"FistulaLocation"])
    {
        _selectedString = [self.fistulaLocationArray objectAtIndex:indexPath.row];
    }
    else if ([self.selectedCategory isEqualToString:@"FistulaColor"])
    {
        _selectedString = [self.fistulaColorArray objectAtIndex:indexPath.row];
    }
    else if ([self.selectedCategory isEqualToString:@"ExudateOdour"])
    {
        _selectedString = [self.exudateOdourArray objectAtIndex:indexPath.row];
    }
    else if ([self.selectedCategory isEqualToString:@"ExudateAmount"])
    {
        _selectedString = [self.exudateAmountArray objectAtIndex:indexPath.row];
    }
    else if ([self.selectedCategory isEqualToString:@"GranulationTissue"])
    {
        _selectedString = [self.granulationTissueArray objectAtIndex:indexPath.row];
    }
    else if ([self.selectedCategory isEqualToString:@"Edema"])
    {
        _selectedString = [self.edemaArray objectAtIndex:indexPath.row];
    }
    else if ([self.selectedCategory isEqualToString:@"Condition"])
    {
        _selectedString = [self.peristomalSkinConditionArray objectAtIndex:indexPath.row];
    }



    cell.textLabel.text=_selectedString;

    
    return cell;

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if([self.selectedCategory isEqualToString:@"StomaLocation"])
    {
        
        
        [self.dataDelegate getStomaLocationData:[self.stomaLocationArray objectAtIndex:indexPath.row]];
    }
    else if ([self.selectedCategory isEqualToString:@"StomaColor"])
    {
        [self.dataDelegate getStomaColorData:[self.stomaColorArray objectAtIndex:indexPath.row]];
    }
    else if ([self.selectedCategory isEqualToString:@"StomaOutputColor"])
    {
        [self.dataDelegate getStomaOutputColorData:[self.stomaOutputColorArray objectAtIndex:indexPath.row]];
    }
    else if ([self.selectedCategory isEqualToString:@"FistulaLocation"])
    {
        [self.dataDelegate getFistulaLocationData:[self.fistulaLocationArray objectAtIndex:indexPath.row]];
    }
    else if ([self.selectedCategory isEqualToString:@"FistulaColor"])
    {
        [self.dataDelegate getFistulaColorData:[self.fistulaColorArray objectAtIndex:indexPath.row]];
    }
    else if ([self.selectedCategory isEqualToString:@"ExudateOdour"])
    {
        [self.dataDelegate getPeristomalSkinExudateOdourData:[self.exudateOdourArray objectAtIndex:indexPath.row]];
    }
    else if ([self.selectedCategory isEqualToString:@"ExudateAmount"])
    {
        [self.dataDelegate getPeristomalSkinExudateAmountData:[self.exudateAmountArray objectAtIndex:indexPath.row]];
    }
    else if ([self.selectedCategory isEqualToString:@"GranulationTissue"])
    {
        [self.dataDelegate getPeristomalSkinGranulationTissueData:[self.granulationTissueArray objectAtIndex:indexPath.row]];
    }
    else if ([self.selectedCategory isEqualToString:@"Edema"])
    {
        [self.dataDelegate getPeristomalSkinEdemaData:[self.edemaArray objectAtIndex:indexPath.row]];
    }
    else if ([self.selectedCategory isEqualToString:@"Condition"])
    {
        [self.dataDelegate getPeristomalSkinConditionData:[self.peristomalSkinConditionArray objectAtIndex:indexPath.row]];
    }


}


@end
