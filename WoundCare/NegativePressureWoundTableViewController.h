//
//  NegativePressureWoundTableViewController.h
//  TreatmentApp
//
//  Created by Antony on 18/03/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetDataProtocol.h"

@interface NegativePressureWoundTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,weak)id<GetDataProtocol>dataDelegate;

@property(nonatomic,strong)NSMutableArray *itemsToBePassed;

@property(nonatomic,strong)NSArray *negativePressureWoundArray;
@property(nonatomic,strong)UIView *footerView;


@end
