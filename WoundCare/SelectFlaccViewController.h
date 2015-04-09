//
//  SelectFlaccViewController.h
//  PainView
//
//  Created by Antony on 30/03/14.
//  Copyright (c) 2014 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetDataProtocol.h"
#import "SelectFlaccPropertiesTableViewController.h"




@interface SelectFlaccViewController : UIViewController<GetDataProtocol>




@property(nonatomic,assign)id<GetDataProtocol>dataDelegate;

@property(nonatomic,assign)CGRect btnFrame;
- (IBAction)selectButtonAction:(UIButton *)sender;

- (IBAction)OkButtonAction:(UIButton *)sender;


@property (weak, nonatomic) IBOutlet UIButton *faceButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *legButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *activityButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *cryButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *consolabilityButtonOutlet;




@property(nonatomic,strong)SelectFlaccPropertiesTableViewController *selectFlaccPropertiesViewController;


@end
