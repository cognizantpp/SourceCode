//
//  ROSMobilityTableViewController.m
//  ReviewOfSystemsView
//
//  Created by Antony on 07/04/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import "ReviewAssessmentTableViewController.h"
NSArray *reviewassessarray;
@implementation ReviewAssessmentTableViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
        // Uncomment the following line to preserve selection between presentations.
        // self.clearsSelectionOnViewWillAppear = NO;
    
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem;

     CoreDataHelper *cdh=[CoreDataHelper sharedInstance];


    
    self.mobilityArray=[cdh fetchTheReviewAssessmentFields:@"4"];
    self.activityArray=[cdh fetchTheReviewAssessmentFields:@"5"];
    self.sensoryArray=[cdh fetchTheReviewAssessmentFields:@"6"];
    self.moistureArray=[cdh fetchTheReviewAssessmentFields:@"7"];
    self.frictionArray=[cdh fetchTheReviewAssessmentFields:@"8"];
    self.nutritionArray=[cdh fetchTheReviewAssessmentFields:@"9"];
    self.tissueArray=[cdh fetchTheReviewAssessmentFields:@"10"];
    
    
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
    
    return self.mobilityArray.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"ROSMobility";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"popup.png"]];
    
    if([self.selectedCategory isEqualToString:@"Mobility"])
    {
        _selectedString = [[[NSString stringWithFormat:@"%@",[self.mobilityArray objectAtIndex:indexPath.row]] stringByAppendingString:@"       "] stringByAppendingString:[NSString stringWithFormat:@"%@",[self.ScoreArray objectAtIndex:indexPath.row]]];

        
    }
    else if ([self.selectedCategory isEqualToString:@"Activity"])
    {
           _selectedString = [[[NSString stringWithFormat:@"%@",[self.activityArray objectAtIndex:indexPath.row]] stringByAppendingString:@"       "] stringByAppendingString:[NSString stringWithFormat:@"%@",[self.ScoreArray objectAtIndex:indexPath.row]]];
    }
    else if ([self.selectedCategory isEqualToString:@"Sensory"])
    {
        _selectedString = [[[NSString stringWithFormat:@"%@",[self.sensoryArray objectAtIndex:indexPath.row]] stringByAppendingString:@"       "] stringByAppendingString:[NSString stringWithFormat:@"%@",[self.ScoreArray objectAtIndex:indexPath.row]]];
    }
    else if ([self.selectedCategory isEqualToString:@"Moisture"])
    {
        _selectedString = [[[NSString stringWithFormat:@"%@",[self.moistureArray objectAtIndex:indexPath.row]] stringByAppendingString:@"       "] stringByAppendingString:[NSString stringWithFormat:@"%@",[self.ScoreArray objectAtIndex:indexPath.row]]];
    }
    else if ([self.selectedCategory isEqualToString:@"Friction"])
    {
        _selectedString = [[[NSString stringWithFormat:@"%@",[self.frictionArray objectAtIndex:indexPath.row]] stringByAppendingString:@"       "] stringByAppendingString:[NSString stringWithFormat:@"%@",[self.ScoreArray objectAtIndex:indexPath.row]]];
    }

    else if ([self.selectedCategory isEqualToString:@"Nutrition"])
    {
        _selectedString = [[[NSString stringWithFormat:@"%@",[self.nutritionArray objectAtIndex:indexPath.row]] stringByAppendingString:@"       "] stringByAppendingString:[NSString stringWithFormat:@"%@",[self.ScoreArray objectAtIndex:indexPath.row]]];
    }

    else if ([self.selectedCategory isEqualToString:@"Tissue"])
    {
        _selectedString = [[[NSString stringWithFormat:@"%@",[self.tissueArray objectAtIndex:indexPath.row]] stringByAppendingString:@"       "] stringByAppendingString:[NSString stringWithFormat:@"%@",[self.ScoreArray objectAtIndex:indexPath.row]]];
    }

        //  NSLog(@"%@",_selectedString);
    
    cell.textLabel.text=_selectedString;
    
    return cell;
    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    if([self.selectedCategory isEqualToString:@"Mobility"])
    {
        
    
    [self.dataDelegate getROSMobilityString:[self.mobilityArray objectAtIndex:indexPath.row] andScore:indexPath.row];
    
    }
    else if ([self.selectedCategory isEqualToString:@"Activity"])
    {
        [self.dataDelegate getROSActivityString:[self.activityArray objectAtIndex:indexPath.row] andScore:indexPath.row];

    }
    else if ([self.selectedCategory isEqualToString:@"Sensory"])
    {

    [self.dataDelegate getROSSensoryString:[self.sensoryArray objectAtIndex:indexPath.row] andScore:indexPath.row];
        
    }
    else if ([self.selectedCategory isEqualToString:@"Moisture"])
    {
        
        [self.dataDelegate getROSMoistureString:[self.moistureArray objectAtIndex:indexPath.row] andScore:indexPath.row];
        
    }
    else if ([self.selectedCategory isEqualToString:@"Friction"])
    {
        
        [self.dataDelegate getROSFrictionString:[self.frictionArray objectAtIndex:indexPath.row] andScore:indexPath.row];
        
    }
    else if ([self.selectedCategory isEqualToString:@"Nutrition"])
    {
        
        [self.dataDelegate getROSNutritionString :[self.nutritionArray objectAtIndex:indexPath.row] andScore:indexPath.row];
        
    }
    else if ([self.selectedCategory isEqualToString:@"Tissue"])
    {
        
        [self.dataDelegate getROSTissueString :[self.tissueArray objectAtIndex:indexPath.row] andScore:indexPath.row];
        
    }
    
}


@end
