//
//  SelectDatePickerViewController.m
//  WoundCare
//
//  Created by Antony on 06/04/15.
//tt
//

#import "SelectDatePickerViewController.h"

@implementation SelectDatePickerViewController
{
    NSDate *date1;
    NSDateFormatter *dateFormat;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.datePicker addTarget:self action:@selector(datePickerChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self.datePicker setMinimumDate: [NSDate date]];
    _datePicker.backgroundColor=[UIColor clearColor];


    


}
- (void)datePickerChanged:(UIDatePicker *)datePicker
{
   date1 = self.datePicker.date;
    
    dateFormat = [[NSDateFormatter alloc] init];
    
    [dateFormat setDateFormat:@"dd-MM-yyyy"];
    NSLog(@"%@",[dateFormat stringFromDate:date1]);
    
        //   [self.selectDateButtonOutlet setTitle:[dateFormat stringFromDate:date1] forState:UIControlStateNormal]  ;
    
    
    
    
}

- (IBAction)doneButtonAction:(UIBarButtonItem *)sender {
    
    [self.dataDelegate getDate:[dateFormat stringFromDate:date1]];
    
    [self dismissViewControllerAnimated:YES completion:Nil];
}
@end
