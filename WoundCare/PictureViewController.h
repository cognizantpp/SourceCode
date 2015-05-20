//
//  PictureViewController.h
//  samplecameraapp
//
//  Created by Sangeetha on 26/03/15.
//  Copyright (c) 2015 CTS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WoundIdPopupViewController.h"
#import "WoundViewHomeViewController.h"
#import "GetDataProtocol.h"
#import "AssessmentViewController.h"
//@class WouldyouliketousecameraVC;

@interface PictureViewController : UIViewController<UIGestureRecognizerDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate,GetDataProtocol,UITextFieldDelegate,UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *img1;
@property (strong, nonatomic) IBOutlet UIImageView *img2;
@property (strong, nonatomic) IBOutlet UIImageView *img3;
@property (strong, nonatomic) IBOutlet UIImageView *img4;
@property (strong, nonatomic) IBOutlet UIImageView *img5;
@property (strong, nonatomic) IBOutlet UIImageView *img6;
@property (strong, nonatomic) IBOutlet UIImageView *img7;

@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@property (weak, nonatomic) IBOutlet UIButton *btn4;
@property (weak, nonatomic) IBOutlet UIButton *btn5;
@property (weak, nonatomic) IBOutlet UIButton *btn6;
@property (weak, nonatomic) IBOutlet UIButton *btn7;

@property (weak, nonatomic) IBOutlet UIButton *chkbx1;
@property (weak, nonatomic) IBOutlet UIButton *chkbx2;
@property (weak, nonatomic) IBOutlet UIButton *chkbx3;
@property (weak, nonatomic) IBOutlet UIButton *chkbx4;
@property (weak, nonatomic) IBOutlet UIButton *chkbx5;
@property (weak, nonatomic) IBOutlet UIButton *chkbx6;
@property (weak, nonatomic) IBOutlet UIButton *chkbx7;

@property (weak, nonatomic) IBOutlet UITextField *txtField1;
@property (weak, nonatomic) IBOutlet UITextField *txtField2;
@property (weak, nonatomic) IBOutlet UITextField *txtField3;
@property (weak, nonatomic) IBOutlet UITextField *txtField4;
@property (weak, nonatomic) IBOutlet UITextField *txtField5;
@property (weak, nonatomic) IBOutlet UITextField *txtField6;
@property (weak, nonatomic) IBOutlet UITextField *txtField7;


@property (strong, nonatomic) WoundIdPopupViewController *woundIdPopupViewController;
- (IBAction)showWoundIds:(id)sender;
@property(nonatomic,strong)WoundViewHomeViewController *woundvc;
@property(nonatomic,strong)AssessmentViewController *assessvc;


@end
