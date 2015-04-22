//
//  PatientListCell.h
//  WoundCare
//
//  Created by Sangeetha on 22/04/15.
//
//

#import <UIKit/UIKit.h>

@interface PatientListCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *lblRoomNo;
@property (strong, nonatomic) IBOutlet UIImageView *imgStatus;

@property (strong, nonatomic) IBOutlet UILabel *lblEntryNo;
@property (strong, nonatomic) IBOutlet UILabel *lblPatientName;
@end
