//
//  SelectComprehensionTableViewController.h
//  EducationView
//
//  Created by Antony on 23/03/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetDataProtocol.h"
#import "CoreDataHelper.h"

@interface SelectComprehensionTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>


@property(nonatomic,weak)id<GetDataProtocol>dataDelegate;

@property(nonatomic,strong)NSMutableArray *itemsToBePassed;

@property(nonatomic,strong)NSArray *comprehensionArray;
@property(nonatomic,strong)UIView *footerView;


@end
