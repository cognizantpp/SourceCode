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
@interface PictureViewController : UIViewController<UIGestureRecognizerDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate,GetDataProtocol,UITextFieldDelegate,UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *img1;
@property (strong, nonatomic) IBOutlet UIImageView *img2;
@property (strong, nonatomic) IBOutlet UIImageView *img3;
@property (strong, nonatomic) IBOutlet UIImageView *img4;
@property (strong, nonatomic) IBOutlet UIImageView *img5;
@property (strong, nonatomic) IBOutlet UIImageView *img6;
@property (strong, nonatomic) IBOutlet UIImageView *img7;
@property (strong, nonatomic) WoundIdPopupViewController *woundIdPopupViewController;
- (IBAction)showWoundIds:(id)sender;
@property(nonatomic,strong)WoundViewHomeViewController *woundvc;
@property(nonatomic,strong)AssessmentViewController *assessvc;


@end
