//
//  OklessGastroTableViewController.m
//  GastrostomyVC
//
//  Created by Sujitha on 09/04/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import "OklessGastroTableViewController.h"

@implementation OklessGastroTableViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.ExudateOdorArray = [NSMutableArray arrayWithObjects:@"None", @"Present",@"Other", nil];
        self.ExudateAmountArray = [NSMutableArray arrayWithObjects:@"None", @"Minimal",@"Moderate",@"Large", nil];
        self.GranulationTissueArray = [NSMutableArray arrayWithObjects:@"No new protruding pink,moist tissue noted at stoma site", @"Fleshy,moist,pink,patchy tissue around stoma site",@"Fleshy,moist,pink tissue,partially surrounding the stoma site",@"Fleshy,moist,pink tissue,completely surrounding stoma",@"Other", nil];
        self.EdemaArray = [NSMutableArray arrayWithObjects:@"None", @"1+Edema",@"2+Edema",@"3+Edema",@"4+Edema",nil];
        self.ConditionArray = [NSMutableArray arrayWithObjects:@"Acute", @"Recurrent",@"Chronic",nil];
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


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.selectedArray count];;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *simpleTableIdentifier = @"thecell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"popup.png"]];
    
    if([self.selectedCategory isEqualToString:@"Exudate Odor"])
    {
        _selectedString = [self.ExudateOdorArray objectAtIndex:indexPath.row];
        
        
    }
    else if ([self.selectedCategory isEqualToString:@"Exudate Amount"])
    {
        _selectedString = [self.ExudateAmountArray objectAtIndex:indexPath.row];
    }
    
    else if ([self.selectedCategory isEqualToString:@"Granulation Tissue"])
    {
        _selectedString = [self.GranulationTissueArray objectAtIndex:indexPath.row];
    }
    else if ([self.selectedCategory isEqualToString:@"Edema"])
    {
        _selectedString = [self.EdemaArray objectAtIndex:indexPath.row];
    }
    else if ([self.selectedCategory isEqualToString:@"Condition"])
    {
        _selectedString = [self.ConditionArray objectAtIndex:indexPath.row];
    }
    
    cell.textLabel.text=_selectedString;
    
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if([self.selectedCategory isEqualToString:@"Exudate Odor"])
    {
        
        
        [self.dataDelegate getExudateOdor:[self.ExudateOdorArray objectAtIndex:indexPath.row]];
    }
    else if ([self.selectedCategory isEqualToString:@"Exudate Amount"])
    {
        [self.dataDelegate getExudateAmount:[self.ExudateAmountArray objectAtIndex:indexPath.row]];
    }
    else if ([self.selectedCategory isEqualToString:@"Granulation Tissue"])
    {
        [self.dataDelegate getGranulationTissue:[self.GranulationTissueArray objectAtIndex:indexPath.row]];
    }
    else if ([self.selectedCategory isEqualToString:@"Edema"])
    {
        [self.dataDelegate getEdema:[self.EdemaArray objectAtIndex:indexPath.row]];
    }
    else if ([self.selectedCategory isEqualToString:@"Condition"])
    {
        [self.dataDelegate getCondition:[self.ConditionArray objectAtIndex:indexPath.row]];
    }
    
    
}


@end
