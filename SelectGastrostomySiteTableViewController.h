//
//  SelectGastrostomySiteTableViewController.h
//  GastrostomyVC
//
//  Created by Sujitha on 08/04/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetDataProtocol.h"

@interface SelectGastrostomySiteTableViewController : UITableViewController<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,weak)id<GetDataProtocol>dataDelegate;

@property(nonatomic,strong)NSMutableArray *itemsToBePassed;

//@property(nonatomic,strong)NSArray *GastroSiteArray;
@property(nonatomic,strong)UIView *footerView;
@property(nonatomic,strong)NSMutableArray *array;
@property(nonatomic,strong)NSMutableArray *selectedArray;

@property(nonatomic,strong)NSString *selectedString;
@end
