//
//  SelectCryTableViewController.h
//  PainView
//
//  Created by Antony on 31/03/14.
//  Copyright (c) 2014 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetDataProtocol.h"
#import "CoreDataHelper.h"

@interface SelectCryTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>




@property(nonatomic,assign)id<GetDataProtocol>dataDelegate;
@property(nonatomic,strong)NSArray *cryArray;
@property(nonatomic,strong)NSArray *cryScore;
@property(nonatomic,strong)NSString *selectedString;


@end
