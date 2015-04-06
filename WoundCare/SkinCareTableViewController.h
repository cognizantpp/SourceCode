//
//  SkinCareTableViewController.h
//  TreatmentApp
//
//  Created by Antony on 18/03/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetDataProtocol.h"
#import "CoreDataHelper.h"

@interface SkinCareTableViewController : UITableViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,weak)id<GetDataProtocol>dataDelegate;

@property(nonatomic,strong)NSMutableArray *itemsToBePassed;

@property(nonatomic,strong)NSArray *skinCareArray;
@property(nonatomic,strong)UIView *footerView;



@end
