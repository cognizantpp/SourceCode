//
//  FollowUpTableViewController.h
//  RecommendationsView
//
//  Created by Antony on 25/03/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetDataProtocol.h"

@interface FollowUpTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,assign)id<GetDataProtocol>dataDelegate;

@property(nonatomic,strong)NSString *selectedString;

@property(nonatomic,strong)NSArray *followUpArray;


    //@property(nonatomic,strong)UIView *footerView;
@end
