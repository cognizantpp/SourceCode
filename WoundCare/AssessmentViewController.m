//
//  AssessmentViewController.m
//  woundcare1
//
//  Created by Uthra on 25/03/15.
//  Copyright (c) 2015 CTS. All rights reserved.


#import "AssessmentViewController.h"
#import "PictureViewController.h"
#import "WoundImageViewController.h"

@interface AssessmentViewController (){
    
    UIStoryboard *storybrd;
}
- (IBAction)buttonClciked:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *baseView;
@property (weak, nonatomic) IBOutlet UIButton *pain;
@property (weak, nonatomic) IBOutlet UIButton *review;
@property (weak, nonatomic) IBOutlet UIButton *education;
@property (weak, nonatomic) IBOutlet UIButton *treatment;
@property (weak, nonatomic) IBOutlet UIButton *recommendation;
@property (weak, nonatomic) IBOutlet UIButton *human;
@property (weak, nonatomic) IBOutlet UIButton *delete;
@property (weak, nonatomic) IBOutlet UIButton *gallery;
@property (weak, nonatomic) IBOutlet UIButton *logout;
@property (strong, nonatomic) UIPopoverController *popOver;
@property (strong, nonatomic) UIPopoverController *patientListPopOver;
- (IBAction)btnPatientInfoClicked:(id)sender;
- (IBAction)showPatientListPopup:(UIButton *)sender;



@end
NSString *timespentother;
NSString *unit;
@implementation AssessmentViewController
PainHomeViewController *painController;
EducationHomeViewController *educationHomeviewcontroller;

TreatmentHomeViewController *treatmentHomeViewController;
RecommendationHomeViewController *recommendationHomeViewController;
ReviewOfSystemsHomeViewController *reviewOfSystemsHomeViewController;

- (void)viewDidLoad {
    [super viewDidLoad];
   _btnclickobj=[CoreDataHelper sharedInstance];
    
   
    
   
    NSString *pName = [[[[[[[patientsDetails valueForKey:@"patient_name"]objectAtIndex:selectedPatientIndex] stringByAppendingString:@", DOB : "] stringByAppendingString:[[patientsDetails valueForKey:@"dob"]objectAtIndex:selectedPatientIndex] ] stringByAppendingString:@" ("] stringByAppendingString:[[patientsDetails valueForKey:@"age" ]objectAtIndex:selectedPatientIndex]] stringByAppendingString:@" Y)"];
    [self.btnCurrentPatient setTitle:pName forState:UIControlStateNormal];
    NSLog(@"button clicked value %ld",_btnclickobj.buttonClicked);
   
    if(_btnclickobj.buttonClicked != 7){
        _btnclickobj.buttonClicked=6;
        [self.human setImage:[UIImage imageNamed:@"homanhover2013.png"] forState:UIControlStateNormal];
    }
    else{
        //[ setImage:[UIImage imageNamed:@"imggalleryhover2013.png"] forState:UIControlStateNormal];
        [self setButtonBackground];
        PictureViewController *picVw=[self.storyboard instantiateViewControllerWithIdentifier:@"PictureViewController"];
        [self.initialview addSubview:picVw.view];
        [self addChildViewController:picVw];
        self.delete.alpha=0;
    }
    assessmentGlobalView = self.initialview;
    assessmentglobalviewcontroller=self;
}

