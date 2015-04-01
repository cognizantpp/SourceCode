//
//  SelectFlaccViewController.h
//  PainView
//
//  Created by Antony on 30/03/14.
//  Copyright (c) 2014 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetDataProtocol.h"
#import "SelectFaceTableViewController.h"
#import "SelectLegTableViewController.h"
#import "SelectActivityTableViewController.h"
#import "SelectCryTableViewController.h"
#import "ConsolabilityTableViewController.h"


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




@property(nonatomic,strong)SelectFaceTableViewController *selectFaceViewController;
@property(nonatomic,strong)SelectLegTableViewController *selectLegViewController;
@property(nonatomic,strong)SelectActivityTableViewController *selectActivityViewController;
@property(nonatomic,strong)SelectCryTableViewController *selectCryViewController;
@property(nonatomic,strong)ConsolabilityTableViewController *consolabilityViewController;
@property(nonatomic)NSInteger PainScore;

@end
