//
//  PatientListTableViewController.m
//  WoundCare
//
//  Created by Sangeetha on 22/04/15.
//
//

#import "PatientListTableViewController.h"
#import "PatientListCell.h"
#import "AssignmentsViewController.h"
#import "AssessmentViewController.h"
@interface PatientListTableViewController ()

@end

@implementation PatientListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 400, 30)];
    self.tableView.tableHeaderView=_headerView;
    
    UIImageView *imageheaderView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 400, 30)];
    
    imageheaderView.image = [UIImage imageNamed:@"head.png"];
    [_headerView addSubview:imageheaderView];
    
    UILabel *chartLabel = [[UILabel alloc] initWithFrame:CGRectMake(10,0,50,30)];
    chartLabel.text=@"Chart";
    [chartLabel setFont:[UIFont systemFontOfSize:14]];
    chartLabel.textColor = [UIColor whiteColor];
    [_headerView addSubview:chartLabel];
    
    
    UILabel *lblPatient = [[UILabel alloc] initWithFrame:CGRectMake(65,0,150,30)];
    lblPatient.text=@"Patient Name";
    [lblPatient setFont:[UIFont systemFontOfSize:14]];
        lblPatient.textColor = [UIColor whiteColor];
        [_headerView addSubview:lblPatient];
    
    UILabel *lblEntry = [[UILabel alloc] initWithFrame:CGRectMake(230,0,100,30)];
    lblEntry.text=@"DOB";
    [lblEntry setFont:[UIFont systemFontOfSize:14]];
        lblEntry.textColor = [UIColor whiteColor];
    //[_headerView setBackgroundColor:[UIColor blackColor]];
    [_headerView addSubview:lblEntry];

    
//    UILabel *lblConsult = [[UILabel alloc] initWithFrame:CGRectMake(330,15,100,30)];
//    lblConsult.text=@"Consult Type";
//    [lblConsult setFont:[UIFont boldSystemFontOfSize:12]];
//    [_headerView addSubview:lblConsult];
    
    UILabel *lblRoomNo = [[UILabel alloc] initWithFrame:CGRectMake(320,0,100,30)];
    lblRoomNo.text=@"Room No.";
    [lblRoomNo setFont:[UIFont systemFontOfSize:14]];
        lblRoomNo.textColor = [UIColor whiteColor];
    [_headerView addSubview:lblRoomNo];
    
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"poppupsmall.png"]];
    [self.tableView setBackgroundView:imageView];
   
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return [[patientsDetails valueForKey:@"patient_name"]count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PatientListCell *patientListCell =(PatientListCell*) [self.tableView dequeueReusableCellWithIdentifier:@"PatientListCell"];
    patientListCell.lblPatientName.text =[[patientsDetails valueForKey:@"patient_name"] objectAtIndex:indexPath.row];
    patientListCell.lblEntryNo.text = [[patientsDetails valueForKey:@"dob"] objectAtIndex:indexPath.row];
    patientListCell.lblRoomNo.text = [[patientsDetails valueForKey:@"room_number"] objectAtIndex:indexPath.row];
    if ([[[patientsDetails valueForKey:@"chart_status"] objectAtIndex:indexPath.row] isEqualToString:@"fresh"]) {
        patientListCell.imgStatus.image = [UIImage imageNamed:@"dottrans.png"];
    }
    else if([[[patientsDetails valueForKey:@"chart_status"] objectAtIndex:indexPath.row] isEqualToString:@"pending"]){
        patientListCell.imgStatus.image = [UIImage imageNamed:@"orangedot.png"];
    }
    else{
        patientListCell.imgStatus.image = [UIImage imageNamed:@"greentick.png"];
    }
    patientListCell.backgroundColor = [UIColor clearColor];
    return patientListCell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    selectedPatientIndex =(int) indexPath.row;
    entry_no=[[patientsDetails valueForKey:@"entry_number"] objectAtIndex:indexPath.row];
    CoreDataHelper *helper = [CoreDataHelper sharedInstance];
    helper.imageArr = [[NSMutableDictionary alloc]init];
    helper.imageText = [[NSMutableDictionary alloc]init];
    helper.woundIdDic = [[NSMutableDictionary alloc]init];
    helper.woundName = [[NSMutableDictionary alloc]init];
    helper.woundImageName = [[NSMutableArray alloc]init];
    helper.woundCoordinates = [[NSMutableArray alloc]init];
    helper.woundNumber = [[NSMutableArray alloc]init];
    
    AssessmentViewController *newAssessment = [self.storyboard instantiateViewControllerWithIdentifier:@"AssessmentViewController"];
    [self presentViewController:newAssessment animated:NO completion:nil];
}


@end
