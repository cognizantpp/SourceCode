//
//  SelectOstomySiteTVController.h
//  Ostomy
//
//  Created by keerthana on 07/04/15.
//  Copyright (c) 2015 keerthana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetDataProtocol.h"

@interface SelectOstomySiteTVController : UITableViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,weak)id<GetDataProtocol>dataDelegate;

@property(nonatomic,strong)NSMutableArray *itemsToBePassed;

@property(nonatomic,strong)NSArray *selectedArray;
 @property(nonatomic,strong)NSString *selectedString;
@property(nonatomic,strong)UIView *footerView;
@property(nonatomic,strong)NSMutableArray *array;
@end
