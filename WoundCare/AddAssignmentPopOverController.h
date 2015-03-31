//
//  AddAssignmentPopOverController.h
//  WoundCare
//
//  Created by Sangeetha on 24/03/15.
//
//


#import <UIKit/UIKit.h>
#import "DismissPopOver.h"
#import "NumberEntryViewController.h"


@interface AddAssignmentPopOverController : UIViewController<DismissPopOver,UITextFieldDelegate>


- (IBAction)btnOKClicked:(id)sender;
- (IBAction)btnEntryNumberClicked:(id)sender;
- (IBAction)btnFacilityClicked:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *lblHiddenEntryNumber;
@property (strong, nonatomic) IBOutlet UIButton *btnEntryNumber;
@property (strong, nonatomic) IBOutlet UITextField *txtConsultType;
@property (strong, nonatomic) IBOutlet UITextField *txtRoomNumber;
@property (strong, nonatomic) IBOutlet UITextField *txtFacilityName;
@property (strong, nonatomic) IBOutlet UITextField *txtPatientName;

@property (nonatomic, weak)id <DismissPopOver> delegate;
@property (strong, nonatomic) NumberEntryViewController *numberEntryViewController;
@end
