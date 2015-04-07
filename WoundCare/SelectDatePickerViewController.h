//
//  SelectDatePickerViewController.h
//  WoundCare
//
//  Created by Antony on 06/04/15.
//
//tt

#import <UIKit/UIKit.h>
#import "GetDataProtocol.h"

@interface SelectDatePickerViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
- (IBAction)doneButtonAction:(UIBarButtonItem *)sender;

@property (weak, nonatomic) IBOutlet id toolBarOutlet;



@property(nonatomic,assign)id<GetDataProtocol>dataDelegate;


@end