-(void)viewDidAppear:(BOOL)animated{
    if(_btnclickobj.buttonClicked != 7){
        WoundImageViewController *tvc=[self.storyboard instantiateViewControllerWithIdentifier:@"WoundImageViewController"];
        [self.initialview addSubview:tvc.view];
        [self addChildViewController:tvc];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setButtonBackground{
    
    switch (_btnclickobj.buttonClicked) {
            
        case 1:
        {
            [self.pain setBackgroundImage:[UIImage imageNamed:@"icon_pain.png"] forState:UIControlStateNormal];
            CoreDataHelper *cdh=[CoreDataHelper sharedInstance];
            NSString *charselected_value=[NSString stringWithFormat:@"%@",painController.characterButtonOutlet.titleLabel.text];
            NSLog(@"charbutton:........ %@",painController.characterButtonOutlet.titleLabel.text);
            NSString *scoreselected_value=[NSString stringWithFormat:@"%@",painController.scoreButtonOutlet.titleLabel.text];
            [CoreDataHelper sharedInstance].painselected_value=[NSArray arrayWithObjects:charselected_value,scoreselected_value,nil];

            NSLog(@"_assignmentsViewController.entry_no   %@",entry_no );
            [cdh savePain:entry_no];
            break;
        }
        case 2:
        {
        
            [self.review setBackgroundImage:[UIImage imageNamed:@"icon_risk.png"] forState:UIControlStateNormal];
             CoreDataHelper *cdh=[CoreDataHelper sharedInstance];
            NSString *riskselected_value=[NSString stringWithFormat:@"%@",reviewOfSystemsHomeViewController.riskFactorButtonOutlet.titleLabel.text];
            NSString *consultselected_value=[NSString stringWithFormat:@"%@",reviewOfSystemsHomeViewController.consultButtonOutlet.titleLabel.text];
            NSString *testselected_value=[NSString stringWithFormat:@"%@",reviewOfSystemsHomeViewController.testsButtonOutlet.titleLabel.text];
            NSString *riskother_value=[NSString stringWithFormat:@"%@",reviewOfSystemsHomeViewController.riskFactorOtherTextField.text];
             NSString *consultother_value=[NSString stringWithFormat:@"%@",reviewOfSystemsHomeViewController.consultOtherTextField.text];
             NSString *testother_value=[NSString stringWithFormat:@"%@",reviewOfSystemsHomeViewController.testsOtherTextField.text];
            [CoreDataHelper sharedInstance].reviewbaseselected_value=[NSArray arrayWithObjects:riskselected_value,consultselected_value,testselected_value, nil];
            [CoreDataHelper sharedInstance].reviewbaseOthervalues=[NSArray arrayWithObjects:riskother_value,consultother_value,testother_value, nil];
            NSString *mobilityselected_value=[NSString stringWithFormat:@"%@",reviewOfSystemsHomeViewController.mobilityButtonOutlet.titleLabel.text];
            NSString *activityselected_value=[NSString stringWithFormat:@"%@",reviewOfSystemsHomeViewController.activityButtonOutlet.titleLabel.text];
            NSString *sensoryselected_value=[NSString stringWithFormat:@"%@",reviewOfSystemsHomeViewController.sensoryPerceptionButtonOutlet.titleLabel.text];
            NSString *moistureselected_value=[NSString stringWithFormat:@"%@",reviewOfSystemsHomeViewController.moistureButtonOutlet.titleLabel.text];
            NSString *frictionselected_value=[NSString stringWithFormat:@"%@",reviewOfSystemsHomeViewController.frictionAndShearButtonOutlet.titleLabel.text];
            NSString *nutritionselected_value=[NSString stringWithFormat:@"%@",reviewOfSystemsHomeViewController.nutritionButtonOutlet.titleLabel.text];
            NSString *tissueselected_value=[NSString stringWithFormat:@"%@",reviewOfSystemsHomeViewController.tissuePerfusionOutlet.titleLabel.text];
            NSString *score_value=[NSString stringWithFormat:@"%@",reviewOfSystemsHomeViewController.totalScoreTextField.text];
            
            NSString *mobilityother_value=[NSString stringWithFormat:@"%@",reviewOfSystemsHomeViewController.mobilityAssessmentOutlet.text];
            NSString *activityother_value=[NSString stringWithFormat:@"%@",reviewOfSystemsHomeViewController.activityAssessmentOutlet.text];
            NSString *sensoryother_value=[NSString stringWithFormat:@"%@",reviewOfSystemsHomeViewController.sensoryPerceptionAssessmentOutlet.text];
            NSString *moistureother_value=[NSString stringWithFormat:@"%@",reviewOfSystemsHomeViewController.moistureAsessmentOutlet.text];
            NSString *frictionother_value=[NSString stringWithFormat:@"%@",reviewOfSystemsHomeViewController.frictionAssessmentOutlet.text];
            NSString *nutritionother_value=[NSString stringWithFormat:@"%@",reviewOfSystemsHomeViewController.nutritionAssessmentOutlet.text];
            NSString *tissueother_value=[NSString stringWithFormat:@"%@",reviewOfSystemsHomeViewController.tissueAssessmentOutlet.text];
            
            
            NSString *mobilityscore=[NSString stringWithFormat:@"%@",reviewOfSystemsHomeViewController.mobilityScore.text];
            NSString *activityscore=[NSString stringWithFormat:@"%@",reviewOfSystemsHomeViewController.activityScore.text];
            NSString *sensoryscore=[NSString stringWithFormat:@"%@",reviewOfSystemsHomeViewController.sensoryPerceptionScore.text];
            NSString *moisturescore=[NSString stringWithFormat:@"%@",reviewOfSystemsHomeViewController.moistureScore.text];
            NSString *frictionscore=[NSString stringWithFormat:@"%@",reviewOfSystemsHomeViewController.frictionScore.text];
            NSString *nutritionscore=[NSString stringWithFormat:@"%@",reviewOfSystemsHomeViewController.nutritionScore.text];
            NSString *tissuescore=[NSString stringWithFormat:@"%@",reviewOfSystemsHomeViewController.tissueScore.text];
            
            [CoreDataHelper sharedInstance].reviewassessselected_value=[NSArray arrayWithObjects:mobilityselected_value,activityselected_value,sensoryselected_value,moistureselected_value,frictionselected_value,nutritionselected_value,tissueselected_value,score_value ,nil];
            [CoreDataHelper sharedInstance].reviewassessOthervalues=[NSArray arrayWithObjects:mobilityother_value,activityother_value,sensoryother_value,moistureother_value,frictionother_value,nutritionother_value,tissueother_value,@"", nil];
            [CoreDataHelper sharedInstance].reviewassessScorevalues=[NSArray arrayWithObjects:mobilityscore,activityscore,sensoryscore,moisturescore,frictionscore,nutritionscore,tissuescore,@"",nil];
            
            [cdh saveReviewbase:entry_no];
            [cdh saveReviewAssess:entry_no];
                        break;
        }
        case 3:
        {
            [self.education setBackgroundImage:[UIImage imageNamed:@"icon_education.png"] forState:UIControlStateNormal];
            CoreDataHelper *cdh=[CoreDataHelper sharedInstance];
            NSString *discussedselected_value=[NSString stringWithFormat:@"%@",educationHomeviewcontroller.discussedButtonOutlet.titleLabel.text];
            NSString *methodusedselected_value=[NSString stringWithFormat:@"%@",educationHomeviewcontroller.methodUsedOutlet.titleLabel.text];
            NSString *handoutselected_value=[NSString stringWithFormat:@"%@",educationHomeviewcontroller.handoutOutlet.titleLabel.text];
            NSString *persontaughtselected_value=[NSString stringWithFormat:@"%@",educationHomeviewcontroller.personTaughtOutlet.titleLabel.text];
            NSString *comprehensionselected_value=[NSString stringWithFormat:@"%@",educationHomeviewcontroller.comprehensionOutlet.titleLabel.text];
            NSString *teachinassessselected_value=[NSString stringWithFormat:@"%@",educationHomeviewcontroller.teachingAssessmentOutlet.titleLabel.text];
            NSString *timespentselected_value=[NSString stringWithFormat:@"%@",educationHomeviewcontroller.btnEducationNumber.titleLabel.text];
            NSString *other=[NSString stringWithFormat:@"%@",educationHomeviewcontroller.otherTextField.text];
            NSString *discussedother_value=[NSString stringWithFormat:@"%@",educationHomeviewcontroller.discussedOtherTextField.text];
            NSString *methodusedother_value=[NSString stringWithFormat:@"%@",educationHomeviewcontroller.methodUsedOtherTextField.text];
            NSString *handoutother_value=[NSString stringWithFormat:@"%@",educationHomeviewcontroller.handOutOtherTextField.text];
            NSString *persontaughtother_value=[NSString stringWithFormat:@"%@",educationHomeviewcontroller.personTaughtOtherTextField.text];
            NSString *teachingassessother_value=[NSString stringWithFormat:@"%@",educationHomeviewcontroller.teachingAssessmentOtherTextField.text];
            if([educationHomeviewcontroller.minButtonOutlet isSelected])
               timespentother =@"min";
            else
                timespentother=@"hr";
            [CoreDataHelper sharedInstance].educationselected_value=[NSArray arrayWithObjects:discussedselected_value,methodusedselected_value,handoutselected_value,persontaughtselected_value,comprehensionselected_value,teachinassessselected_value,timespentselected_value,other,nil];
            
            
            [CoreDataHelper sharedInstance].educationOthervalues=[NSArray arrayWithObjects:discussedother_value,methodusedother_value,handoutother_value,persontaughtother_value,@"",teachingassessother_value,timespentother,@"",nil];
            [cdh saveEducation:entry_no];
            }
            break;
        case 4:
        {
            NSString *debridementselected_value;
            [self.treatment setBackgroundImage:[UIImage imageNamed:@"icon_treatment.png"] forState:UIControlStateNormal];
            CoreDataHelper *cdh=[CoreDataHelper sharedInstance];
            NSString *cleansingselected_value=[NSString stringWithFormat:@"%@",treatmentHomeViewController.cleansingButtonOutlet.titleLabel.text];
            NSString *dressingselected_value=[NSString stringWithFormat:@"%@",treatmentHomeViewController.dressingButtonOutlet.titleLabel.text];
            NSString *pressureselected_value=[NSString stringWithFormat:@"%@",treatmentHomeViewController.negativePressureWoundButtonOutlet.titleLabel.text];
            if([treatmentHomeViewController.yesButtonOutlet isSelected]){
                debridementselected_value=@"Yes";
            }
            else{
                debridementselected_value=@"No";
            }

            NSString *skincareselected_value=[NSString stringWithFormat:@"%@",treatmentHomeViewController.skinCareButtonOutlet.titleLabel.text];
            NSString *other=[NSString stringWithFormat:@"%@",treatmentHomeViewController.otherTextField.text];
            NSString *cleansingother_value=[NSString stringWithFormat:@"%@",treatmentHomeViewController.CleansingOtherTextField.text];
            NSString *dressingother_value=[NSString stringWithFormat:@"%@",treatmentHomeViewController.dressingOtherTextField.text];
            
            [CoreDataHelper sharedInstance].treatmentselected_value=[NSArray arrayWithObjects:cleansingselected_value,dressingselected_value,pressureselected_value,debridementselected_value,skincareselected_value,other,nil];
            [CoreDataHelper sharedInstance].treatmentOthervalues=[NSArray arrayWithObjects:cleansingother_value,dressingother_value,@"",@"",@"",@"",nil];
            
            [cdh saveTreatment:entry_no];        }
            break;
        case 5:
        {
            NSString *str;
            CoreDataHelper *cdh=[CoreDataHelper sharedInstance];
            [self.recommendation setBackgroundImage:[UIImage imageNamed:@"icon_recommend.png"] forState:UIControlStateNormal];
            NSString *mobilityselected_value=[NSString stringWithFormat:@"%@",recommendationHomeViewController.mobilityButtonOutlet.titleLabel.text];
            NSString *activityselected_value=[NSString stringWithFormat:@"%@",recommendationHomeViewController.activityButtonOutlet.titleLabel.text];
            NSString *sensorselected_value=[NSString stringWithFormat:@"%@",recommendationHomeViewController.sensoryPerceptionButtonOutlet.titleLabel.text];
            NSString *moistureselected_value=[NSString stringWithFormat:@"%@",recommendationHomeViewController.moistureButtonOutlet.titleLabel.text];
            NSString *frictionselected_value=[NSString stringWithFormat:@"%@",recommendationHomeViewController.frictionButtonOutlet.titleLabel.text];
            NSString *tissueselected_value=[NSString stringWithFormat:@"%@",recommendationHomeViewController.tissueperfusionButtonOutlet.titleLabel.text];
            NSString *labeltypeselected_value=[NSString stringWithFormat:@"%@",recommendationHomeViewController.labelTypeObtained.text];
            NSString *deitricialselected_value=[NSString stringWithFormat:@"%@",recommendationHomeViewController.deiticianReferral.text];
            NSString *otherselected_value=[NSString stringWithFormat:@"%@",recommendationHomeViewController.OtherTextfield.text];
            NSString *bradenselected_value=[NSString stringWithFormat:@"%@",recommendationHomeViewController.bradenQRiskCategory.text];
            NSString *followselected_value=[NSString stringWithFormat:@"%@",recommendationHomeViewController.followUpButtonOutlet.titleLabel.text];
            NSString *timespentselected_value=[NSString stringWithFormat:@"%@",recommendationHomeViewController.btnrecommendationNumberEntry.titleLabel.text];
            
            [CoreDataHelper sharedInstance].recommendationselected_value=[NSArray arrayWithObjects:mobilityselected_value,activityselected_value,sensorselected_value,moistureselected_value,frictionselected_value,tissueselected_value,labeltypeselected_value,deitricialselected_value,otherselected_value,bradenselected_value,followselected_value,timespentselected_value,nil];
            NSLog(@"%@",[CoreDataHelper sharedInstance].recommendationselected_value);
            //[CoreDataHelper sharedInstance].treatmentselected_value=[NSArray arrayWithObjects:recommendationHomeViewController.mobilityButtonOutlet.titleLabel.text,recommendationHomeViewController.activityButtonOutlet.titleLabel.text,recommendationHomeViewController.sensoryPerceptionButtonOutlet.titleLabel.text,recommendationHomeViewController.moistureButtonOutlet.titleLabel.text,recommendationHomeViewController.frictionButtonOutlet.titleLabel.text,recommendationHomeViewController.tissueperfusionButtonOutlet.titleLabel.text,recommendationHomeViewController.labelTypeObtained.text,recommendationHomeViewController.deiticianReferral.text,recommendationHomeViewController.OtherTextfield.text,recommendationHomeViewController.bradenQRiskCategory.text,recommendationHomeViewController.followUpButtonOutlet.titleLabel.text,recommendationHomeViewController.btnrecommendationNumberEntry.titleLabel.text,nil];
            
            if([recommendationHomeViewController.followUpButtonOutlet.titleLabel.text containsString:@"Other"]){
               str= recommendationHomeViewController.followUpOtherTextField.text;
            }
            else{
                str=recommendationHomeViewController.dateButtonOutlet.titleLabel.text;
            }
            [CoreDataHelper sharedInstance].recommendationOthervalues=[NSArray arrayWithObjects:@"",@"",@"",@"",@"",@"",str,@"",@"",@"",@"",@"", nil];
            
            [cdh saveRecommendation:entry_no];
            
        }
            break;
        case 6:
            [[CoreDataHelper sharedInstance]saveWoundCoordinates];
            [self.human setImage:[UIImage imageNamed:@"human2013.png"] forState:UIControlStateNormal];
            break;
        case 7:
        {
            [self.gallery setImage:[UIImage imageNamed:@"imggallery2013.png"] forState:UIControlStateNormal];
            [[CoreDataHelper sharedInstance]saveImages];
            break;
        }
      
        default:
            break;
    }
}

- (IBAction)buttonClciked:(id)sender {
    if([sender tag]==1){
        [sender setBackgroundImage:[UIImage imageNamed:@"visited.png"] forState:UIControlStateNormal];
        [self setButtonBackground];
        painController=[self.storyboard instantiateViewControllerWithIdentifier:@"PainHomeViewController"];
        [self.initialview addSubview:painController.view];
        [self addChildViewController:painController];
        
        NSString *charstring=[NSString stringWithFormat:@"%ld",(long)painController.characterButtonOutlet.tag];
        NSString *scorestring=[NSString stringWithFormat:@"%ld",(long)painController.scoreButtonOutlet.tag];
        [CoreDataHelper sharedInstance].paincategoryid=[NSArray arrayWithObjects:charstring,scorestring,nil];
        [CoreDataHelper sharedInstance].paincategory_name=[NSArray arrayWithObjects:@"Character",@"score", nil];
               _btnclickobj.buttonClicked=[sender tag];
        self.delete.alpha=0;
        
    }
    if([sender tag]==2){
        [sender setBackgroundImage:[UIImage imageNamed:@"visited.png"] forState:UIControlStateNormal];
        [self setButtonBackground];
        reviewOfSystemsHomeViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"ReviewOfSystemsHomeViewController"];
        [self.initialview addSubview:reviewOfSystemsHomeViewController.view];
        [self addChildViewController:reviewOfSystemsHomeViewController];
        NSString *riskid=[NSString stringWithFormat:@"%ld",(long)reviewOfSystemsHomeViewController.riskFactorButtonOutlet.tag];
        NSString *consultid=[NSString stringWithFormat:@"%ld",(long)reviewOfSystemsHomeViewController.consultButtonOutlet.tag];
        NSString *testid=[NSString stringWithFormat:@"%ld",(long)reviewOfSystemsHomeViewController.testsButtonOutlet.tag];
        [CoreDataHelper sharedInstance].reviewbasecategoryid=[NSArray arrayWithObjects:riskid,consultid,testid,nil];
        [CoreDataHelper sharedInstance].reviewbasecategory_name=[NSArray arrayWithObjects:@"Risk Factor",@"Consult",@"Tests", nil];
        
        NSString *mobilityid=[NSString stringWithFormat:@"%ld",(long)reviewOfSystemsHomeViewController.mobilityButtonOutlet.tag];
        NSString *activityid=[NSString stringWithFormat:@"%ld",(long)reviewOfSystemsHomeViewController.activityButtonOutlet.tag];
        NSString *sensorid=[NSString stringWithFormat:@"%ld",(long)reviewOfSystemsHomeViewController.sensoryPerceptionButtonOutlet.tag];
        NSString *moistureid=[NSString stringWithFormat:@"%ld",(long)reviewOfSystemsHomeViewController.moistureButtonOutlet.tag];
        NSString *frictionid=[NSString stringWithFormat:@"%ld",(long)reviewOfSystemsHomeViewController.frictionAndShearButtonOutlet.tag];
        NSString *nutritionid=[NSString stringWithFormat:@"%ld",(long)reviewOfSystemsHomeViewController.nutritionButtonOutlet.tag];
        NSString *tissueid=[NSString stringWithFormat:@"%ld",(long)reviewOfSystemsHomeViewController.tissuePerfusionOutlet.tag];
         NSString *scoreid=[NSString stringWithFormat:@"%ld",(long)reviewOfSystemsHomeViewController.tissuePerfusionOutlet.tag];
        [CoreDataHelper sharedInstance].reviewassesscategoryid=[NSArray arrayWithObjects:mobilityid,activityid,sensorid,moistureid,frictionid,nutritionid,tissueid,scoreid,nil];
        [CoreDataHelper sharedInstance].reviewassesscategory_name=[NSArray arrayWithObjects:@"Mobility",@"Activity",@"Sensory Perception",@"Moisture",@"Friction and Shear",@"Nutrition",@"Tissue Perfusion&oxygenation",@"Score",nil];
        
        
        _btnclickobj.buttonClicked=[sender tag];
        self.delete.alpha=0;
        
        
    }
    if ([sender tag]==3){
        [sender setBackgroundImage:[UIImage imageNamed:@"visited.png"] forState:UIControlStateNormal];
        [self setButtonBackground];
        educationHomeviewcontroller=[self.storyboard         instantiateViewControllerWithIdentifier:@"EducationHomeViewController"]; 
        [self.initialview addSubview:educationHomeviewcontroller.view];
        [self addChildViewController:educationHomeviewcontroller];
        NSString *discussedid=[NSString stringWithFormat:@"%ld",(long)educationHomeviewcontroller.discussedButtonOutlet.tag];
        NSString *methodid=[NSString stringWithFormat:@"%ld",(long)educationHomeviewcontroller.methodUsedOutlet.tag];
        NSString *handoutid=[NSString stringWithFormat:@"%ld",(long)educationHomeviewcontroller.handoutOutlet.tag];
        NSString *persontaughtid=[NSString stringWithFormat:@"%ld",(long)educationHomeviewcontroller.personTaughtOutlet.tag];
        NSString *comprehensionid=[NSString stringWithFormat:@"%ld",(long)educationHomeviewcontroller.comprehensionOutlet.tag];
        NSString *teachingassessid=[NSString stringWithFormat:@"%ld",(long)educationHomeviewcontroller.teachingAssessmentOutlet.tag];
        NSString *timespentid=[NSString stringWithFormat:@"%ld",(long)educationHomeviewcontroller.btnEducationNumber.tag];
        NSString *otherid=[NSString stringWithFormat:@"%ld",(long)educationHomeviewcontroller.otherTextField.tag];
        
        [CoreDataHelper sharedInstance].educationcategoryid=[NSArray arrayWithObjects:discussedid,methodid,handoutid,persontaughtid,comprehensionid,teachingassessid,timespentid,otherid,nil];
        [CoreDataHelper sharedInstance].educationcategory_name=[NSArray arrayWithObjects:@"Discussed",@"Method Used",@"Handout",@"Person Taught",@"Comprehension",@"Teaching Assessment",@"Time Spent Teaching",@"Other", nil];
        //buttonClicked=[sender tag];

        _btnclickobj.buttonClicked=[sender tag];
        self.delete.alpha=0;

        
    }
    if([sender tag]==4){
        NSString *debridementid;
        [sender setBackgroundImage:[UIImage imageNamed:@"visited.png"] forState:UIControlStateNormal];
        [self setButtonBackground];
        treatmentHomeViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"TreatmentHomeViewController"];
        [self.initialview addSubview:treatmentHomeViewController.view];
        [self addChildViewController:treatmentHomeViewController];
        NSString *cleansingid=[NSString stringWithFormat:@"%ld",(long)treatmentHomeViewController.cleansingButtonOutlet.tag];
        NSString *dressingid=[NSString stringWithFormat:@"%ld",(long)treatmentHomeViewController.dressingButtonOutlet.tag];
        NSString *pressureid=[NSString stringWithFormat:@"%ld",(long)treatmentHomeViewController.negativePressureWoundButtonOutlet.tag];
        
        if([treatmentHomeViewController.yesButtonOutlet isSelected]){
           debridementid=[NSString stringWithFormat:@"%ld",(long)treatmentHomeViewController.yesButtonOutlet.tag];
        }
        else
        {
        debridementid=[NSString stringWithFormat:@"%ld",(long)treatmentHomeViewController.noButtonOutlet.tag];
        }
        NSString *skincareid=[NSString stringWithFormat:@"%ld",(long)treatmentHomeViewController.skinCareButtonOutlet.tag];
        NSString *otherid=[NSString stringWithFormat:@"%ld",(long)treatmentHomeViewController.otherTextField.tag];
        
        [CoreDataHelper sharedInstance].treatmentcategoryid=[NSArray arrayWithObjects:cleansingid,dressingid,pressureid,debridementid,skincareid,otherid,nil];
        [CoreDataHelper sharedInstance].treatmentcategory_name=[NSArray arrayWithObjects:@"Cleansing/Irregation",@"Dressing/Care",@"Negative Pressure Wound",@"Debridement",@"Skin Care",@"Other", nil];

        _btnclickobj.buttonClicked=[sender tag];
        self.delete.alpha=0;

    }
    if([sender tag]==5){
        [sender setBackgroundImage:[UIImage imageNamed:@"visited.png"] forState:UIControlStateNormal];
      [self setButtonBackground];
       recommendationHomeViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"RecommendationHomeViewController"];
        [self.initialview addSubview:recommendationHomeViewController.view];
        [self addChildViewController:recommendationHomeViewController];
        NSString *mobilityid=[NSString stringWithFormat:@"%ld",(long)recommendationHomeViewController.mobilityButtonOutlet.tag];
         NSString *activityid=[NSString stringWithFormat:@"%ld",(long)recommendationHomeViewController.activityButtonOutlet.tag];
         NSString *sensorid=[NSString stringWithFormat:@"%ld",(long)recommendationHomeViewController.sensoryPerceptionButtonOutlet.tag];
         NSString *moistureid=[NSString stringWithFormat:@"%ld",(long)recommendationHomeViewController.moistureButtonOutlet.tag];
         NSString *frictionid=[NSString stringWithFormat:@"%ld",(long)recommendationHomeViewController.frictionButtonOutlet.tag];
         NSString *tissueid=[NSString stringWithFormat:@"%ld",(long)recommendationHomeViewController.tissueperfusionButtonOutlet.tag];
         NSString *labelid=[NSString stringWithFormat:@"%ld",(long)recommendationHomeViewController.labelTypeObtained.tag];
         NSString *deiticianid=[NSString stringWithFormat:@"%ld",(long)recommendationHomeViewController.deiticianReferral.tag];
         NSString *otherid=[NSString stringWithFormat:@"%ld",(long)recommendationHomeViewController.OtherTextfield.tag];
         NSString *bradenid=[NSString stringWithFormat:@"%ld",(long)recommendationHomeViewController.bradenQRiskCategory.tag];
         NSString *follwupid=[NSString stringWithFormat:@"%ld",(long)recommendationHomeViewController.followUpButtonOutlet.tag];
         NSString *timespentid=[NSString stringWithFormat:@"%ld",(long)recommendationHomeViewController.btnrecommendationNumberEntry.tag];
        //[CoreDataHelper sharedInstance].recommendationcategoryid=[NSMutableArray arrayWithObjects:[NSNumber numberWithInt: recommendationHomeViewController.mobilityButtonOutlet.tag],[NSNumber numberWithInt: recommendationHomeViewController.activityButtonOutlet.tag],[NSNumber numberWithInt: recommendationHomeViewController.sensoryPerceptionButtonOutlet.tag],[NSNumber numberWithInt: recommendationHomeViewController.moistureButtonOutlet.tag],[NSNumber numberWithInt: recommendationHomeViewController.frictionButtonOutlet.tag],[NSNumber numberWithInt: recommendationHomeViewController.tissueperfusionButtonOutlet.tag],[NSNumber numberWithInt: recommendationHomeViewController.labelTypeObtained.tag],[NSNumber numberWithInt: recommendationHomeViewController.deiticianReferral.tag],[NSNumber numberWithInt: recommendationHomeViewController.OtherTextfield.tag],[NSNumber numberWithInt: recommendationHomeViewController.bradenQRiskCategory.tag],[NSNumber numberWithInt: recommendationHomeViewController.followUpButtonOutlet.tag],[NSNumber numberWithInt: recommendationHomeViewController.btnrecommendationNumberEntry.tag],nil];
        [CoreDataHelper sharedInstance].recommendationcategoryid=[NSMutableArray arrayWithObjects:mobilityid,activityid,sensorid,moistureid,frictionid,tissueid,labelid,deiticianid,otherid,bradenid,follwupid,timespentid,nil];
                                                                  
        [CoreDataHelper sharedInstance].recommendationcategory_name=[NSArray arrayWithObjects:@"Mobility",@"Activity",@"Sensory Perception",@"Moisture",@"Friction and Shear",@"Tissue Perfusion and Oxygenation",@"Label Type Obtained From",@"Deitician Referral",@"Other",@"Braden Q Risk Category",@"Follow Up",@"Time Spent with Patient", nil];
        NSLog(@"%@",[CoreDataHelper sharedInstance].recommendationcategory_name);

        
        _btnclickobj.buttonClicked=[sender tag];
        self.delete.alpha=0;
        
    }
    if([sender tag]==6){
        self.delete.alpha=1;
        [sender setImage:[UIImage imageNamed:@"homanhover2013.png"] forState:UIControlStateNormal];
        [self setButtonBackground];
       WoundImageViewController *tvc=[self.storyboard instantiateViewControllerWithIdentifier:@"WoundImageViewController"];
        [self.initialview addSubview:tvc.view];
        [self addChildViewController:tvc];

        _btnclickobj.buttonClicked=[sender tag];
        
    }
    if([sender tag]==7){
        [[CoreDataHelper sharedInstance] fetchImages];
        [sender setImage:[UIImage imageNamed:@"imggalleryhover2013.png"] forState:UIControlStateNormal];
        [self setButtonBackground];
        PictureViewController *picVw=[self.storyboard instantiateViewControllerWithIdentifier:@"PictureViewController"];
        [self.initialview addSubview:picVw.view];
        [self addChildViewController:picVw];
        self.delete.alpha=0;
        _btnclickobj.buttonClicked=[sender tag];
        
        
    }
   
}
- (IBAction)btnPatientInfoClicked:(id)sender {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];

    self.patientInfoViewController = [storyBoard instantiateViewControllerWithIdentifier:@"PatientInfoViewController"];
    self.patientInfoViewController.delegate = self;
    self.popOver =  [[UIPopoverController alloc]initWithContentViewController:self.patientInfoViewController];
    [self.popOver presentPopoverFromRect:[sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
}

- (IBAction)showPatientListPopup:(UIButton *)sender {
    self.patientListTableViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PatientListTableViewController"];
    _patientListPopOver = [[UIPopoverController alloc]initWithContentViewController:self.patientListTableViewController];
    [_patientListPopOver setPopoverContentSize:CGSizeMake(400, 150)];
    [_patientListPopOver presentPopoverFromRect:[sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    
}
- (IBAction)showWoundAssessmentListPopup:(UIButton *)sender {
    self.woundAssessmentTVController = [self.storyboard instantiateViewControllerWithIdentifier:@"WoundAssessmentTVController"];
    _WoundAssessmentPopOver = [[UIPopoverController alloc]initWithContentViewController:self.woundAssessmentTVController];
    [_WoundAssessmentPopOver setPopoverContentSize:CGSizeMake(400, 150)];
    [_WoundAssessmentPopOver presentPopoverFromRect:[sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
}


-(void)patientInfoOKClicked{
    [self.popOver dismissPopoverAnimated:YES];
}



@end
