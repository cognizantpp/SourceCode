//
//  WoundAssessmentTVController.h
//  WoundCare
//
//  Created by keerthana on 27/04/15.
//
//

#import <UIKit/UIKit.h>
#import "CoreDataHelper.h"
@interface WoundAssessmentTVController : UITableViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSMutableArray *selectedArray;

@end
