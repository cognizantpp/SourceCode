//
//  StomaLocationTVController.h
//  Ostomy
//
//  Created by keerthana on 08/04/15.
//  Copyright (c) 2015 keerthana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetDataProtocol.h"
#import "CoreDataHelper.h"
//#import "OstomyViewController.h"

@interface StomaLocationTVController : UITableViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,weak)id<GetDataProtocol>dataDelegate;


@property(nonatomic,strong)NSArray *selectedArray;


@property(nonatomic,strong)NSArray *stomaLocationArray;
@property(nonatomic,strong)NSArray *stomaColorArray;
@property(nonatomic,strong)NSArray *stomaOutputColorArray;

@property(nonatomic,strong)NSArray *fistulaLocationArray;
@property(nonatomic,strong)NSArray *fistulaColorArray;

@property(nonatomic,strong)NSArray *exudateOdourArray;
@property(nonatomic,strong)NSArray *exudateAmountArray;
@property(nonatomic,strong)NSArray *granulationTissueArray;
@property(nonatomic,strong)NSArray *edemaArray;
@property(nonatomic,strong)NSArray *peristomalSkinConditionArray;


@property(nonatomic,strong)NSString *selectedString;
@property(nonatomic,strong)NSString *selectedCategory;

@end
