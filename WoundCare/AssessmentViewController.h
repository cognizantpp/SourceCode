//
//  AssessmentViewController.h
//  WoundCare
//
//  Created by Uthra on 31/03/15.
//
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "PainHomeViewController.h"
#import "EducationHomeViewController.h"
#import "RecommendationHomeViewController.h"
#import "TreatmentHomeViewController.h"
#import "WoundImageViewController.h"
#import "PatientInfoViewController.h"
#import "ReviewOfSystemsHomeViewController.h"
#import "CoreDataHelper.h"
@interface AssessmentViewController : UIViewController<GetDataProtocol>
@property (strong, nonatomic) PatientInfoViewController *patientInfoViewController;

@end
