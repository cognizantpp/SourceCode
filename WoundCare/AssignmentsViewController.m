//
//  AssignmentsViewController.m
//  SampleDB
//
//  Created by Sangeetha on 18/03/15.
//  Copyright (c) 2015 Sangeetha. All rights reserved.
//

#import "AssignmentsViewController.h"
#import "AssignmentsCell.h"
#import "PatientDetails.h"
#import "Login.h"


@interface AssignmentsViewController ()

@property(nonatomic,strong)UIPopoverController *popOver;


@end

@implementation AssignmentsViewController
@synthesize tableView;

PatientDetails *patientsDetails;

-(void) viewDidLoad{
    CoreDataHelper *coreDatahelper = [CoreDataHelper sharedInstance];
   // patientsDetails = [coreDatahelper getAssignmentsList:coreDatahelper.gblstaffId];
     patientsDetails = [coreDatahelper getAssignmentsList:@"user1"];
    NSLog(@"staff %@  ::: %@",coreDatahelper.gblstaffName,coreDatahelper.gblstaffId);
    self.lblUserName.text = coreDatahelper.gblstaffName;
    self.lblPatientsCount.text = [NSString stringWithFormat:@"%d", [[patientsDetails valueForKey:@"patient_name"] count]];
    
    
    
    
    //_addAssignmentPopOverController=[[AddAssignmentPopOverController alloc]init];
    
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[patientsDetails valueForKey:@"patient_name"]count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AssignmentsCell *assignmentCell =(AssignmentsCell*) [self.tableView dequeueReusableCellWithIdentifier:@"AssignmentCell"];
    assignmentCell.lblPatientName.text =[[patientsDetails valueForKey:@"patient_name"] objectAtIndex:indexPath.row];
    assignmentCell.lblEntryNo.text = [[patientsDetails valueForKey:@"entry_number"] objectAtIndex:indexPath.row];
    assignmentCell.lblConsult.text = [[patientsDetails valueForKey:@"consult_type"] objectAtIndex:indexPath.row];
    assignmentCell.lblRoomNo.text = [[patientsDetails valueForKey:@"room_number"] objectAtIndex:indexPath.row];
    if ([[[patientsDetails valueForKey:@"chart_status"] objectAtIndex:indexPath.row] isEqualToString:@"fresh"]) {
        assignmentCell.imgStatus.image = [UIImage imageNamed:@"dottrans.png"];
    }
    else if([[[patientsDetails valueForKey:@"chart_status"] objectAtIndex:indexPath.row] isEqualToString:@"pending"]){
        assignmentCell.imgStatus.image = [UIImage imageNamed:@"orangedot.png"];
    }
    else{
        assignmentCell.imgStatus.image = [UIImage imageNamed:@"greentick.png"];
    }
    assignmentCell.backgroundColor = [UIColor clearColor];
    return assignmentCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
        
}

- (IBAction)addAssignmentClicked:(id)sender {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.addAssignmentPopOverController = [storyBoard instantiateViewControllerWithIdentifier:@"AddAssignmentPopOverController"];
    _addAssignmentPopOverController.delegate=self;
     self.popOver =  [[UIPopoverController alloc]initWithContentViewController:self.addAssignmentPopOverController];
    //[self.popOver setPopoverContentSize:CGSizeMake(500, 400)];
    [self.popOver presentPopoverFromRect:[sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
}

-(void)OkClicked{
    CoreDataHelper *coreDataHelper = [CoreDataHelper sharedInstance];
    patientsDetails = [coreDataHelper getAssignmentsList:@"user1"];
    [self.popOver dismissPopoverAnimated:YES];
    self.lblPatientsCount.text = [NSString stringWithFormat:@"%d", [[patientsDetails valueForKey:@"patient_name"] count]];
    [self.tableView reloadData];
    
    
}



@end
