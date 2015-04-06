//
//  SelectLegTableViewController.h
//  PainView
//
//  Created by Antony on 31/03/14.
//  Copyright (c) 2014 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetDataProtocol.h"
#import "CoreDataHelper.h"

@interface SelectLegTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>


@property(nonatomic,assign)id<GetDataProtocol>dataDelegate;
@property(nonatomic,strong)NSArray *legArray;
@property(nonatomic,strong)NSArray *legScore;
@property(nonatomic,strong)NSString *selectedString;


@end
