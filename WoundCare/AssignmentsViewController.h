//
//  AssignmentsViewController.h
//  SampleDB
//
//  Created by Sangeetha on 18/03/15.
//  Copyright (c) 2015 Sangeetha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataHelper.h"
#import "AddAssignmentPopOverController.h"

int selectedPatientIndex;
PatientDetails *patientsDetails;
NSString *entry_no;
@interface AssignmentsViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,GetDataProtocol>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *patients, *entryNumber, *consult,*roomNum;
@property (strong, nonatomic) IBOutlet UILabel *lblUserName;
@property (strong, nonatomic) AddAssignmentPopOverController *addAssignmentPopOverController;
@property (strong, nonatomic) IBOutlet UITextField *lblPatientsCount;





@end
