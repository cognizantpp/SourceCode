//
//  ConsolabilityTableViewController.h
//  PainView
//
//  Created by Antony on 31/03/14.
//  Copyright (c) 2014 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetDataProtocol.h"

@interface ConsolabilityTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>




@property(nonatomic,assign)id<GetDataProtocol>dataDelegate;
@property(nonatomic,strong)NSArray *consolabilityArray;
@property(nonatomic,strong)NSArray *consolabilityScore;
@property(nonatomic,strong)NSString *selectedString;


@end
