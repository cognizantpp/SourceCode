//
//  SelectFaceTableViewController.h
//  PainView
//
//  Created by Antony on 30/03/14.
//  Copyright (c) 2014 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetDataProtocol.h"





@interface SelectFaceTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>



@property(nonatomic,assign)id<GetDataProtocol>dataDelegate;
@property(nonatomic,strong)NSArray *faceArray;
@property(nonatomic,strong)NSArray *faceScore;
@property(nonatomic,strong)NSString *selectedString;


@end
