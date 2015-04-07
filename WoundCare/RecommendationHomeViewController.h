//
//  RecommendationHomeViewController.h
//  RecommendationsView
//
//  Created by Antony on 24/03/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectMobilityTableViewController.h"
#import "SelectRecommendationActivityTableViewController.h"
#import "SensoryPerceptionTableViewController.h"
#import "MoistureTableViewController.h"
#import "FrictionTableViewController.h"
#import "TissueTableViewController.h"
#import "FollowUpTableViewController.h"
#import "SelectDatePickerViewController.h"
#import "RecommendationsNumberEntryViewController.h"
@interface RecommendationHomeViewController : UIViewController<GetDataProtocol,UIScrollViewDelegate,UITextFieldDelegate>

- (IBAction)selectButtonAction:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIButton *mobilityButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *activityButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *sensoryPerceptionButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *moistureButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *frictionButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *tissueperfusionButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *followUpButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *btnrecommendationNumberEntry;


@property (weak, nonatomic) IBOutlet UITextField *followUpOtherTextField;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;



@property (weak, nonatomic) IBOutlet UIButton *dateButtonOutlet;


- (IBAction)selectDateButtonAction:(UIButton *)sender;





@property(nonatomic,strong)SelectMobilityTableViewController *selectMobilityController;
@property(nonatomic,strong)SelectRecommendationActivityTableViewController *selectActivityController;
@property(nonatomic,strong)SensoryPerceptionTableViewController *sensoryViewController;
@property(nonatomic,strong)MoistureTableViewController *moistureViewController;
@property(nonatomic,strong)FrictionTableViewController *frictionViewController;
@property(nonatomic,strong)TissueTableViewController *tissueViewController;
@property(nonatomic,strong)FollowUpTableViewController *followUpController;
@property(nonatomic,strong)SelectDatePickerViewController *selectDateViewController;

@property (strong, nonatomic) RecommendationsNumberEntryViewController *recommendationsNumberEntryViewController;


@property(nonatomic)int followUpCount;

@end
