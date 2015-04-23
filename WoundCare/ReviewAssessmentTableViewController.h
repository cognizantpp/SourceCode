//
//  ReviewAssessmentTableViewController.h
//  ReviewOfSystemsView
//
//  Created by Antony on 07/04/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetDataProtocol.h"
#import "CoreDataHelper.h"
#import "AssignmentsViewController.h"

@interface ReviewAssessmentTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,assign)id<GetDataProtocol>dataDelegate;
@property(nonatomic,strong)NSArray *mobilityArray;
@property(nonatomic,strong)NSArray *activityArray;
@property(nonatomic,strong)NSArray *sensoryArray;
@property(nonatomic,strong)NSArray *moistureArray;
@property(nonatomic,strong)NSArray *frictionArray;
@property(nonatomic,strong)NSArray *nutritionArray;
@property(nonatomic,strong)NSArray *tissueArray;

@property(nonatomic,strong)NSArray *selectedArray;



@property(nonatomic,strong)NSArray *ScoreArray;
@property(nonatomic,strong)NSString *selectedString;
@property(nonatomic,strong)NSString *selectedCategory;


@end
