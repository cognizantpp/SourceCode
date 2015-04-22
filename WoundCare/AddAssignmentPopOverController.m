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
{
    CGPoint p;
}

@property (strong, nonatomic)UIPopoverController *popOver;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
@property(nonatomic,strong)UIPopoverController *datePickerPopOver;
@property(nonatomic)CGRect r;
@property(nonatomic)CGRect tRect;

@end

@implementation AddAssignmentPopOverController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollview.delegate = self;
    self.txtFacilityName.delegate = self;
    self.txtPatientName.delegate = self;
    self.txtConsultType.delegate = self;
    self.txtRoomNumber.delegate = self;
    self.txtAge.delegate = self;
    self.txtDOB.delegate =self;
    [self.txtAge setUserInteractionEnabled:NO];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField.returnKeyType == UIReturnKeyNext) {
        UIView *next = [[theTextField superview]viewWithTag:theTextField.tag + 1];
        [next becomeFirstResponder];
    } else if (theTextField.returnKeyType == UIReturnKeyDone) {
        [theTextField resignFirstResponder];
    }
    return YES;
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

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
    [self.popOver dismissPopoverAnimated:YES];
}

-(void)updateEntryNumber:(NSString *)entryNumber{
    [self.btnEntryNumber setTintColor:[UIColor blackColor]];
    [self.btnEntryNumber setAttributedTitle: [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",entryNumber]] forState:UIControlStateNormal];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if (![segue.identifier isEqualToString:@"novalidate"]) {
        NSDate *dateToday = [NSDate date];
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        formatter.dateFormat = @"dd-MM-yy";
        NSString *datestring = [formatter stringFromDate:dateToday];
        NSMutableDictionary *newPatient = [[NSMutableDictionary alloc]init];
        [newPatient setObject:self.txtPatientName.text forKey:@"patient_name"];
        [newPatient setObject:self.txtConsultType.text forKey:@"consult_type"];
        [newPatient setObject:self.txtRoomNumber.text forKey:@"room_number"];
        [newPatient setObject:self.txtFacilityName.text forKey:@"facility_name"];
        [newPatient setObject:self.btnEntryNumber.titleLabel.text forKey:@"entry_number"];
        [newPatient setObject:(NSString*)datestring forKey:@"admit_dt"];
        [newPatient setObject:self.dateButtonOutlet.titleLabel.text forKey:@"dob"];
        [newPatient setObject:self.txtAge.text forKey:@"age"];
        [[CoreDataHelper sharedInstance]insertNewPatients:newPatient];
    }
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    if (![identifier isEqualToString:@"novalidate"]) {
        
        BOOL canPerform = YES;
        NSString *alertString;
        if (self.btnEntryNumber.titleLabel.text == nil) {
            canPerform = NO;
            alertString = @"Entry number is required";
        }
        else if ([self.txtFacilityName.text isEqualToString:@""]){
            canPerform = NO;
            alertString = @"Facility name is required";
        }
        else if ([self.txtPatientName.text isEqualToString:@""]){
            canPerform = NO;
            alertString = @"Patient name is required";
        }
        else if ([self.txtConsultType.text isEqualToString:@""]){
            canPerform = NO;
            alertString = @"Consult type is required";
        }
        else if ([self.txtRoomNumber.text isEqualToString:@""]){
            canPerform = NO;
            alertString = @"Room number is required";
        }
        else if ([self.dateButtonOutlet.titleLabel.text isEqualToString:@""] || [self.dateButtonOutlet.titleLabel.text isEqualToString:@"Select"]){
            canPerform = NO;
            alertString = @"DOB is required";
        }
        
        else if ([self.txtAge.text isEqualToString:@""]){
            canPerform = NO;
            alertString = @"Age is required";
        }
        
        
        if (canPerform) {
            //if(![roomNoPredicate evaluateWithObject:self.txtRoomNumber.text])
            if([self.txtRoomNumber.text rangeOfCharacterFromSet:[[NSCharacterSet decimalDigitCharacterSet]invertedSet]].location != NSNotFound)
            {
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Room number field" message:@"Should contain only numbers" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                return NO;
            }
            else{
                if([self.txtAge.text rangeOfCharacterFromSet:[[NSCharacterSet decimalDigitCharacterSet]invertedSet]].location != NSNotFound)
                {
                    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Age Field" message:@"Should contain only numbers" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    [alert show];
                    return NO;
                }
                return YES;
            }
        }
        else{
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Field empty" message:alertString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            return NO;
        }
    }
    else{
        return YES;
        
    }
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if(textField.tag == 4){
        p= self.scrollview
        .contentOffset;
        [_scrollview setContentOffset:CGPointMake(self.scrollview.contentOffset.x, 100)];
    }
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    if(textField.tag == 4){
        self.scrollview.contentOffset =p;
    }
}
- (IBAction)selectDateButtonAction:(UIButton *)sender {
    
    UIStoryboard *storyBoard=[UIStoryboard storyboardWithName:@"Main" bundle:Nil];
    _selectDateViewController=[storyBoard instantiateViewControllerWithIdentifier:@"datePicker"];
    _selectDateViewController.dataDelegate=self;
    _selectDateViewController.selectedString=@"Assignment";
    
    
    self.datePickerPopOver=[[UIPopoverController alloc]initWithContentViewController:_selectDateViewController];
    [self.datePickerPopOver setPopoverContentSize:CGSizeMake(300, 300)];
    
    _r = [sender frame];
    _tRect = [sender convertRect:sender.bounds toView:self.view];
    _tRect.origin.x=_r.origin.x;
    
    [self.datePickerPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];
    
}


-(void)getAssignmentDate:(NSDate *)date
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"dd-MM-yyyy"];
    
    [self.dateButtonOutlet setTitle:[dateFormat stringFromDate:date] forState:UIControlStateNormal];
    
    NSDate *currentdate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond;
    NSDateComponents *components = [calendar components:unitFlags fromDate:date toDate:currentdate options:0];
    
    NSInteger year  = [components year];
    NSLog(@"year %ld",(long)year);
    self.txtAge.text = [NSString stringWithFormat:@"%ld",(long)year];
    
}
@end
