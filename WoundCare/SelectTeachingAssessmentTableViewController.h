//
//  SelectTeachingAssessmentTableViewController.h
//  EducationView
//
//  Created by Antony on 23/03/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetDataProtocol.h"


@interface SelectTeachingAssessmentTableViewController : UITableViewController<UITableViewDelegate,UITableViewDataSource>



@property(nonatomic,weak)id<GetDataProtocol>dataDelegate;

@property(nonatomic,strong)NSMutableArray *itemsToBePassed;

@property(nonatomic,strong)NSArray *teachingAssessmentArray;
@property(nonatomic,strong)UIView *footerView;



@end
