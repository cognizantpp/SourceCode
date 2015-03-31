//
//  AddAssignmentPopOverController.m
//  WoundCare
//
//  Created by Sangeetha on 24/03/15.
//
//

#import "AddAssignmentPopOverController.h"
#import "AssignmentsViewController.h"



@interface AddAssignmentPopOverController ()
@property (strong, nonatomic)UIPopoverController *popOver;
@end

@implementation AddAssignmentPopOverController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnOKClicked:(id)sender {
    NSDate *dateToday = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"dd-MM-yy";
    NSString *datestring = [formatter stringFromDate:dateToday];
    NSLog(@"date %@",datestring);
    NSMutableDictionary *newPatient = [[NSMutableDictionary alloc]init];
    [newPatient setObject:self.txtPatientName.text forKey:@"patient_name"];
    [newPatient setObject:self.txtConsultType.text forKey:@"consult_type"];
    [newPatient setObject:self.txtRoomNumber.text forKey:@"room_number"];
    [newPatient setObject:self.txtFacilityName.text forKey:@"facility_name"];
    [newPatient setObject:self.btnEntryNumber.titleLabel.text forKey:@"entry_number"];
    [newPatient setObject:(NSString*)datestring forKey:@"admit_dt"];
    [[CoreDataHelper sharedInstance]insertNewPatients:newPatient];
    [self.delegate OkClicked];

}
- (IBAction)btnEntryNumberClicked:(id)sender {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.numberEntryViewController = [storyBoard instantiateViewControllerWithIdentifier:@"NumberEntryViewController"];
    self.numberEntryViewController.delegate=self;
    self.popOver =  [[UIPopoverController alloc]initWithContentViewController:self.numberEntryViewController];
    [self.popOver setPopoverContentSize:CGSizeMake(300, 250)];
    [self.popOver presentPopoverFromRect:[sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    
}
- (IBAction)btnFacilityClicked:(id)sender {
}

-(void)OkClicked{
    NSLog(@"dismiss in addassignment popover ");
    [self.popOver dismissPopoverAnimated:YES];
}

-(void)updateEntryNumber:(NSString *)entryNumber{
    [self.btnEntryNumber setTintColor:[UIColor blackColor]];
    [self.btnEntryNumber setAttributedTitle: [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",entryNumber]] forState:UIControlStateNormal];
    
}
@end
