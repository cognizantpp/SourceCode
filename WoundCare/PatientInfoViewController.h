//
//  PatientInfoViewController.h
//  WoundCare
//
//  Created by Sangeetha on 07/04/15.
//
//

#import <UIKit/UIKit.h>
#import "GetDataProtocol.h"
#import "AssignmentsViewController.h"
@interface PatientInfoViewController : UIViewController<UIPopoverControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblAge;
@property (weak, nonatomic) IBOutlet UILabel *lblMMI;
@property (weak, nonatomic) IBOutlet UILabel *lblRoomNo;
@property (weak, nonatomic) IBOutlet UILabel *lblAdmitMd;
@property (weak, nonatomic) IBOutlet UILabel *lblSex;
@property (weak, nonatomic) IBOutlet UILabel *lblDOB;
@property (weak, nonatomic) IBOutlet UILabel *lblENC;
@property (weak, nonatomic) IBOutlet UILabel *lblAdmitDt;
@property (weak, nonatomic) IBOutlet UILabel *lblMRN;
@property (nonatomic, strong)id<GetDataProtocol> delegate;
@property (weak, nonatomic) AssignmentsViewController *assignmentsViewController;
@end
