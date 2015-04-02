//
//  firsttableviewcontroller.h
//  pic1
//
//  Created by Sujitha on 27/03/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WouldyouliketomarkVC.h"
#import "selectDataProtocol.h"


@interface SelectWoundTypeTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSArray *items;
@property(nonatomic,weak)id<selectDataProtocol>dataDelegate;
@property(nonatomic,strong)NSString *itemsToBePassed;


@end
