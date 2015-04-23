//
//  SingleSelectionTableViewController.h
//  WoundView
//
//  Created by Antony on 17/04/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetDataProtocol.h"
#import "CoreDataHelper.h"

@interface SingleSelectionTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,assign)id<GetDataProtocol>dataDelegate;
@property(nonatomic,strong)NSArray *woundThicknessArray;

@property(nonatomic,strong)NSArray *exudateOdor;
@property(nonatomic,strong)NSArray * exudateAmount;
@property(nonatomic,strong)NSArray * edema;
@property(nonatomic,strong)NSArray * conditionArray;
@property(nonatomic,strong)NSArray * otherWoundsArray;

@property(nonatomic,strong)NSString *selectedCategory;
@end
