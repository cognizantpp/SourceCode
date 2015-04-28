//
//  WoundAssessmentTVController.h
//  WoundCare
//
//  Created by keerthana on 27/04/15.
//
//

#import <UIKit/UIKit.h>
#import "CoreDataHelper.h"
#import "OstomyViewController.h"
#import "GastrostomyViewController.h"
#import "WoundViewHomeViewController.h"

@interface WoundAssessmentTVController : UITableViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)GastrostomyViewController *GVC1;
@property(nonatomic,strong)OstomyViewController *OVC1;
@property(nonatomic,strong)WoundViewHomeViewController *WVC1;

@end
