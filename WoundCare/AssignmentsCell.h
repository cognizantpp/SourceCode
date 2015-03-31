//
//  AssignmentsCell.h
//  WoundCare
//
//  Created by Sangeetha on 23/03/15.
//
//

#import <UIKit/UIKit.h>

@interface AssignmentsCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *lblRoomNo;
@property (strong, nonatomic) IBOutlet UILabel *lblConsult;
@property (strong, nonatomic) IBOutlet UIImageView *imgStatus;

@property (strong, nonatomic) IBOutlet UILabel *lblEntryNo;
@property (strong, nonatomic) IBOutlet UILabel *lblPatientName;
@end
