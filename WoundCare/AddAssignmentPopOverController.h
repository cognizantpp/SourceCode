//
//  AddAssignmentPopOverController.h
//  WoundCare
//
//  Created by Sangeetha on 24/03/15.
//
//


#import <UIKit/UIKit.h>
#import "GetDataProtocol.h"
#import "NumberEntryViewController.h"
#import "SelectDatePickerViewController.h"


@interface AddAssignmentPopOverController : UIViewController<GetDataProtocol,UITextFieldDelegate,UIScrollViewDelegate>


- (IBAction)btnEntryNumberClicked:(id)sender;
- (IBAction)btnFacilityClicked:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *lblHiddenEntryNumber;
@property (strong, nonatomic) IBOutlet UIButton *btnEntryNumber;
@property (strong, nonatomic) IBOutlet UITextField *txtConsultType;
@property (strong, nonatomic) IBOutlet UITextField *txtRoomNumber;
@property (strong, nonatomic) IBOutlet UITextField *txtFacilityName;
@property (strong, nonatomic) IBOutlet UITextField *txtPatientName;
@property (strong, nonatomic) IBOutlet UITextField *txtDOB;
@property (strong, nonatomic) IBOutlet UITextField *txtAge;

@property (nonatomic, weak)id <GetDataProtocol> delegate;
@property (strong, nonatomic) NumberEntryViewController *numberEntryViewController;

@property (weak, nonatomic) IBOutlet UIButton *dateButtonOutlet;
- (IBAction)selectDateButtonAction:(UIButton *)sender;

@property(nonatomic,strong)SelectDatePickerViewController *selectDateViewController;


@end
