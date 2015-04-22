//
//  RadioPopUpViewController.m
//  WoundView
//
//  Created by Antony on 16/04/13.
//  Copyright (c) 2013 Cognizant. All rights reserved.
//

#import "RadioPopUpViewController.h"

@implementation RadioPopUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
        // Uncomment the following line to preserve selection between presentations.
        // self.clearsSelectionOnViewWillAppear = NO;
    
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.indexArray= [NSArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4", nil];
    self.ulcerIndexArray= [NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"Suspect",@"Unstageable", nil];

    
    self.newbornSymptomArray=[NSArray arrayWithObjects:@"Absence of redness,warmth,pain,swelling,blanching",@"Pain at access IV site,no swelling,no erythema,no induration",@"Pain at IV site,slight swelling,no blanching,good pulse below site,capillary refill less than 3 seconds below site",@"Pain at IV site,marked swelling,blanching,skin cool to touch,good pulse below site,brisk capillary refill below site",@"Pain at IV site,marked swelling,blanching,skin cool to touch,decreased or absent pulse,capillary refill greater than 4 seconds,skin breakdown or necrosos.Infiltrate of any amount of blood product,irritant,or vesciant", nil];
    
    self.pediatricSymptomArray=[NSArray arrayWithObjects:@"No Symptoms",@"Skin blanched.Edema less than 1 inch in any direction.Cool to touch.With or without pain",@"Skin blanched.Edema 1-6 inches in any direction.Cool to touch.With or without pain",@"Skin blanched.translucent.Gross edema greater than 6 inches in any direction.Cool to touch.Mild-moderate pain.Possible numbness",@"Skin blanched.translucent.Skin discolored,bruised,swollen.Gross edema greater than 6 inches in any direction.Deep pitting tissue edema.Circulatory impairment.Moderate-severe pain.Infiltration of any amount of blood product,irritant,or vesicant", nil];
    
    self.phlebitisSymptomArray=[NSArray arrayWithObjects:@"No symptom",@"Erythema at access site with or without pain",@"Pain at access site with erythema/edema",@"Pain at access site with erythema/edema;streak formation;palpable venous cord",@"Pain at access site with erythema/edema;streak formation;palpable venous cord greater than one inch in length;purulent drainage", nil];
    
    
    self.ulcerSymptomArray=[NSArray arrayWithObjects:@"Non-blanchable redness",@"Epidermal loss,intact blister,ruptured blister",@"Full thickness loss",@"Full thickness loss:muscle/connective tissue",@"Suspect deep tissue injury(purple/maroon skin or blood in blister)",@"Unstageable(covered with slough/eschar)", nil];
    
    
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"popup.png"]];
        self.tableView.estimatedRowHeight = 68.0;
        self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    self.tableView.tableHeaderView=_headerView;

    UILabel *stageLabel = [[UILabel alloc] initWithFrame:CGRectMake(20,10,100,30)];
    stageLabel.text=@"Stage";
    [stageLabel setFont:[UIFont boldSystemFontOfSize:16]];
    [_headerView addSubview:stageLabel];

    
    UILabel *symptomLabel = [[UILabel alloc] initWithFrame:CGRectMake(300,10,100,30)];
    symptomLabel.text=@"Symptom";
    [symptomLabel setFont:[UIFont boldSystemFontOfSize:16]];
    
        [_headerView addSubview:symptomLabel];

        // [self.tableView layoutIfNeeded];
    
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
    if ([_selectedString isEqualToString:@"Ulcer"]) {
     
        return self.ulcerIndexArray.count;

    }
    else
        
    {
        return self.indexArray.count;

        
    }
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"PopUpCell";
    RadioPopUpCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    
    if (cell == nil) {
        cell = [[RadioPopUpCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
            //cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"popup.png"]];
   
    
    
    if ([_selectedString isEqualToString:@"Newborn"]) {
        
        cell.stageLabel.text=[_indexArray objectAtIndex:indexPath.row];

        cell.symptomLabel.text=[_newbornSymptomArray objectAtIndex:indexPath.row];

    }
    else if ([_selectedString isEqualToString:@"Pediatric"])
    {
        cell.stageLabel.text=[_indexArray objectAtIndex:indexPath.row];

        cell.symptomLabel.text=[_pediatricSymptomArray objectAtIndex:indexPath.row];
        
    }
    else if ([_selectedString isEqualToString:@"Phlebitis"])
    {
          cell.stageLabel.text=[_indexArray objectAtIndex:indexPath.row];

          cell.symptomLabel.text=[_phlebitisSymptomArray objectAtIndex:indexPath.row];
    }
    else if ([_selectedString isEqualToString:@"Ulcer"])
    {
        cell.stageLabel.text=[_ulcerIndexArray objectAtIndex:indexPath.row];
        
        cell.symptomLabel.text=[_ulcerSymptomArray objectAtIndex:indexPath.row];
    }
    
    return cell;
    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([_selectedString isEqualToString:@"Newborn"]) {
        [self.dataDelegate getInfiltrateNewbornData:[self.newbornSymptomArray objectAtIndex:indexPath.row]];

    }
    
    else if ([_selectedString isEqualToString:@"Pediatric"])
    {
        [self.dataDelegate getInfiltratePediatricData:[self.pediatricSymptomArray objectAtIndex:indexPath.row]];

    }
    else if ([_selectedString isEqualToString:@"Phlebitis"])
    {
        [self.dataDelegate getPhlebitisData:[self.phlebitisSymptomArray objectAtIndex:indexPath.row]];
    }
    else if ([_selectedString isEqualToString:@"Ulcer"])
    {
        [self.dataDelegate getUlcerData:[self.ulcerSymptomArray objectAtIndex:indexPath.row]];
    }
    
}




@end
