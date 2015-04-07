//
//  ViewController.h
//  TreatmentApp
//
//  Created by Antony on 16/03/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectCleansingTableViewController.h"
#import "selectDressingTableViewController.h"
#import "NegativePressureWoundTableViewController.h"
#import "SkinCareTableViewController.h"

@interface TreatmentHomeViewController : UIViewController<GetDataProtocol,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIButton *cleansingButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *dressingButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *negativePressureWoundButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *skinCareButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *noButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *yesButtonOutlet;


@property (strong, nonatomic) IBOutlet UITextField *otherTextField;


- (IBAction)SelectButtonAction:(UIButton *)sender;

- (IBAction)radioButtonAction:(UIButton *)sender;



@property (weak, nonatomic) IBOutlet UITextField *CleansingOtherTextField;
@property (weak, nonatomic) IBOutlet UITextField *dressingOtherTextField;



@property(nonatomic,strong)SelectCleansingTableViewController *selectCleansingViewController;

@property(nonatomic,strong)selectDressingTableViewController *selectDressingViewController;
@property(nonatomic,strong)NegativePressureWoundTableViewController *negativePressureWoundController;
@property(nonatomic,strong)SkinCareTableViewController *skinCareViewController;



@property(nonatomic)int dressingCount;
@property(nonatomic)int cleansingCount;

@end

