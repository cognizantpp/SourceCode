//
//  AssessmentViewController.h
//  WoundCare
//
//  Created by Uthra on 31/03/15.
//
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "ViewController.h"
#import "PainHomeViewController.h"
#import "EducationHomeViewController.h"
#import "RecommendationHomeViewController.h"
#import "TreatmentHomeViewController.h"
#import "PatientInfoViewController.h"
#import "ReviewOfSystemsHomeViewController.h"
#import "CoreDataHelper.h"
#import "PatientListTableViewController.h"
#import "OstomyViewController.h"
#import "WoundAssessmentTVController.h"
#import "GastrostomyViewController.h"
@class WoundImageViewController;
@class PictureViewController;

//UIView *assessmentGlobalView;
UIView *leftViewPanel;
UIView *topViewPanel;
PictureViewController *gblPictureViewController;



@interface AssessmentViewController : UIViewController<GetDataProtocol,UIActionSheetDelegate>
@property (strong, nonatomic) PatientInfoViewController *patientInfoViewController;
@property (strong, nonatomic) PatientListTableViewController *patientListTableViewController;
@property (strong, nonatomic) WoundAssessmentTVController *woundAssessmentTVController;
//@property (nonatomic)long buttonClicked;
@property (weak, nonatomic) IBOutlet UIView *initialview;
@property(weak,nonatomic)CoreDataHelper *btnclickobj;
@property (weak, nonatomic) IBOutlet UIButton *btnCurrentPatient;
@property (weak, nonatomic) IBOutlet UIView *leftView;
@property (weak, nonatomic) IBOutlet UIView *topView;
-(void)setButtonBackground;
-(void)getPictureViewData;
-(void)showCamera;
@end
