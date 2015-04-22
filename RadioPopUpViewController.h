//
//  RadioPopUpViewController.h
//  WoundView
//
//  Created by Antony on 16/04/13.
//  Copyright (c) 2013 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import"RadioPopUpCell.h"
#import "GetDataProtocol.h"

@interface RadioPopUpViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSArray *indexArray;
@property(nonatomic,strong)NSArray *ulcerIndexArray;

@property(nonatomic,strong)NSArray *newbornSymptomArray;
@property(nonatomic,strong)NSArray *pediatricSymptomArray;
@property(nonatomic,strong)NSArray *phlebitisSymptomArray;
@property(nonatomic,strong)NSArray *ulcerSymptomArray;

@property(nonatomic,strong)UIView *headerView;
@property(nonatomic,strong)NSString *selectedString;




@property(nonatomic,assign)id<GetDataProtocol>dataDelegate;


@end
