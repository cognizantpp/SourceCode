//
//  ReviewOfSystemsHomeViewController.h
//  ReviewOfSystemsView
//
//  Created by Antony on 01/04/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectReviewOfSystemsTableViewController.h"

#import "ReviewAssessmentTableViewController.h"

@interface ReviewOfSystemsHomeViewController : UIViewController<UIScrollViewDelegate,GetDataProtocol>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

- (IBAction)selectButtonAction:(UIButton *)sender;

- (IBAction)SelectCategoryAction:(UIButton *)sender;



@property (weak, nonatomic) IBOutlet UIButton *riskFactorButtonOutlet;

@property (weak, nonatomic) IBOutlet UIButton *consultButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *testsButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *mobilityButtonOutlet;

@property (weak, nonatomic) IBOutlet UIButton *activityButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *sensoryPerceptionButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *moistureButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *frictionAndShearButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *nutritionButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *tissuePerfusionOutlet;

@property (weak, nonatomic) IBOutlet UITextField *mobilityAssessmentOutlet;

@property (weak, nonatomic) IBOutlet UITextField *activityAssessmentOutlet;
@property (weak, nonatomic) IBOutlet UITextField *sensoryPerceptionAssessmentOutlet;
@property (weak, nonatomic) IBOutlet UITextField *moistureAsessmentOutlet;
@property (weak, nonatomic) IBOutlet UITextField *frictionAssessmentOutlet;
@property (weak, nonatomic) IBOutlet UITextField *nutritionAssessmentOutlet;

@property (weak, nonatomic) IBOutlet UITextField *tissueAssessmentOutlet;

@property (weak, nonatomic) IBOutlet UITextField *mobilityScore;
@property (weak, nonatomic) IBOutlet UITextField *activityScore;
@property (weak, nonatomic) IBOutlet UITextField *sensoryPerceptionScore;
@property (weak, nonatomic) IBOutlet UITextField *moistureScore;
@property (weak, nonatomic) IBOutlet UITextField *frictionScore;
@property (weak, nonatomic) IBOutlet UITextField *nutritionScore;
@property (weak, nonatomic) IBOutlet UITextField *tissueScore;

@property (weak, nonatomic) IBOutlet UITextField *totalScoreTextField;


@property (weak, nonatomic) IBOutlet UITextField *riskFactorOtherTextField;
@property (weak, nonatomic) IBOutlet UITextField *consultOtherTextField;
@property (weak, nonatomic) IBOutlet UITextField *testsOtherTextField;




@property(nonatomic,strong)SelectReviewOfSystemsTableViewController *selectReviewViewController;

@property(nonatomic,strong)ReviewAssessmentTableViewController *rosViewController;







@property(nonatomic)int riskFactorCount;
@property(nonatomic)int consultCount;
@property(nonatomic)int testsCount;
    //@property(nonatomic)NSInteger PainScore;

@end
