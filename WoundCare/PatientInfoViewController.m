//
//  PatientInfoViewController.m
//  WoundCare
//
//  Created by Sangeetha on 07/04/15.
//
//

#import "PatientInfoViewController.h"

@interface PatientInfoViewController ()
- (IBAction)btnOKClicked:(id)sender;

@end

@implementation PatientInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.lblName.text = [[ patientsDetails valueForKey:@"patient_name"] objectAtIndex:selectedPatientIndex];
    self.lblAge.text = [[ patientsDetails valueForKey:@"age"] objectAtIndex:selectedPatientIndex];
    self.lblMMI.text = [[ patientsDetails valueForKey:@"mmi"] objectAtIndex:selectedPatientIndex];
    self.lblRoomNo.text = [[ patientsDetails valueForKey:@"room_number"] objectAtIndex:selectedPatientIndex];
    self.lblAdmitMd.text = [[ patientsDetails valueForKey:@"admit_md"] objectAtIndex:selectedPatientIndex];
    self.lblSex.text = [[ patientsDetails valueForKey:@"sex"] objectAtIndex:selectedPatientIndex];
    self.lblDOB.text = [[ patientsDetails valueForKey:@"dob"] objectAtIndex:selectedPatientIndex];
    self.lblENC.text = [[ patientsDetails valueForKey:@"entry_number"] objectAtIndex:selectedPatientIndex];
    self.lblAdmitDt.text = [[ patientsDetails valueForKey:@"admit_dt"] objectAtIndex:selectedPatientIndex];
    self.lblMRN.text = [[ patientsDetails valueForKey:@"mrn"] objectAtIndex:selectedPatientIndex];
    
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
    [self.delegate patientInfoOKClicked];
}
@end
