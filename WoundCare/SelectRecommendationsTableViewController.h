//
//
//  RecommendationsView
//
//  Created by Antony on 24/03/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetDataProtocol.h"
#import "CoreDataHelper.h"

@interface SelectRecommendationsTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>



@property(nonatomic,assign)id<GetDataProtocol>dataDelegate;

@property(nonatomic,strong)NSMutableArray *itemsToBePassed;
@property(nonatomic,strong)UIView *footerView;

@property(nonatomic,strong)NSMutableArray *array;

@property(nonatomic,strong)NSMutableArray *selectedArray;

@property(nonatomic,strong)NSString *selectedString;




@end
