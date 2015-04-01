//
//  SelectCharacterTableViewController.h
//  PainView
//
//  Created by Antony on 27/03/14.
//  Copyright (c) 2014 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetDataProtocol.h"

@interface SelectCharacterTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>


@property(nonatomic,assign)id<GetDataProtocol>dataDelegate;

@property(nonatomic,strong)NSMutableArray *itemsToBePassed;

@property(nonatomic,strong)NSArray *characterArray;
@property(nonatomic,strong)UIView *footerView;



@end
