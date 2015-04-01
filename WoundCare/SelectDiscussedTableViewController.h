//
//  SelectDiscussedTableViewController.h
//  EducationView
//
//  Created by Antony on 20/03/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetDataProtocol.h"

@interface SelectDiscussedTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,weak)id<GetDataProtocol>dataDelegate;

@property(nonatomic,strong)NSMutableArray *itemsToBePassed;

@property(nonatomic,strong)NSArray *discussedArray;
@property(nonatomic,strong)UIView *footerView;

@end
