//
//  SelectOnsetDate.m
//  Ostomy
//
//  Created by keerthana on 17/04/15.
//  Copyright (c) 2015 keerthana. All rights reserved.
//

#import "SelectOnsetDate.h"

@interface SelectOnsetDate ()

@end

@implementation SelectOnsetDate
{
        NSDate *date1;
        NSDateFormatter *dateFormat;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
        
}

- (IBAction)doneButtonAction:(UIBarButtonItem *)sender {
    
    [self.dataDelegate getOnsetDate:[dateFormat stringFromDate:date1]];
    
    [self dismissViewControllerAnimated:YES completion:Nil];
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

@end
