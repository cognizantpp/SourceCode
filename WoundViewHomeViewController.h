//
//  WoundViewHomeViewController.h
//  WoundView
//
//  Created by Antony on 10/04/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "RadioPopUpViewController.h"
#import "MultipleSelectionTableViewController.h"
#import "SingleSelectionTableViewController.h"
#import "CoreDataHelper.h"
#import "SelectDatePickerViewController.h"

@interface WoundViewHomeViewController : UIViewController<GetDataProtocol,UIScrollViewDelegate,UITextFieldDelegate,UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *onsetButtonOutlet;


- (IBAction)radioButtonAction:(UIButton *)sender;


@property (weak, nonatomic) IBOutlet UIButton *noButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *yesButtonOutlet;
@property (weak, nonatomic) IBOutlet UITextField *newbornTextFieldOutlet;


@property (weak, nonatomic) IBOutlet UIButton *pediatricNoButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *pediatricYesButtonOutlet;
@property (weak, nonatomic) IBOutlet UITextField *pediatricTextFieldOutlet;

@property (weak, nonatomic) IBOutlet UIButton *phlebitisNoButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *phlebitisYesButtonOutlet;
@property (weak, nonatomic) IBOutlet UITextField *phlebitisTextFieldOutlet;


@property (weak, nonatomic) IBOutlet UIButton *ulcerNobuttonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *ulcerYesButtonOutlet;
@property (weak, nonatomic) IBOutlet UITextField *ulcerTextFieldOutlet;

@property (weak, nonatomic) IBOutlet UITextView *atypicalTextViewOutlet;


@property(nonatomic,strong)RadioPopUpViewController *radioViewController;
@property(nonatomic,strong)MultipleSelectionTableViewController *multipleSelectionViewController;
@property(nonatomic,strong)SingleSelectionTableViewController *singleSelectionViewController;
@property(nonatomic,strong)SelectDatePickerViewController *selectDateViewController;






- (IBAction)multipleSelectButtonAction:(UIButton *)sender;
- (IBAction)singleSelectButtonAction:(UIButton *)sender;


@property (weak, nonatomic) IBOutlet UIButton *otherButtonOutlet;

@property (weak, nonatomic) IBOutlet UIButton *woundThicknessButtonOutlet;

@property (weak, nonatomic) IBOutlet UIButton *woundBedColorButtonOutlet;

@property (weak, nonatomic) IBOutlet UIButton *woundBedButtonOutlet;

@property (weak, nonatomic) IBOutlet UIButton *exudateCharacterButtonOutlet;

@property (weak, nonatomic) IBOutlet UIButton *exudateOdorButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *exudateAmountButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *edemaButtonOutlet;

@property (weak, nonatomic) IBOutlet UIButton *conditionButtonOutlet;
@property (weak, nonatomic) IBOutlet UITextView *commentsTextViewOutlet;

@property (weak, nonatomic) IBOutlet UIButton *amountButtonOutlet;

@property (weak, nonatomic) IBOutlet UILabel *mlLabelOutlet;


@property (weak, nonatomic) IBOutlet UIButton *periWoundButtonOutlet;
@property (weak, nonatomic) IBOutlet UITextField *woundBedColorOtherTextField;
@property (weak, nonatomic) IBOutlet UITextField *woundBedOtherTextField;
@property (weak, nonatomic) IBOutlet UITextField *periwoundOtherTextField;
@property (weak, nonatomic) IBOutlet UITextField *exudateCharacterOtherTextField;

@property (weak, nonatomic) IBOutlet UITextField *OtherWoundsTextField;
@property (weak, nonatomic) IBOutlet UITextField *exudateOdorOtherTextField;
@property (weak, nonatomic) IBOutlet UIButton *underminingCmButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *underminingMmButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *tunnelingCmbuttonOutlet;

@property (weak, nonatomic) IBOutlet UIButton *tunnelingMmButtonOutlet;

@property (weak, nonatomic) IBOutlet UIButton *otherWoundsButtonOutlet;




@property(nonatomic)int woundBedColorCount;
@property(nonatomic)int woundBedCount;
@property(nonatomic)int periWoundCount;
@property(nonatomic)int exudateCharacterCount;
@property(nonatomic)int exudateOdorCount;
@property(nonatomic)int exudateAmountCount;

@end
