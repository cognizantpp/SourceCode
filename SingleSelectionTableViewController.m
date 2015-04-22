//
//  SingleSelectionTableViewController.m
//  WoundView
//
//  Created by Antony on 17/04/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import "SingleSelectionTableViewController.h"

@implementation SingleSelectionTableViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
        // Uncomment the following line to preserve selection between presentations.
        // self.clearsSelectionOnViewWillAppear = NO;
    
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.woundThicknessArray= [NSArray arrayWithObjects:@"immobile",@"very",@"Slightly",@"No", nil];
    self.exudateOdor= [NSArray arrayWithObjects:@"None",@"Present",@"Other", nil];
    self.exudateAmount= [NSArray arrayWithObjects:@"None",@"Minimal",@"Moderate",@"Copious",@"Estimated Amount",@"Canister Amount", nil];
    self.edema= [NSArray arrayWithObjects:@"None",@"1+Edema",@"2+Edema",@"3+Edema",@"4+Edema",nil];
    self.conditionArray= [NSArray arrayWithObjects:@"Acute",@"Recurrent",@"Chronic",nil];
    self.otherWoundsArray= [NSArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",nil];



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
    if([self.selectedCategory isEqualToString:@"WoundThickness"])
    {
        return self.woundThicknessArray.count;

    }
    else if ([self.selectedCategory isEqualToString:@"ExudateOdor"])
    {
        return self.exudateOdor.count;
    }
    else if ([self.selectedCategory isEqualToString:@"ExudateAmount"])
    {
        return self.exudateAmount.count;
    }
    else if ([self.selectedCategory isEqualToString:@"Edema"])
    {
        return self.edema.count;
    }
    else if ([self.selectedCategory isEqualToString:@"Condition"])
    {
        return self.conditionArray.count;
    }
    else
    {
        return self.otherWoundsArray.count;

    }
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"SingleSelection";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"popup.png"]];
    
    if([self.selectedCategory isEqualToString:@"WoundThickness"])
    {
        cell.textLabel.text=[_woundThicknessArray objectAtIndex:indexPath.row];

        
    }
    else if ([self.selectedCategory isEqualToString:@"ExudateOdor"])
    {
        cell.textLabel.text=[_exudateOdor objectAtIndex:indexPath.row];

    }
    else if ([self.selectedCategory isEqualToString:@"ExudateAmount"])
    {
        cell.textLabel.text=[_exudateAmount objectAtIndex:indexPath.row];
        
    }
    else if ([self.selectedCategory isEqualToString:@"Edema"])
    {
        cell.textLabel.text=[_edema objectAtIndex:indexPath.row];
        
    }
    else if ([self.selectedCategory isEqualToString:@"Condition"])
    {
        cell.textLabel.text=[_conditionArray objectAtIndex:indexPath.row];
        
    }
    else if ([self.selectedCategory isEqualToString:@"OtherWounds"])
    {
        cell.textLabel.text=[_otherWoundsArray objectAtIndex:indexPath.row];
        
    }
    return cell;
    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    if([self.selectedCategory isEqualToString:@"WoundThickness"])
    {
        
        
        [self.dataDelegate getWoundThicknessData:[self.woundThicknessArray objectAtIndex:indexPath.row]];
        
    }

    else if ([self.selectedCategory isEqualToString:@"ExudateOdor"])
    {
        [self.dataDelegate getExudateOdorData:[self.exudateOdor objectAtIndex:indexPath.row]];

    }
    else if ([self.selectedCategory isEqualToString:@"ExudateAmount"])
    {
        [self.dataDelegate getExudateAmountData:[self.exudateAmount objectAtIndex:indexPath.row]];
        
    }
    else if ([self.selectedCategory isEqualToString:@"Edema"])
    {
        [self.dataDelegate getEdemaData:[self.edema objectAtIndex:indexPath.row]];
        
    }
    else if ([self.selectedCategory isEqualToString:@"Condition"])
    {
        [self.dataDelegate getConditionData:[self.conditionArray objectAtIndex:indexPath.row]];
        
    }
    else if ([self.selectedCategory isEqualToString:@"OtherWounds"])
    {
        [self.dataDelegate getOtherWoundsData:[self.otherWoundsArray objectAtIndex:indexPath.row]];
        
    }
}


@end
