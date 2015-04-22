//
//  MultipleSelectionTableViewController.h
//  WoundView
//
//  Created by Antony on 17/04/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetDataProtocol.h"

@interface MultipleSelectionTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>



@property(nonatomic,assign)id<GetDataProtocol>dataDelegate;

@property(nonatomic,strong)NSMutableArray *itemsToBePassed;



@property(nonatomic,strong)UIView *footerView;
@property(nonatomic,strong)NSMutableArray *array;
@property(nonatomic,strong)NSMutableArray *selectedArray;

@property(nonatomic,strong)NSString *selectedString;

@end
