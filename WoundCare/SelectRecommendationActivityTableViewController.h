//
//  SelectRecommendationActivityTableViewController.h
//  WoundCare
//
//  Created by Sangeetha on 01/04/15.
//
//

#import <UIKit/UIKit.h>
#import"GetDataProtocol.h"
#import "CoreDataHelper.h"

@interface SelectRecommendationActivityTableViewController : UITableViewController<UITableViewDataSource, UITableViewDelegate>
@property(nonatomic,assign)id<GetDataProtocol>dataDelegate;

@property(nonatomic,strong)NSMutableArray *itemsToBePassed;

@property(nonatomic,strong)NSArray *activityArray;
@property(nonatomic,strong)UIView *footerView;
@end
