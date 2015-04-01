//
//  selectMethodTableViewController.h
//  PainView
//
//  Created by Antony on 27/03/14.
//  Copyright (c) 2014 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetDataProtocol.h"

@interface selectMethodTableViewController : UITableViewController<UITableViewDelegate,UITableViewDataSource>




@property(nonatomic,assign)id<GetDataProtocol>dataDelegate;

@property(nonatomic,strong)NSArray *methodArray;
@property(nonatomic,strong)NSString *selectedString;
@end
