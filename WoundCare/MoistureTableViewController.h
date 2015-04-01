//
//  MoistureTableViewController.h
//  RecommendationsView
//
//  Created by Antony on 24/03/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetDataProtocol.h"
@interface MoistureTableViewController : UITableViewController<UITableViewDelegate,UITableViewDataSource>


@property(nonatomic,assign)id<GetDataProtocol>dataDelegate;

@property(nonatomic,strong)NSMutableArray *itemsToBePassed;

@property(nonatomic,strong)NSArray *moistureArray;
@property(nonatomic,strong)UIView *footerView;

@end
