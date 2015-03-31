//
//  AssignmentTypePopOverController.h
//  WoundCare
//
//  Created by Sangeetha on 24/03/15.
//
//

#import <UIKit/UIKit.h>
#import "DismissPopOver.h"

@interface AssignmentTypePopOverController : UIViewController
@property (nonatomic, strong)id<DismissPopOver> delegate;
- (IBAction)btnCancelClicked:(id)sender;
- (IBAction)btnAddClicked:(id)sender;
@end
