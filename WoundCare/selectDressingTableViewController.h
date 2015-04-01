//
//  selectDressingTableViewController.h
//  TreatmentApp
//
//  Created by Antony on 17/03/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetDataProtocol.h"

@interface selectDressingTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,weak)id<GetDataProtocol>dataDelegate;

@property(nonatomic,strong)NSMutableArray *itemsToBePassed;

@property(nonatomic,strong)NSArray *dressingArray;
@property(nonatomic,strong)UIView *footerView;



@end
