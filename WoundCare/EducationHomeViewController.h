//
//  EducationHomeViewController.h
//  EducationView
//
//  Created by Antony on 20/03/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectEducationTableViewController.h"
#import "AssignmentsViewController.h"
#import "EducationNumberEntryViewController.h"
#import "CoreDataHelper.h"


@interface EducationHomeViewController : UIViewController<GetDataProtocol,UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIButton *discussedButtonOutlet;

@property (weak, nonatomic) IBOutlet UIButton *methodUsedOutlet;
@property (weak, nonatomic) IBOutlet UIButton *handoutOutlet;
@property (weak, nonatomic) IBOutlet UIButton *personTaughtOutlet;

@property (weak, nonatomic) IBOutlet UIButton *teachingAssessmentOutlet;
@property (weak, nonatomic) IBOutlet UIButton *minButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *hrButtonOutlet;
- (IBAction)radioButtonAction:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UITextField *otherTextField;



@property (weak, nonatomic) IBOutlet UIButton *comprehensionOutlet;
@property (weak, nonatomic) IBOutlet UITextField *discussedOtherTextField;
@property (weak, nonatomic) IBOutlet UITextField *handOutOtherTextField;
@property (weak, nonatomic) IBOutlet UITextField *personTaughtOtherTextField;
@property (weak, nonatomic) IBOutlet UITextField *methodUsedOtherTextField;

@property (weak, nonatomic) IBOutlet UITextField *teachingAssessmentOtherTextField;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;



- (IBAction)selectButtonAction:(UIButton *)sender;



@property(nonatomic,strong)SelectEduactionTableViewController *selectEducationViewController;
@property (strong, nonatomic) EducationNumberEntryViewController *educationNumberEntryViewController;



@property(nonatomic)int discussedCount;
@property(nonatomic)int methodUsedCount;
@property(nonatomic)int handOutCount;
@property(nonatomic)int personTaughtCount;
@property(nonatomic)int teachingAssessmentCount;

@property (weak, nonatomic) IBOutlet UIButton *btnEducationNumber;



@end
