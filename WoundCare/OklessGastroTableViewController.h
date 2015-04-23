//
//  OklessGastroTableViewController.h
//  GastrostomyVC
//
//  Created by Sujitha on 09/04/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetDataProtocol.h"

@interface OklessGastroTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,assign)id<GetDataProtocol>dataDelegate;



@property(nonatomic,strong)NSArray *selectedArray;
@property(nonatomic,strong)NSString *selectedString;
@property(nonatomic,strong)NSString *selectedCategory;


@property(nonatomic,strong)NSMutableArray *ExudateOdorArray;
@property(nonatomic,strong)NSMutableArray *ExudateAmountArray;
@property(nonatomic,strong)NSMutableArray *GranulationTissueArray;
@property(nonatomic,strong)NSMutableArray *EdemaArray;
@property(nonatomic,strong)NSMutableArray *ConditionArray;
@property(nonatomic,strong)NSMutableArray *CommentsArray;



@end
