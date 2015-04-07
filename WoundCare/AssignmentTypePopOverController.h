//
//  AssignmentTypePopOverController.h
//  WoundCare
//
//  Created by Sangeetha on 24/03/15.
//
//

#import <UIKit/UIKit.h>
#import "GetDataProtocol.h"

@interface AssignmentTypePopOverController : UIViewController
@property (nonatomic, strong)id<GetDataProtocol> delegate;
- (IBAction)btnCancelClicked:(id)sender;
- (IBAction)btnAddClicked:(id)sender;
@end
