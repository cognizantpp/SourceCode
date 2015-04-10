//
//  SelectFlaccPropertiesTableViewController.h
//  PainView
//
//  Created by Antony on 30/03/14.
//  Copyright (c) 2014 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetDataProtocol.h"
#import "CoreDataHelper.h"





@interface SelectFlaccPropertiesTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>



@property(nonatomic,assign)id<GetDataProtocol>dataDelegate;
@property(nonatomic,strong)NSArray *faceArray;
@property(nonatomic,strong)NSArray *faceScore;
@property(nonatomic,strong)NSArray *legArray;
@property(nonatomic,strong)NSArray *legScore;
@property(nonatomic,strong)NSArray *activityArray;
@property(nonatomic,strong)NSArray *activityScore;
@property(nonatomic,strong)NSArray *cryArray;
@property(nonatomic,strong)NSArray *cryScore;
@property(nonatomic,strong)NSArray *consolabilityArray;
@property(nonatomic,strong)NSArray *consolabilityScore;

@property(nonatomic,strong)NSString *selectedCategory;



@property(nonatomic,strong)NSString *selectedString;


@end
