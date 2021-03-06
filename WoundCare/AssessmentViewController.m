//
//  AssessmentViewController.m
//  woundcare1
//
//  Created by Uthra on 25/03/15.
//  Copyright (c) 2015 CTS. All rights reserved.


#import "AssessmentViewController.h"
#import "PictureViewController.h"
#import "WoundImageViewController.h"
#define kInitialSpace 50
#define kEachLineHight 50
#define kInterLineSpace 10
@interface AssessmentViewController (){
    
    UIStoryboard *storybrd;
    CGSize pageSize;
    NSString *filePath;
    UIWebView *webView;
    CGFloat pdfyPos;
    
    NSArray *returnedArray;
    NSMutableString *returnedString;
}
- (IBAction)buttonClciked:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *txtSearchEntryNumber;
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
@property(nonatomic,strong)UIPopoverController *WoundAssessmentPopOver;
@end
NSString *timespentother;
NSString *StomaSize;
NSString *FistulaSize;
NSString *unit;
@implementation AssessmentViewController
PainHomeViewController *painController;
EducationHomeViewController *educationHomeviewcontroller;

TreatmentHomeViewController *treatmentHomeViewController;
RecommendationHomeViewController *recommendationHomeViewController;
ReviewOfSystemsHomeViewController *reviewOfSystemsHomeViewController;
OstomyViewController *ostomy;
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"BUTTON CLICKED ON LOAD %ld",[CoreDataHelper sharedInstance].buttonClicked);
    if(gblPictureViewController == nil)
    gblPictureViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"PictureViewController"];
    _btnclickobj=[CoreDataHelper sharedInstance];
    
    
        //    returnedArray=[[NSMutableArray alloc]init];
    returnedString=[NSMutableString new];
    
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
        //PictureViewController *picVw
        gblPictureViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"PictureViewController"];
        [self.initialview addSubview:gblPictureViewController.view];
        [self addChildViewController:gblPictureViewController];
        self.delete.alpha=0;
    }
    [CoreDataHelper sharedInstance].assessmentGlobalView = self.initialview;
    [CoreDataHelper sharedInstance].assessmentglobalviewcontroller=self;
    leftViewPanel = self.leftView;
    topViewPanel = self.topView;
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
            NSString *scoreselected_value=[NSString stringWithFormat:@"%@",painController.scoreButtonOutlet.titleLabel.text];
            [CoreDataHelper sharedInstance].painselected_value=[NSArray arrayWithObjects:charselected_value,scoreselected_value,nil];
            
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
            NSString *bradenselected_value;
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
            if([reviewOfSystemsHomeViewController.totalScoreTextField.text intValue]<=17){
           bradenselected_value=@"High";
            }
            else{
            bradenselected_value=@"Normal";
            }

            NSString *followselected_value=[NSString stringWithFormat:@"%@",recommendationHomeViewController.followUpButtonOutlet.titleLabel.text];
            NSString *timespentselected_value=[NSString stringWithFormat:@"%@",recommendationHomeViewController.btnrecommendationNumberEntry.titleLabel.text];
            
            [CoreDataHelper sharedInstance].recommendationselected_value=[NSArray arrayWithObjects:mobilityselected_value,activityselected_value,sensorselected_value,moistureselected_value,frictionselected_value,tissueselected_value,labeltypeselected_value,deitricialselected_value,otherselected_value,bradenselected_value,followselected_value,timespentselected_value,nil];
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
            //[[CoreDataHelper sharedInstance]saveWoundCoordinates]; commented since save will be done at the time of marking a coordinate
            [self.human setImage:[UIImage imageNamed:@"human2013.png"] forState:UIControlStateNormal];
            break;
        case 7:
        {
            [self.gallery setImage:[UIImage imageNamed:@"imggallery2013.png"] forState:UIControlStateNormal];
            [self getPictureViewData];
            if([CoreDataHelper sharedInstance].isDeletePhotoClicked != YES){
                [[CoreDataHelper sharedInstance]saveAllImages];
            }
            else{
                [CoreDataHelper sharedInstance].isDeletePhotoClicked = NO;
            }
            //[[CoreDataHelper sharedInstance]saveImages];
            break;
        }
        case 12:
        {
            // gastroVC=[self.storyboard instantiateViewControllerWithIdentifier:@"gastro"];
            //[self.initialview addSubview:GastrostomyViewController.view];
            // [self addChildViewController: GastrostomyViewController];
            
            
            
            //NSString *discussedselected_value=[NSString stringWithFormat:@"%@",educationHomeviewcontroller.discussedButtonOutlet.titleLabel.text];
            
            
            
            
            CoreDataHelper *cdh=[CoreDataHelper sharedInstance];
            
            NSString *GastrostomySiteId=[NSString stringWithFormat:@"%ld",(long)GVC.GastrostomySiteOutlet.tag];
            NSString *GastrostomyTubeTypeId=[NSString stringWithFormat:@"%ld",(long)GVC.GastrostomyTubeTypeOutlet.tag];
            NSString *AtypicalId=[NSString stringWithFormat:@"%ld",(long)GVC.atypicaltextview.tag];            NSString *SizeLengthId=[NSString stringWithFormat:@"%ld",(long)GVC.SizeLengthOutlet.tag];
            NSString *SizeWidthId=[NSString stringWithFormat:@"%ld",(long)GVC.SizeWidthOutlet.tag];
            NSString *CharacterId=[NSString stringWithFormat:@"%ld",(long)GVC.CharacterOutlet.tag];            NSString *RetentionDiskId=[NSString stringWithFormat:@"%ld",(long)GVC.RetentionDiskOutlet.tag];            NSString *PeristomalSkinCharacterId=[NSString stringWithFormat:@"%ld",(long)GVC.PeristomalSkinCharacterOutlet.tag];
            NSString *ExudateCharacterId=[NSString stringWithFormat:@"%ld",(long)GVC.ExudateCharacterOutlet.tag];
            NSString *ExudateOdorId=[NSString stringWithFormat:@"%ld",(long)GVC.ExudateOdorOutlet.tag];
            NSString *ExudateAmountId=[NSString stringWithFormat:@"%ld",(long)GVC.ExudateAmountOutlet.tag];
            NSString *GranulationTissueId=[NSString stringWithFormat:@"%ld",(long)GVC.GranulationTissueOutlet.tag];
            NSString *EdemaId=[NSString stringWithFormat:@"%ld",(long)GVC.EdemaOutlet.tag];
            NSString *ConditionId=[NSString stringWithFormat:@"%ld",(long)GVC.ConditionOutlet.tag];
            NSString *OnsetId=[NSString stringWithFormat:@"%ld",(long)GVC.dateButtonOutlet.tag];
            NSString *CommentsId=[NSString stringWithFormat:@"%ld",(long)GVC.commentstextview.tag];
            [CoreDataHelper sharedInstance].gastrostomycategoryid=[NSArray arrayWithObjects:GastrostomySiteId,GastrostomyTubeTypeId,AtypicalId,SizeLengthId,SizeWidthId,CharacterId,RetentionDiskId,PeristomalSkinCharacterId,ExudateCharacterId,ExudateOdorId,ExudateAmountId,GranulationTissueId,EdemaId,ConditionId,OnsetId,CommentsId,nil];
            
            [CoreDataHelper sharedInstance].gastrostomycategory_name=[NSArray arrayWithObjects:@"Gastrostomy Site",@"GastrostomyTubeType",@"Atypical",@"Size Length",@"Size Width",@"Character",@"Retention Disk",@"Peristomal Skin Character",@"Exudate Character",@"Exudate Odor",@"Exudate Amount",@"Granulation Tissue",@"Edema",@"Condition",@"Onset",@"Comments", nil];
            
            
            
            
            
            
            // CoreDataHelper *cdh=[CoreDataHelper sharedInstance];
            NSString *GastrostomySiteSelected_Value=[NSString stringWithFormat:@"%@",GVC.GastrostomySiteOutlet.titleLabel.text];
            NSString *GastrostomyTubeTypeSelected_Value=[NSString stringWithFormat:@"%@",GVC.GastrostomyTubeTypeOutlet.titleLabel.text];
            NSString *AtypicalSelected_Value=[NSString stringWithFormat:@"%@",GVC.atypicaltextview.text];            NSString *SizeLengthSelected_Value=[NSString stringWithFormat:@"%@",GVC.SizeLengthOutlet.titleLabel.text];
            
            NSString *SizeWidthSelected_Value=[NSString stringWithFormat:@"%@",GVC.SizeWidthOutlet.titleLabel.text];
            NSString *CharacterSelected_Value=[NSString stringWithFormat:@"%@",GVC.CharacterOutlet.titleLabel.text];
            NSString *RetentionDiskSelected_Value=[NSString stringWithFormat:@"%@",GVC.RetentionDiskOutlet.titleLabel.text];
            NSString *PeristomalSkinCharacterSelected_Value=[NSString stringWithFormat:@"%@",GVC.PeristomalSkinCharacterOutlet.titleLabel.text];
            NSString *ExudateCharacterSelected_Value=[NSString stringWithFormat:@"%@",GVC.ExudateCharacterOutlet.titleLabel.text];
            NSString *ExudateOdorSelected_Value=[NSString stringWithFormat:@"%@",GVC.ExudateOdorOutlet.titleLabel.text];
            
            NSString *ExudateAmountSelected_Value=[NSString stringWithFormat:@"%@",GVC.ExudateAmountOutlet.titleLabel.text];
            NSString *GranulationTissueSelected_Value=[NSString stringWithFormat:@"%@",GVC.GranulationTissueOutlet.titleLabel.text];
            NSString *EdemaSelected_Value=[NSString stringWithFormat:@"%@",GVC.EdemaOutlet.titleLabel.text];
            NSString *ConditionSelected_Value=[NSString stringWithFormat:@"%@",GVC.ConditionOutlet.titleLabel.text];
            NSString *OnsetSelected_Value=[NSString stringWithFormat:@"%@",GVC.dateButtonOutlet.titleLabel.text];
            NSString *CommentsSelected_Value=[NSString stringWithFormat:@"%@",GVC.commentstextview.text];
            
            
            
            NSString *CharacterOtherSelected_value=[NSString stringWithFormat:@"%@",GVC.CharacterOtherTextField.text];
            NSString *RetentionDiskOtherSelected_Value=[NSString stringWithFormat:@"%@",GVC.RetentionDiskOtherTextField.text];
            NSString *PeristomalSkinCharacterOtherSelected_Value=[NSString stringWithFormat:@"%@",GVC.PeristomalSkinCharacterOtherTextField.text];
            NSString *ExudateCharacterOtherSelected_value=[NSString stringWithFormat:@"%@",GVC.ExudateCharacterOtherTextField.text];
            NSString *GranulationTissueOtherSelected_Value=[NSString stringWithFormat:@"%@",GVC.GranulationTissueOtherTextField.text];
            
            
            
            
            
            
            if([GVC.cmbtnoutlet isSelected])
                unit=@"cm";
            else
                unit=@"mm";
            
            
            
            [CoreDataHelper sharedInstance].gastrostomyselected_value=[NSArray arrayWithObjects:GastrostomySiteSelected_Value,GastrostomyTubeTypeSelected_Value,AtypicalSelected_Value,SizeLengthSelected_Value,SizeWidthSelected_Value,CharacterSelected_Value,RetentionDiskSelected_Value,PeristomalSkinCharacterSelected_Value,ExudateCharacterSelected_Value,ExudateOdorSelected_Value,ExudateAmountSelected_Value,GranulationTissueSelected_Value,EdemaSelected_Value,ConditionSelected_Value,OnsetSelected_Value,CommentsSelected_Value,nil];
            NSLog(@"value= %@",GastrostomySiteSelected_Value);
            
            [CoreDataHelper sharedInstance].gastrostomyOthervalues=[NSArray arrayWithObjects:unit,@"",@"",@"",@"",CharacterOtherSelected_value,RetentionDiskOtherSelected_Value,PeristomalSkinCharacterOtherSelected_Value,ExudateCharacterOtherSelected_value,@"",@"",GranulationTissueOtherSelected_Value,@"",@"",@"",@"",nil];
            
            
            
            
            [cdh saveGastrostomy:entry_no andCategoryid:cdh.gastrostomycategoryid andCategoryname:cdh.gastrostomycategory_name andSelectedvalue:cdh.gastrostomyselected_value andOther:cdh.gastrostomyOthervalues];
            
            
            
        }
            break;
            
        case 13:
        {
            // gastroVC=[self.storyboard instantiateViewControllerWithIdentifier:@"gastro"];
            //[self.initialview addSubview:GastrostomyViewController.view];
            // [self addChildViewController: GastrostomyViewController];
            
            
            
            //NSString *discussedselected_value=[NSString stringWithFormat:@"%@",educationHomeviewcontroller.discussedButtonOutlet.titleLabel.text];
            
            
            
            
            CoreDataHelper *cdh=[CoreDataHelper sharedInstance];
            
            NSString *OtherId=[NSString stringWithFormat:@"%ld",(long)WVC.otherButtonOutlet.tag];
            NSString *WoundThicknessId=[NSString stringWithFormat:@"%ld",(long)WVC.woundThicknessButtonOutlet.tag];
            
            NSString *WoundBedColorId=[NSString stringWithFormat:@"%ld",(long)WVC.woundBedColorButtonOutlet.tag];            NSString *WoundBedId=[NSString stringWithFormat:@"%ld",(long)WVC.woundBedButtonOutlet.tag];
            NSString *WoundBedCharacterId=[NSString stringWithFormat:@"%ld",(long)WVC.btnWoundBedCharacter.tag];
            NSString *PeriWoundId=[NSString stringWithFormat:@"%ld",(long)WVC.periWoundButtonOutlet.tag];            NSString *ExudateCharacterId=[NSString stringWithFormat:@"%ld",(long)WVC.exudateCharacterButtonOutlet.tag];
            NSString *ExudateOdorId=[NSString stringWithFormat:@"%ld",(long)WVC.exudateOdorButtonOutlet.tag];
            NSString *ExudateAmountId=[NSString stringWithFormat:@"%ld",(long)WVC.exudateAmountButtonOutlet.tag];
            NSString *EdemaId=[NSString stringWithFormat:@"%ld",(long)WVC.edemaButtonOutlet.tag];
            NSString *ConditionId=[NSString stringWithFormat:@"%ld",(long)WVC.conditionButtonOutlet.tag];
            NSString *OtherWoundsId=[NSString stringWithFormat:@"%ld",(long)WVC.otherWoundsButtonOutlet.tag];
            NSString *OnsetId=[NSString stringWithFormat:@"%ld",(long)WVC.onsetButtonOutlet.tag];
            NSString *LengthId=[NSString stringWithFormat:@"%ld",(long)WVC.btnLength.tag];
            NSString *WidthId=[NSString stringWithFormat:@"%ld",(long)WVC.btnWidth.tag];
            NSString *DepthId=[NSString stringWithFormat:@"%ld",(long)WVC.btnDepth.tag];
            NSString *UnderminingId=[NSString stringWithFormat:@"%ld",(long)WVC.btnUnderminingcm.tag];
            NSString *UnderminingTimeId=[NSString stringWithFormat:@"%ld",(long)WVC.btnUnderminingClock.tag];
            NSString *TunnelingId=[NSString stringWithFormat:@"%ld",(long)WVC.btnTunnelingcm.tag];
            NSString *TunnelingTimeId=[NSString stringWithFormat:@"%ld",(long)WVC.btnTunnelingClock.tag];
            //             NSString *ExudateAmountOtherId=[NSString stringWithFormat:@"%ld",(long)WVC.amountButtonOutlet.tag];
            //             NSString *WoundBedColorOtherId=[NSString stringWithFormat:@"%ld",(long)WVC.woundBedColorOtherTextField.tag];
            //             NSString *WoundBedOtherId=[NSString stringWithFormat:@"%ld",(long)WVC.woundBedOtherTextField.tag];
            //             NSString *PeriWoundOtherId=[NSString stringWithFormat:@"%ld",(long)WVC.periwoundOtherTextField.tag];
            //             NSString *ExudateCharacterOtherId=[NSString stringWithFormat:@"%ld",(long)WVC.exudateCharacterOtherTextField.tag];
            //             NSString *ExudateOdorOtherId=[NSString stringWithFormat:@"%ld",(long)WVC.exudateOdorOtherTextField.tag];
            NSString *NewBornId=[NSString stringWithFormat:@"%ld",(long)WVC.newbornTextFieldOutlet.tag];
            NSString *PediatricId=[NSString stringWithFormat:@"%ld",(long)WVC.pediatricTextFieldOutlet.tag];
            NSString *PhlebitisId=[NSString stringWithFormat:@"%ld",(long)WVC.phlebitisTextFieldOutlet.tag];
            NSString *UlcerId=[NSString stringWithFormat:@"%ld",(long)WVC.ulcerTextFieldOutlet.tag];
            NSString *AtypicalId=[NSString stringWithFormat:@"%ld",(long)WVC.atypicalTextViewOutlet.tag];
            NSString *ComentsId=[NSString stringWithFormat:@"%ld",(long)WVC.commentsTextViewOutlet.tag];
            
            
            [CoreDataHelper sharedInstance].woundreasoncategoryid=[NSArray arrayWithObjects:OtherId,WoundThicknessId,WoundBedColorId,WoundBedId,WoundBedCharacterId,PeriWoundId,ExudateCharacterId,ExudateOdorId,ExudateAmountId,EdemaId,ConditionId,OtherWoundsId,OnsetId,LengthId,WidthId,DepthId,UnderminingId,UnderminingTimeId,TunnelingId,TunnelingTimeId,NewBornId,PediatricId,PhlebitisId,UlcerId,AtypicalId,ComentsId,nil];
            
            
            
            [CoreDataHelper sharedInstance].woundreasoncategory_name=[NSArray arrayWithObjects:@"Other",@"Wound Thickness",@"Wound Bed Color",@"Wound Bed",@"Wound Bed Character",@"Peri Wound",@"Exudate Character",@"Exudate Odor",@"Exudate Amount",@"Edema",@"Condition",@"Other Wounds",@"Onset",@"Length",@"Width",@"Depth",@"Undermining",@"Undermining Time",@"Tunneling",@"Tunneling Time",@"Newborn",@"Pediatric",@"Phlebitis",@"Ulcer",@"Atypical",@"Comments",nil];
            
            
            
            
            
//            if([WVC.underminingCmButtonOutlet isSelected])
//                unit2=@"cm";
//            else
//                unit2=@"mm";
//            
//            if([WVC.tunnelingCmbuttonOutlet isSelected])
//                unit3=@"cm";
//            else
//                unit3=@"mm";
//

            
            // CoreDataHelper *cdh=[CoreDataHelper sharedInstance];
            NSString *OtherSelected_Value=[NSString stringWithFormat:@"%@",WVC.otherButtonOutlet.titleLabel.text];
            NSString *WoundThicknessSelected_Value=[NSString stringWithFormat:@"%@",WVC.woundThicknessButtonOutlet.titleLabel.text];
            NSString *WoundBedColorSelected_Value=[NSString stringWithFormat:@"%@",WVC.woundBedColorButtonOutlet.titleLabel.text];
            NSString *WoundBedSelected_Value=[NSString stringWithFormat:@"%@",WVC.woundBedButtonOutlet.titleLabel.text];
            
            NSString *WoundBedCharacterSelected_Value=[NSString stringWithFormat:@"%@",WVC.btnWoundBedCharacter.titleLabel.text];
            NSString *PeriWoundSelected_Value=[NSString stringWithFormat:@"%@",WVC.periWoundButtonOutlet.titleLabel.text];
            NSString *ExudateCharacterSelected_Value=[NSString stringWithFormat:@"%@",WVC.exudateCharacterButtonOutlet.titleLabel.text];
            NSString *ExudateOdorSelected_Value=[NSString stringWithFormat:@"%@",WVC.exudateOdorButtonOutlet.titleLabel.text];
            NSString *ExudateAmountSelected_Value=[NSString stringWithFormat:@"%@",WVC.exudateAmountButtonOutlet.titleLabel.text];
            NSString *EdemaSelected_Value=[NSString stringWithFormat:@"%@",WVC.edemaButtonOutlet.titleLabel.text];
            
            NSString *ConditionSelected_Value=[NSString stringWithFormat:@"%@",WVC.conditionButtonOutlet.titleLabel.text];
            NSString *OtherWoundsSelected_Value=[NSString stringWithFormat:@"%@",WVC.otherWoundsButtonOutlet.titleLabel.text];
            NSString *OnsetSelected_Value=[NSString stringWithFormat:@"%@",WVC.onsetButtonOutlet.titleLabel.text];
            NSString *LengthSelected_Value=[NSString stringWithFormat:@"%@",WVC.btnLength.titleLabel.text];
            NSString *WidthSelected_Value=[NSString stringWithFormat:@"%@",WVC.btnWidth.titleLabel.text];
            NSString *DepthSelected_Value=[NSString stringWithFormat:@"%@",WVC.btnDepth.titleLabel.text];
            NSString *UnderminingSelected_Value=[NSString stringWithFormat:@"%@",WVC.btnUnderminingcm.titleLabel.text];
            NSString *UnderminingTimeSelected_Value=[NSString stringWithFormat:@"%@",WVC.btnUnderminingClock.titleLabel.text];
            NSString *TunnelingSelected_Value=[NSString stringWithFormat:@"%@",WVC.btnTunnelingcm.titleLabel.text];
            NSString *TunnelingTimeSelected_Value=[NSString stringWithFormat:@"%@",WVC.btnTunnelingClock.titleLabel.text];
            NSString *NewbornSelected_Value=[NSString stringWithFormat:@"%@",WVC.newbornTextFieldOutlet.text];
            NSString *PediatricSelected_Value=[NSString stringWithFormat:@"%@",WVC.pediatricTextFieldOutlet.text];
            NSString *PhlebitisSelected_Value=[NSString stringWithFormat:@"%@",WVC.phlebitisTextFieldOutlet.text];
            NSString *UlcerSelected_Value=[NSString stringWithFormat:@"%@",WVC.ulcerTextFieldOutlet.text];
            NSString *AtypicalSelected_Value=[NSString stringWithFormat:@"%@",WVC.atypicalTextViewOutlet.text];
            NSString *CommentsSelected_Value=[NSString stringWithFormat:@"%@",WVC.commentsTextViewOutlet.text];
            
            
            
            NSString *ExudateAmountOtherSelected_value=[NSString stringWithFormat:@"%@",WVC.amountButtonOutlet.titleLabel.text];
            NSString *WoundBedColorOtherSelected_Value=[NSString stringWithFormat:@"%@",WVC.woundBedColorOtherTextField.text];
            NSString *WoundBedOtherSelected_Value=[NSString stringWithFormat:@"%@",WVC.woundBedOtherTextField.text];
            NSString *PeriWoundOtherSelected_value=[NSString stringWithFormat:@"%@",WVC.periwoundOtherTextField.text];
            NSString *ExudateCharacterOtherSelected_Value=[NSString stringWithFormat:@"%@",WVC.exudateCharacterOtherTextField.text];
            NSString *ExudateOdorOtherSelected_Value=[NSString stringWithFormat:@"%@",WVC.exudateOdorOtherTextField .text];
            
            
            
            
            
            //
            //            if([GVC.cmbtnoutlet isSelected])
            //                unit=@"cm";
            //            else
            //                unit=@"mm";
            //
            
            
            [CoreDataHelper sharedInstance].woundreasonselected_value=[NSArray arrayWithObjects:OtherSelected_Value,WoundThicknessSelected_Value,WoundBedColorSelected_Value,WoundBedSelected_Value,WoundBedCharacterSelected_Value,PeriWoundSelected_Value,ExudateCharacterSelected_Value,ExudateOdorSelected_Value,ExudateAmountSelected_Value,EdemaSelected_Value,ConditionSelected_Value,OtherWoundsSelected_Value,OnsetSelected_Value,LengthSelected_Value,WidthSelected_Value,DepthSelected_Value,UnderminingSelected_Value,UnderminingTimeSelected_Value,TunnelingSelected_Value,TunnelingTimeSelected_Value,NewbornSelected_Value,PediatricSelected_Value,PhlebitisSelected_Value,UlcerSelected_Value,AtypicalSelected_Value,CommentsSelected_Value,nil];
            
            // NSLog(@"value= %@",GastrostomySiteSelected_Value);
            
            [CoreDataHelper sharedInstance].woundreasonOthervalues=[NSArray arrayWithObjects:[CoreDataHelper sharedInstance].unit1,[CoreDataHelper sharedInstance].unit2,WoundBedColorOtherSelected_Value,WoundBedOtherSelected_Value,@"",PeriWoundOtherSelected_value,ExudateCharacterOtherSelected_Value,ExudateOdorOtherSelected_Value,ExudateAmountOtherSelected_value,
                                                                    [CoreDataHelper sharedInstance].unit3,[CoreDataHelper sharedInstance].unit4,[CoreDataHelper sharedInstance].unit5,[CoreDataHelper sharedInstance].unit6,[CoreDataHelper sharedInstance].unit7,@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",nil];
            
            
            [cdh saveWoundReason:entry_no andCategoryid:cdh.woundreasoncategoryid andCategoryname:cdh.woundreasoncategory_name andSelectedvalue:cdh.woundreasonselected_value andOther:cdh.woundreasonOthervalues];
            
            
            
            //            [cdh saveGastrostomy:entry_no andCategoryid:cdh.gastrostomycategoryid andCategoryname:cdh.gastrostomycategory_name andSelectedvalue:cdh.gastrostomyselected_value andOther:cdh.gastrostomyOthervalues];
            //            
            
        }
            break;

            
        case 14:
        {
            NSLog(@"Case 14");
            CoreDataHelper *cdh=[CoreDataHelper sharedInstance];
            NSString *ostomyselected_value=[NSString stringWithFormat:@"%@",OVC.OstomySiteButton.titleLabel.text];
            NSString *stomaLocationselected_value=[NSString stringWithFormat:@"%@",OVC.StomaLocationButton.titleLabel.text];
            NSString *stomacolorselected_value=[NSString stringWithFormat:@"%@",OVC.StomaColorButton.titleLabel.text];
            NSString *stomaOutputColorselected_value=[NSString stringWithFormat:@"%@",OVC.StomaOutputColorButton.titleLabel.text];
             NSString *stomaOutputCharacterselected_value=[NSString stringWithFormat:@"%@",OVC.StomaOutputCharacterButton.titleLabel.text];
            NSString *fistulaLocationselected_value=[NSString stringWithFormat:@"%@",OVC.FistulaLocationButton.titleLabel.text];
            NSString *fistulaColorselected_value=[NSString stringWithFormat:@"%@",OVC.FistulaColorButton.titleLabel.text];
            NSString *characterselected_value=[NSString stringWithFormat:@"%@",OVC.PeristomalSkinButton.titleLabel.text];
            NSString *exudateCharacterselected_value=[NSString stringWithFormat:@"%@",OVC.ExudateCharacterButton.titleLabel.text];
            NSString *exudateOdourselected_value=[NSString stringWithFormat:@"%@",OVC.ExudateOdourButton.titleLabel.text];
            NSString *exudateAmountselected_value=[NSString stringWithFormat:@"%@",OVC.ExudateAmountButton.titleLabel.text];
            NSString *garanulationTissueselected_value=[NSString stringWithFormat:@"%@",OVC.GranulationTissueButton.titleLabel.text];
            NSString *edemaselected_value=[NSString stringWithFormat:@"%@",OVC.EdemaButton.titleLabel.text];
            NSString *conditionselected_value=[NSString stringWithFormat:@"%@",OVC.PeristomalSkinConditionButton.titleLabel.text];
            
            NSString *stomaLengthselected_value=[NSString stringWithFormat:@"%@",OVC.StomaLengthButton.titleLabel.text];
            NSString *stomaWidthselected_value=[NSString stringWithFormat:@"%@",OVC.StomaWidthButton.titleLabel.text];
            NSString *stomaDepthselected_value=[NSString stringWithFormat:@"%@",OVC.StomaDepthButton.titleLabel.text];
            NSString *fistulaLengthselected_value=[NSString stringWithFormat:@"%@",OVC.FistulaLengthButton.titleLabel.text];
            NSString *fistulaWidthselected_value=[NSString stringWithFormat:@"%@",OVC.FistulaWidthButton.titleLabel.text];
            NSString *fistulaDepthselected_value=[NSString stringWithFormat:@"%@",OVC.FistulaDepthButton.titleLabel.text];
            
            NSString *atypical=[NSString stringWithFormat:@"%@",OVC.AtypicalTextView.text];
            NSString *comments=[NSString stringWithFormat:@"%@",OVC.CommentsTextView.text];
            
            NSString *onsetDateselected_value=[NSString stringWithFormat:@"%@",OVC.dateButtonOutlet.titleLabel.text];
            
            NSString *stomaLocationother_value=[NSString stringWithFormat:@"%@",OVC.StomaLocationOtherTextField.text];
            NSString *stomaColorother_value=[NSString stringWithFormat:@"%@",OVC.StomaColorOtherTextField.text];
            NSString *stomaOutputColorother_value=[NSString stringWithFormat:@"%@",OVC.StomaOutputColorOtherTextField.text];
            NSString *stomaOutputCharacterother_value=[NSString stringWithFormat:@"%@",OVC.StomaOutputCharacterOtherTextField.text];
            NSString *fistulaLocationother_value=[NSString stringWithFormat:@"%@",OVC.FistulaLocationOtherTextField.text];
            NSString *fistulaColorother_value=[NSString stringWithFormat:@"%@",OVC.FistulaColorOtherTextField.text];
            NSString *characterother_value=[NSString stringWithFormat:@"%@",OVC.CharacterOtherTextField.text];
            NSString *exudateCharacterother_value=[NSString stringWithFormat:@"%@",OVC.ExudateCharacterOtherTextField.text];
            NSString *exudateOdourother_value=[NSString stringWithFormat:@"%@",OVC.ExudateOdourOtherTextField.text];
            NSString *granulationTissueother_value=[NSString stringWithFormat:@"%@",OVC.GranulationTissueOtherTextField.text];
            if([OVC.StomaSizecmButton isSelected])
                StomaSize =@"cm";
            else
                StomaSize=@"mm";
            if([OVC.FistulaSizecmButton isSelected])
                FistulaSize =@"cm";
            else
                FistulaSize=@"mm";
            
            
            [CoreDataHelper sharedInstance].ostomyselected_value=[NSArray arrayWithObjects:ostomyselected_value,stomaLocationselected_value,stomacolorselected_value,stomaOutputColorselected_value,stomaOutputCharacterselected_value,fistulaLocationselected_value,fistulaColorselected_value,characterselected_value,exudateCharacterselected_value,exudateOdourselected_value,exudateAmountselected_value,garanulationTissueselected_value,edemaselected_value,conditionselected_value,stomaLengthselected_value,stomaWidthselected_value,stomaDepthselected_value,fistulaLengthselected_value,fistulaWidthselected_value,fistulaDepthselected_value,atypical,comments,onsetDateselected_value,nil];
            
            [CoreDataHelper sharedInstance].ostomyOthervalues=[NSArray arrayWithObjects:@"",stomaLocationother_value,stomaColorother_value,stomaOutputColorother_value,stomaOutputCharacterother_value,fistulaLocationother_value,fistulaColorother_value,characterother_value,exudateCharacterother_value,exudateOdourother_value,@"",granulationTissueother_value,@"",@"",StomaSize,@"",@"",FistulaSize,@"",@"",@"",@"",@"",nil];
            NSLog(@"%@",[CoreDataHelper sharedInstance].ostomyOthervalues);
          

            
            
            
            NSString *ostomyid=[NSString stringWithFormat:@"%ld",(long)OVC.OstomySiteButton.tag];
            NSString *stomaLocationid=[NSString stringWithFormat:@"%ld",(long)OVC.StomaLocationButton.tag];
            NSString *stomaColorid=[NSString stringWithFormat:@"%ld",(long)OVC.StomaColorButton.tag];
            NSString *stomaOutputColorid=[NSString stringWithFormat:@"%ld",(long)OVC.StomaOutputColorButton.tag];
            NSString *stomaOutputCharacterid=[NSString stringWithFormat:@"%ld",(long)OVC.StomaOutputCharacterButton.tag];
            NSString *fistulaLocationid=[NSString stringWithFormat:@"%ld",(long)OVC.FistulaLocationButton.tag];
            NSString *fistulaColorid=[NSString stringWithFormat:@"%ld",(long)OVC.FistulaColorButton.tag];
            NSString *Characterid=[NSString stringWithFormat:@"%ld",(long)OVC.PeristomalSkinButton.tag];
            NSString *exudateCharacterid=[NSString stringWithFormat:@"%ld",(long)OVC.ExudateCharacterButton.tag];
            NSString *exudateOdourid=[NSString stringWithFormat:@"%ld",(long)OVC.ExudateOdourButton.tag];
            NSString *exudateAmountid=[NSString stringWithFormat:@"%ld",(long)OVC.ExudateAmountButton.tag];
            NSString *granulationTissueid=[NSString stringWithFormat:@"%ld",(long)OVC.GranulationTissueButton.tag];
            NSString *edemaid=[NSString stringWithFormat:@"%ld",(long)OVC.EdemaButton.tag];
            NSString *conditionid=[NSString stringWithFormat:@"%ld",(long)OVC.PeristomalSkinConditionButton.tag];
            NSString *stomaLengthid=[NSString stringWithFormat:@"%ld",(long)OVC.StomaLengthButton.tag];
            NSString *stomaWidthid=[NSString stringWithFormat:@"%ld",(long)OVC.StomaWidthButton.tag];
            NSString *stomaDepthid=[NSString stringWithFormat:@"%ld",(long)OVC.StomaDepthButton.tag];
            NSString *fistulaLengthid=[NSString stringWithFormat:@"%ld",(long)OVC.FistulaLengthButton.tag];
            NSString *fistulaWidthid=[NSString stringWithFormat:@"%ld",(long)OVC.FistulaWidthButton.tag];
            NSString *fistulaDepthid=[NSString stringWithFormat:@"%ld",(long)OVC.FistulaDepthButton.tag];
            NSString *atypicalid=[NSString stringWithFormat:@"%ld",(long)OVC.AtypicalTextView.tag];
            NSString *commentsid=[NSString stringWithFormat:@"%ld",(long)OVC.CommentsTextView.tag];
            NSString *onsetDateid=[NSString stringWithFormat:@"%ld",(long)OVC.dateButtonOutlet.tag];
            
            [CoreDataHelper sharedInstance].ostomycategoryid=[NSArray arrayWithObjects:ostomyid,stomaLocationid,stomaColorid,stomaOutputColorid,stomaOutputCharacterid,fistulaLocationid,fistulaColorid,Characterid,exudateCharacterid,exudateOdourid,exudateAmountid,granulationTissueid,edemaid,conditionid,stomaLengthid,stomaWidthid,stomaDepthid,fistulaLengthid,fistulaWidthid,fistulaDepthid,atypicalid,commentsid,onsetDateid,nil];
            [CoreDataHelper sharedInstance].ostomycategory_name=[NSArray arrayWithObjects:@"Ostomy Site",@"Stoma Location",@"Stoma Color",@"Stoma Output Color",@"Stoma Output Character",@"Fistula Location",@"Fistula Color",@"Character",@"Exudate Character",@"Exudate Odor",@"Exudate Amount",@"Granulation Tissue",@"Edema",@"Condition",@"Stoma Length",@"Stoma Width",@"Stoma Depth",@"Fistula Length",@"Fistula Width",@"Fistula Depth",@"Atypical",@"Comments",@"Onset Date" ,nil];
            
            
            
            [cdh saveOstomy:entry_no];
            break;
        }
        default:
            break;
    }
}

- (IBAction)EMRButtonAction:(UIButton *)sender {
    pageSize=CGSizeMake(850,4000);
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject];
    filePath = [docPath stringByAppendingPathComponent:@"EMR.pdf"];
    NSLog(@"%@",filePath);
    [self generatePDF:filePath];
}





-(void)drawText{
    
    CoreDataHelper *ch=[CoreDataHelper sharedInstance];
     [ch setPainFields:entry_no];
    
    
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    [style setLineBreakMode:NSLineBreakByWordWrapping];
    

    
    pdfyPos = kEachLineHight+kInterLineSpace;
    
    UIFont *font=[UIFont fontWithName:@"Helvetica" size:30];
    CGRect textRect=CGRectMake(kInitialSpace*9,pdfyPos, 924, kEachLineHight);
    NSString * myString=@"WoundCareApp";
    
    
         [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blueColor]}];
    
    font=[UIFont fontWithName:@"Helvetica" size:25];
   CGFloat textHeight= [self calculateHeight:myString withfont:font].height;
    pdfyPos += textHeight+20;
    
    textRect=CGRectMake(kInitialSpace, pdfyPos, 350, kEachLineHight);
     myString=@"Pain";
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor redColor]}];
    
    
    
    font=[UIFont fontWithName:@"Helvetica" size:20];
     textHeight= [self calculateHeight:myString withfont:font].height;
    pdfyPos += textHeight+20;
    
    
    
    textRect=CGRectMake(kInitialSpace,pdfyPos , 924,kEachLineHight);
        //    NSMutableArray *painArray = [ch setPainFields:entry_no ];
    returnedArray = [ch setPainFields:entry_no ];
    NSString *valueScore;
    if([returnedArray count] > 1 ){
    valueScore  = [returnedArray objectAtIndex:1];
    }
    else{
         valueScore = @"-";
    }
    if([valueScore integerValue] >= 0 && [valueScore integerValue] != nil){
        
    }
    else{
        valueScore = @"-";
    }
    
        //returnedString=[self checkString:[[ch setPainFields:entry_no ]objectAtIndex:1]];
    myString=[NSString stringWithFormat:@"Score: %@",valueScore];
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor]}];
    
    
    
    font=[UIFont fontWithName:@"Helvetica" size:20];
    textHeight= [self calculateHeight:myString withfont:font].height;
    pdfyPos += textHeight+20;

    textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
    
    returnedArray =[ch setPainFields:entry_no ];
    if([returnedArray count] > 0){
        returnedString=[self checkString:[returnedArray objectAtIndex:0]];
    }
    else{
        returnedString = [NSMutableString stringWithFormat:@"-"];
    }
    myString=[NSString stringWithFormat:@"Character: %@",returnedString];
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
    
    
    
    font=[UIFont fontWithName:@"Helvetica" size:25];
    textHeight= [self calculateHeight:myString withfont:font].height;
    pdfyPos += textHeight+20;
    
    
    textRect=CGRectMake(kInitialSpace, pdfyPos, 924, kEachLineHight);
    myString=@"Review Of Systems";
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor redColor]}];
    
    
    font=[UIFont fontWithName:@"Helvetica" size:20];
    textHeight= [self calculateHeight:myString withfont:font].height;
    pdfyPos += textHeight+20;
    
    
    textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
 returnedArray =[ch setReviewbaseFields:entry_no ];
    if([returnedArray count] > 0){
    returnedString=[self checkString:[returnedArray objectAtIndex:0]];
    }
    else{
        returnedString = [NSMutableString stringWithFormat:@"-"];
    }
    myString=[NSString stringWithFormat:@"Risk Factor: %@",returnedString];
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
    
    
    if([returnedArray count] > 0){
        if ([[[ch setReviewbaseFields:entry_no ]objectAtIndex:0] containsString:@"Other"]) {
            
            textHeight= [self calculateHeight:myString withfont:font].height;
            pdfyPos += textHeight+20;
            
            
            textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
            returnedArray =[ch setReviewbaseFields:entry_no ];
            
            if([returnedArray count] > 3){
                returnedString=[self checkString:[returnedArray objectAtIndex:3]];
            }
            else{
                returnedString = [NSMutableString stringWithFormat:@"-"];
            }
            
            myString=[NSString stringWithFormat:@"Other Value: %@",returnedString];
            [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
        }
    }
    

    
    
    font=[UIFont fontWithName:@"Helvetica" size:20];
    textHeight= [self calculateHeight:myString withfont:font].height;
    pdfyPos += textHeight+20;
    
    
    textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
    if([returnedArray count ]> 1)
    returnedString=[self checkString:[returnedArray objectAtIndex:1]];
    else{
        returnedString = [NSMutableString stringWithFormat:@"-"];
    }
        
    myString=[NSString stringWithFormat:@"Consult: %@",returnedString];
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
    
    if([returnedArray count] > 0){
        if ([[[ch setReviewbaseFields:entry_no ]objectAtIndex:1] containsString:@"Other"]) {
            
            textHeight= [self calculateHeight:myString withfont:font].height;
            pdfyPos += textHeight+20;
            
            
            textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
            returnedArray =[ch setReviewbaseFields:entry_no ];
            
            if([returnedArray count] > 4){
                returnedString=[self checkString:[returnedArray objectAtIndex:4]];
            }
            else{
                returnedString = [NSMutableString stringWithFormat:@"-"];
            }
            
            myString=[NSString stringWithFormat:@"Other Value: %@",returnedString];
            [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
        }
    }


    
    
    font=[UIFont fontWithName:@"Helvetica" size:20];
    textHeight= [self calculateHeight:myString withfont:font].height;
    pdfyPos += textHeight+20;
    
    
    textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
    returnedArray =[ch setReviewbaseFields:entry_no ];
    if([returnedArray count] > 2){
        returnedString=[self checkString:[returnedArray objectAtIndex:2]];
    }
    else{
        returnedString = [NSMutableString stringWithFormat:@"-"];
    }
    myString=[NSString stringWithFormat:@"Tests: %@",returnedString];
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
    
    
    if([returnedArray count] > 0){
        if ([[[ch setReviewbaseFields:entry_no ]objectAtIndex:2] containsString:@"Other"]) {
            
            textHeight= [self calculateHeight:myString withfont:font].height;
            pdfyPos += textHeight+20;
            
            
            textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
            returnedArray =[ch setReviewbaseFields:entry_no ];
            
            if([returnedArray count] > 5){
                returnedString=[self checkString:[returnedArray objectAtIndex:5]];
            }
            else{
                returnedString = [NSMutableString stringWithFormat:@"-"];
            }
            
            myString=[NSString stringWithFormat:@"Other Value: %@",returnedString];
            [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
        }
    }
    
    

    
    
    
    
    font=[UIFont fontWithName:@"Helvetica" size:20];
    textHeight= [self calculateHeight:myString withfont:font].height;
    pdfyPos += textHeight+20;
    
    
    textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
    myString=@"Category";
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blueColor],NSParagraphStyleAttributeName:style}];
    
    textRect=CGRectMake(kInitialSpace*9,pdfyPos, 924, kEachLineHight);
    myString=@"Score";
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blueColor],NSParagraphStyleAttributeName:style}];
    
    
    
    font=[UIFont fontWithName:@"Helvetica" size:20];
    textHeight= [self calculateHeight:myString withfont:font].height;
    pdfyPos += textHeight+20;

    
    
    textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
    myString=@"Mobility";
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
    
    textRect=CGRectMake(kInitialSpace*9,pdfyPos, 924, kEachLineHight);
    returnedArray =[ch setReviewassessFields:entry_no ];
    if([returnedArray count] > 2){
        returnedString=[self checkString:[returnedArray objectAtIndex:2]];
    }
    else{
        returnedString = [NSMutableString stringWithFormat:@"-"];
    }
    
    myString=returnedString;
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
    
    
    textHeight= [self calculateHeight:myString withfont:font].height;
    pdfyPos += textHeight+20;
    
    
    
    textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
    myString=@"Activity";
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
    
    textRect=CGRectMake(kInitialSpace*9,pdfyPos, 924, kEachLineHight);
    returnedArray =[ch setReviewassessFields:entry_no ];

    if([returnedArray count] > 5){
        returnedString=[self checkString:[returnedArray objectAtIndex:5]];
    }
    else{
        returnedString = [NSMutableString stringWithFormat:@"-"];
    }

        //returnedString=[self checkString:[[ch setReviewassessFields:entry_no ]objectAtIndex:5]];

    myString=returnedString;
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
    
    
    
    textHeight= [self calculateHeight:myString withfont:font].height;
    pdfyPos += textHeight+20;

    
    textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
    myString=@"Sensory Perception";
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
    
    textRect=CGRectMake(kInitialSpace*9,pdfyPos, 924, kEachLineHight);
    returnedArray =[ch setReviewassessFields:entry_no ];

    if([returnedArray count] > 8){
        returnedString=[self checkString:[returnedArray objectAtIndex:8]];
    }
    else{
        returnedString = [NSMutableString stringWithFormat:@"-"];
    }

        //returnedString=[self checkString:[[ch setReviewassessFields:entry_no ]objectAtIndex:8]];

    
    myString=returnedString;
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];


    
    
    textHeight= [self calculateHeight:myString withfont:font].height;
    pdfyPos += textHeight+20;

    textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
    myString=@"Moisture";
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
    
    textRect=CGRectMake(kInitialSpace*9,pdfyPos, 924, kEachLineHight);
    returnedArray =[ch setReviewassessFields:entry_no ];
    
    if([returnedArray count] > 11){
        returnedString=[self checkString:[returnedArray objectAtIndex:11]];
    }
    else{
        returnedString = [NSMutableString stringWithFormat:@"-"];
    }
    myString=returnedString;
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
    
    
    
    textHeight= [self calculateHeight:myString withfont:font].height;
    pdfyPos += textHeight+20;
    
    textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
    myString=@"Friction and Shear";
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
    
    textRect=CGRectMake(kInitialSpace*9,pdfyPos, 924, kEachLineHight);
    returnedArray =[ch setReviewassessFields:entry_no ];
    
    if([returnedArray count] > 14){
        returnedString=[self checkString:[returnedArray objectAtIndex:14]];
    }
    else{
        returnedString = [NSMutableString stringWithFormat:@"-"];
    }
    myString=returnedString;
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
    
    
    textHeight= [self calculateHeight:myString withfont:font].height;
    pdfyPos += textHeight+20;
    
    textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
    myString=@"Nutrition";
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
    
    textRect=CGRectMake(kInitialSpace*9,pdfyPos, 924, kEachLineHight);
    returnedArray =[ch setReviewassessFields:entry_no ];
    
    if([returnedArray count] > 17){
        returnedString=[self checkString:[returnedArray objectAtIndex:17]];
    }
    else{
        returnedString = [NSMutableString stringWithFormat:@"-"];
    }
    myString=returnedString;
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
    

    
    textHeight= [self calculateHeight:myString withfont:font].height;
    pdfyPos += textHeight+20;
    
    textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
    myString=@"Tissue Perfusion and Oxygenation";
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
    
    textRect=CGRectMake(kInitialSpace*9,pdfyPos, 924, kEachLineHight);
    returnedArray =[ch setReviewassessFields:entry_no ];
    
    if([returnedArray count] > 20){
        returnedString=[self checkString:[returnedArray objectAtIndex:20]];
    }
    else{
        returnedString = [NSMutableString stringWithFormat:@"-"];
    }
    myString=returnedString;
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
    
    textHeight= [self calculateHeight:myString withfont:font].height;
    pdfyPos += textHeight+20;
    
    textRect=CGRectMake(kInitialSpace*4.5,pdfyPos, 924, kEachLineHight);
    myString=@"Patient's Braden Score";
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blueColor],NSParagraphStyleAttributeName:style}];
    
    textRect=CGRectMake(kInitialSpace*9,pdfyPos, 924, kEachLineHight);
    returnedArray =[ch setReviewassessFields:entry_no ];
    
    if([returnedArray count] > 21){
        returnedString=[self checkString:[returnedArray objectAtIndex:21]];
    }
    else{
        returnedString = [NSMutableString stringWithFormat:@"-"];
    }
    myString=returnedString;
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blueColor],NSParagraphStyleAttributeName:style}];
    
    font=[UIFont fontWithName:@"Helvetica" size:25];
    textHeight= [self calculateHeight:myString withfont:font].height;
    pdfyPos += textHeight+20;
    
    textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
    myString=@"Education";
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor redColor],NSParagraphStyleAttributeName:style}];


    font=[UIFont fontWithName:@"Helvetica" size:20];
    textHeight= [self calculateHeight:myString withfont:font].height;
    pdfyPos += textHeight+20;
    
    
    textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
    
    returnedArray =[ch setEducationFields:entry_no ];
    
    if([returnedArray count] > 0){
        returnedString=[self checkString:[returnedArray objectAtIndex:0]];
    }
    else{
        returnedString = [NSMutableString stringWithFormat:@"-"];
    }
    
    myString=[NSString stringWithFormat:@"Discussed: %@",returnedString];
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
     if([returnedArray count] > 0){
    if ([[[ch setEducationFields:entry_no ]objectAtIndex:0] containsString:@"Other"]) {
        
        textHeight= [self calculateHeight:myString withfont:font].height;
        pdfyPos += textHeight+20;
        
        
        textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
        returnedArray =[ch setEducationFields:entry_no ];
        
        if([returnedArray count] > 8){
            returnedString=[self checkString:[returnedArray objectAtIndex:8]];
        }
        else{
            returnedString = [NSMutableString stringWithFormat:@"-"];
        }
        
        myString=[NSString stringWithFormat:@"Other Value: %@",returnedString];
        [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
    }
     }
    
    
    
    
    
    
    textHeight= [self calculateHeight:myString withfont:font].height;
    pdfyPos += textHeight+20;
    
    
    textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
    returnedArray =[ch setEducationFields:entry_no ];
    
    if([returnedArray count] > 1){
        returnedString=[self checkString:[returnedArray objectAtIndex:1]];
    }
    else{
        returnedString = [NSMutableString stringWithFormat:@"-"];
    }
    myString=[NSString stringWithFormat:@"Method Used: %@",returnedString];
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];

     if([returnedArray count] > 1){
    if ([[[ch setEducationFields:entry_no ]objectAtIndex:1] containsString:@"Other health care provider"]) {
        
        textHeight= [self calculateHeight:myString withfont:font].height;
        pdfyPos += textHeight+20;
        
        
        textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
        returnedArray =[ch setEducationFields:entry_no ];
        
        if([returnedArray count] > 9){
            returnedString=[self checkString:[returnedArray objectAtIndex:9]];
        }
        else{
            returnedString = [NSMutableString stringWithFormat:@"-"];
        }
    
        myString=[NSString stringWithFormat:@"Other Health Care Provider: %@",returnedString];
        [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
    }
    
     }
    textHeight= [self calculateHeight:myString withfont:font].height;
    pdfyPos += textHeight+20;
    
    
    textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
    returnedArray =[ch setEducationFields:entry_no ];
    
    if([returnedArray count] > 2){
        returnedString=[self checkString:[returnedArray objectAtIndex:2]];
    }
    else{
        returnedString = [NSMutableString stringWithFormat:@"-"];
    }
    
    myString=[NSString stringWithFormat:@"Handout: %@",returnedString];
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
    
    if([returnedArray count] > 2){

    if ([[[ch setEducationFields:entry_no ]objectAtIndex:2] containsString:@"Other"]) {
        
        textHeight= [self calculateHeight:myString withfont:font].height;
        pdfyPos += textHeight+20;
        
        
        textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
        returnedArray =[ch setEducationFields:entry_no ];
        
        if([returnedArray count] > 10){
            returnedString=[self checkString:[returnedArray objectAtIndex:10]];
        }
        else{
            returnedString = [NSMutableString stringWithFormat:@"-"];
        }
        myString=[NSString stringWithFormat:@"Other Value: %@",returnedString];
        [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
    }
    }
    
    
    textHeight= [self calculateHeight:myString withfont:font].height;
    pdfyPos += textHeight+20;
    
 
    textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
    returnedArray =[ch setEducationFields:entry_no ];
    
    if([returnedArray count] > 3){
        returnedString=[self checkString:[returnedArray objectAtIndex:3]];
    }
    else{
        returnedString = [NSMutableString stringWithFormat:@"-"];
    }

    myString=[NSString stringWithFormat:@"person Taught: %@",returnedString];
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
    
    if([returnedArray count] > 3){

    if ([[[ch setEducationFields:entry_no ]objectAtIndex:3] containsString:@"Other"]) {
        
        textHeight= [self calculateHeight:myString withfont:font].height;
        pdfyPos += textHeight+20;
        
        
        textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
        returnedArray =[ch setEducationFields:entry_no ];
        
        if([returnedArray count] > 11){
            returnedString=[self checkString:[returnedArray objectAtIndex:11]];
        }
        else{
            returnedString = [NSMutableString stringWithFormat:@"-"];
        }
        myString=[NSString stringWithFormat:@"Other Value: %@",returnedString];
        [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
    }
    }
    
    textHeight= [self calculateHeight:myString withfont:font].height;
    pdfyPos += textHeight+20;
    
    textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
    returnedArray =[ch setEducationFields:entry_no ];
    
    if([returnedArray count] > 4){
        returnedString=[self checkString:[returnedArray objectAtIndex:4]];
    }
    else{
        returnedString = [NSMutableString stringWithFormat:@"-"];
    }
    myString=[NSString stringWithFormat:@"Comprehension: %@",returnedString];
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
    
    
    
    
    textHeight= [self calculateHeight:myString withfont:font].height;
    pdfyPos += textHeight+20;
    
    
    textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
    returnedArray =[ch setEducationFields:entry_no ];
    
    if([returnedArray count] > 5){
        returnedString=[self checkString:[returnedArray objectAtIndex:5]];
    }
    else{
        returnedString = [NSMutableString stringWithFormat:@"-"];
    }
    myString=[NSString stringWithFormat:@"Teaching Assessment: %@",returnedString];
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
    
    
    if([returnedArray count] > 5){
    if ([[[ch setEducationFields:entry_no ]objectAtIndex:5] containsString:@"Other"]) {
        
        textHeight= [self calculateHeight:myString withfont:font].height;
        pdfyPos += textHeight+20;
        
        
        textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
        
        returnedArray =[ch setEducationFields:entry_no ];
        
        if([returnedArray count] > 13){
            returnedString=[self checkString:[returnedArray objectAtIndex:13]];
        }
        else{
            returnedString = [NSMutableString stringWithFormat:@"-"];
        }
        myString=[NSString stringWithFormat:@"Other Value: %@",returnedString];
        [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
    }
    }
    
    
    
    textHeight= [self calculateHeight:myString withfont:font].height;
    pdfyPos += textHeight+20;
    

    textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
    returnedArray =[ch setEducationFields:entry_no ];
    
    if([returnedArray count] > 6){
        returnedString=[self checkString:[returnedArray objectAtIndex:6]];
    }
    else{
        returnedString = [NSMutableString stringWithFormat:@"-"];
    }
   
    myString=[NSString stringWithFormat:@"Time Spent Teaching: %@",returnedString];
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
    
    
 
    textRect=CGRectMake(kInitialSpace*5.5,pdfyPos, 924, kEachLineHight);
    returnedArray =[ch setEducationFields:entry_no ];
    
    if([returnedArray count] > 14){
        returnedString=[self checkString:[returnedArray objectAtIndex:14]];
    }
    
    myString=returnedString;
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
    

    
    
    
    textHeight= [self calculateHeight:myString withfont:font].height;
    pdfyPos += textHeight+20;
    
    
    textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
    returnedArray =[ch setEducationFields:entry_no ];
    
    if([returnedArray count] > 7){
        returnedString=[self checkString:[returnedArray objectAtIndex:7]];
    }
    else{
        returnedString = [NSMutableString stringWithFormat:@"-"];
    }
    
    myString=[NSString stringWithFormat:@"Other: %@",returnedString];
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
    

    
    font=[UIFont fontWithName:@"Helvetica" size:25];
    textHeight= [self calculateHeight:myString withfont:font].height;
    pdfyPos += textHeight+20;
    
    
    textRect=CGRectMake(kInitialSpace, pdfyPos, 924, kEachLineHight);
    myString=@"Treatment";
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor redColor]}];
    
    
    
    font=[UIFont fontWithName:@"Helvetica" size:20];
    textHeight= [self calculateHeight:myString withfont:font].height;
    pdfyPos += textHeight+20;
    
    
    textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
    
    returnedArray =[ch setTreatmentFields:entry_no ];
    
    if([returnedArray count] > 0){
        returnedString=[self checkString:[returnedArray objectAtIndex:0]];
    }
    else{
        returnedString = [NSMutableString stringWithFormat:@"-"];
    }
    
    myString=[NSString stringWithFormat:@"Cleansing/Irrigation: %@",returnedString];
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
    if([returnedArray count] > 0){
        if ([[[ch setTreatmentFields:entry_no ]objectAtIndex:0] containsString:@"Other"]) {
            
            textHeight= [self calculateHeight:myString withfont:font].height;
            pdfyPos += textHeight+20;
            
            
            textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
            returnedArray =[ch setTreatmentFields:entry_no ];
            
            if([returnedArray count] > 6){
                returnedString=[self checkString:[returnedArray objectAtIndex:6]];
            }
            else{
                returnedString = [NSMutableString stringWithFormat:@"-"];
            }
            
            myString=[NSString stringWithFormat:@"Other Value: %@",returnedString];
            [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
        }
    }
    

    
    
    
    font=[UIFont fontWithName:@"Helvetica" size:20];
    textHeight= [self calculateHeight:myString withfont:font].height;
    pdfyPos += textHeight+20;
    
    
    textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
    
    returnedArray =[ch setTreatmentFields:entry_no ];
    
    if([returnedArray count] >1){
        returnedString=[self checkString:[returnedArray objectAtIndex:1]];
    }
    else{
        returnedString = [NSMutableString stringWithFormat:@"-"];
    }
    
    myString=[NSString stringWithFormat:@"Dressing/Care: %@",returnedString];
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
    if([returnedArray count] > 0){
        if ([[[ch setTreatmentFields:entry_no ]objectAtIndex:1] containsString:@"Other"]) {
            
            textHeight= [self calculateHeight:myString withfont:font].height;
            pdfyPos += textHeight+20;
            
            
            textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
            returnedArray =[ch setTreatmentFields:entry_no ];
            
            if([returnedArray count] > 7){
                returnedString=[self checkString:[returnedArray objectAtIndex:7]];
            }
            else{
                returnedString = [NSMutableString stringWithFormat:@"-"];
            }
            
            myString=[NSString stringWithFormat:@"Other Value: %@",returnedString];
            [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
        }
    }
    
    
    
    font=[UIFont fontWithName:@"Helvetica" size:20];
    textHeight= [self calculateHeight:myString withfont:font].height;
    pdfyPos += textHeight+20;
    
    
    textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
    
    returnedArray =[ch setTreatmentFields:entry_no ];
    
    if([returnedArray count] >2){
        returnedString=[self checkString:[returnedArray objectAtIndex:2]];
    }
    else{
        returnedString = [NSMutableString stringWithFormat:@"-"];
    }
    
    myString=[NSString stringWithFormat:@"Neagtive Pressure Wound: %@",returnedString];
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
    
    font=[UIFont fontWithName:@"Helvetica" size:20];
    textHeight= [self calculateHeight:myString withfont:font].height;
    pdfyPos += textHeight+20;
    
    
    textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
    
    returnedArray =[ch setTreatmentFields:entry_no ];
    
    if([returnedArray count] >3){
        returnedString=[self checkString:[returnedArray objectAtIndex:3]];
    }
    else{
        returnedString = [NSMutableString stringWithFormat:@"-"];
    }
    
    myString=[NSString stringWithFormat:@"Debridement: %@",returnedString];
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
    

    font=[UIFont fontWithName:@"Helvetica" size:20];
    textHeight= [self calculateHeight:myString withfont:font].height;
    pdfyPos += textHeight+20;
    
    
    textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
    
    returnedArray =[ch setTreatmentFields:entry_no ];
    
    if([returnedArray count] >4){
        returnedString=[self checkString:[returnedArray objectAtIndex:4]];
    }
    else{
        returnedString = [NSMutableString stringWithFormat:@"-"];
    }
    
    myString=[NSString stringWithFormat:@"Skin Care: %@",returnedString];
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];

    
    
    textHeight= [self calculateHeight:myString withfont:font].height;
    pdfyPos += textHeight+20;
    
    
    textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
    returnedArray =[ch setTreatmentFields:entry_no ];
    
    if([returnedArray count] > 5){
        returnedString=[self checkString:[returnedArray objectAtIndex:5]];
    }
    else{
        returnedString = [NSMutableString stringWithFormat:@"-"];
    }
    
    myString=[NSString stringWithFormat:@"Other: %@",returnedString];
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
    
    
    
    font=[UIFont fontWithName:@"Helvetica" size:25];
    textHeight= [self calculateHeight:myString withfont:font].height;
    pdfyPos += textHeight+20;
    
    
    textRect=CGRectMake(kInitialSpace, pdfyPos, 924, kEachLineHight);
    myString=@"Recommendations";
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor redColor]}];

    
    
    font=[UIFont fontWithName:@"Helvetica" size:20];
    textHeight= [self calculateHeight:myString withfont:font].height;
    pdfyPos += textHeight+20;
    textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
    returnedArray =[ch setRecommendationFields:entry_no ];
    
    if([returnedArray count] > 11){
        returnedString=[self checkString:[returnedArray objectAtIndex:11]];
    }
    else{
        returnedString = [NSMutableString stringWithFormat:@"-"];
    }
    
    myString=[NSString stringWithFormat:@"Label Type Obtained From: %@",returnedString];
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
    
    
    font=[UIFont fontWithName:@"Helvetica" size:20];
    textHeight= [self calculateHeight:myString withfont:font].height;
    pdfyPos += textHeight+20;
    textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
    returnedArray =[ch setRecommendationFields:entry_no ];
    
    if([returnedArray count] > 1){
        returnedString=[self checkString:[returnedArray objectAtIndex:1]];
    }
    else{
        returnedString = [NSMutableString stringWithFormat:@"-"];
    }
    
    myString=[NSString stringWithFormat:@"Deitician Referral: %@",returnedString];
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
    

    font=[UIFont fontWithName:@"Helvetica" size:20];
    textHeight= [self calculateHeight:myString withfont:font].height;
    pdfyPos += textHeight+20;
    textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
    returnedArray =[ch setRecommendationFields:entry_no ];
    
    if([returnedArray count] > 2){
        returnedString=[self checkString:[returnedArray objectAtIndex:2]];
    }
    else{
        returnedString = [NSMutableString stringWithFormat:@"-"];
    }
    
    myString=[NSString stringWithFormat:@"Other: %@",returnedString];
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
    
    
    
    font=[UIFont fontWithName:@"Helvetica" size:20];
    textHeight= [self calculateHeight:myString withfont:font].height;
    pdfyPos += textHeight+20;
    textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
    returnedArray =[ch setRecommendationFields:entry_no ];
    
    if([returnedArray count] > 3){
        returnedString=[self checkString:[returnedArray objectAtIndex:3]];
    }
    else{
        returnedString = [NSMutableString stringWithFormat:@"-"];
    }
    
    myString=[NSString stringWithFormat:@"Braden Q Risk Category: %@",returnedString];
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
    

    
    
    font=[UIFont fontWithName:@"Helvetica" size:20];
    textHeight= [self calculateHeight:myString withfont:font].height;
    pdfyPos += textHeight+20;
    
    
    textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
    
    returnedArray =[ch setRecommendationFields:entry_no ];
    
    if([returnedArray count] >0){
        returnedString=[self checkString:[returnedArray objectAtIndex:0]];
    }
    else{
        returnedString = [NSMutableString stringWithFormat:@"-"];
    }
    
    myString=[NSString stringWithFormat:@"Mobility: %@",returnedString];
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
    
    
    
    font=[UIFont fontWithName:@"Helvetica" size:20];
    textHeight= [self calculateHeight:myString withfont:font].height;
    pdfyPos += textHeight+20;
    
    
    textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
    
    returnedArray =[ch setRecommendationFields:entry_no ];
    
    if([returnedArray count] >4){
        returnedString=[self checkString:[returnedArray objectAtIndex:4]];
    }
    else{
        returnedString = [NSMutableString stringWithFormat:@"-"];
    }
    
    myString=[NSString stringWithFormat:@"Activity: %@",returnedString];
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];


    font=[UIFont fontWithName:@"Helvetica" size:20];
    textHeight= [self calculateHeight:myString withfont:font].height;
    pdfyPos += textHeight+20;
    
    
    textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
    
    returnedArray =[ch setRecommendationFields:entry_no ];
    
    if([returnedArray count] >5){
        returnedString=[self checkString:[returnedArray objectAtIndex:5]];
    }
    else{
        returnedString = [NSMutableString stringWithFormat:@"-"];
    }
    
    myString=[NSString stringWithFormat:@"Sensory Perception: %@",returnedString];
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
    

    
    font=[UIFont fontWithName:@"Helvetica" size:20];
    textHeight= [self calculateHeight:myString withfont:font].height;
    pdfyPos += textHeight+20;
    
    
    textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
    
    returnedArray =[ch setRecommendationFields:entry_no ];
    
    if([returnedArray count] >6){
        returnedString=[self checkString:[returnedArray objectAtIndex:6]];
    }
    else{
        returnedString = [NSMutableString stringWithFormat:@"-"];
    }
    
    myString=[NSString stringWithFormat:@"Moisture: %@",returnedString];
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
    

    
    
    font=[UIFont fontWithName:@"Helvetica" size:20];
    textHeight= [self calculateHeight:myString withfont:font].height;
    pdfyPos += textHeight+20;
    
    
    textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
    
    returnedArray =[ch setRecommendationFields:entry_no ];
    
    if([returnedArray count] >7){
        returnedString=[self checkString:[returnedArray objectAtIndex:7]];
    }
    else{
        returnedString = [NSMutableString stringWithFormat:@"-"];
    }
    
    myString=[NSString stringWithFormat:@"Friction and Shear: %@",returnedString];
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
    

    font=[UIFont fontWithName:@"Helvetica" size:20];
    textHeight= [self calculateHeight:myString withfont:font].height;
    pdfyPos += textHeight+20;
    
    
    textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
    
    returnedArray =[ch setRecommendationFields:entry_no ];
    
    if([returnedArray count] >8){
        returnedString=[self checkString:[returnedArray objectAtIndex:8]];
    }
    else{
        returnedString = [NSMutableString stringWithFormat:@"-"];
    }
    
    myString=[NSString stringWithFormat:@"Tissue Perfusion & Oxygenation: %@",returnedString];
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
    
    
    font=[UIFont fontWithName:@"Helvetica" size:25];
    textHeight= [self calculateHeight:myString withfont:font].height;
    pdfyPos += textHeight+20;
    
    
    textRect=CGRectMake(kInitialSpace, pdfyPos, 924, kEachLineHight);
    myString=@"Follow Up";
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor redColor]}];
    

    
    font=[UIFont fontWithName:@"Helvetica" size:20];
    textHeight= [self calculateHeight:myString withfont:font].height;
    pdfyPos += textHeight+20;
    
    
    textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
    
    returnedArray =[ch setRecommendationFields:entry_no ];
    
    if([returnedArray count] >9){
        returnedString=[self checkString:[returnedArray objectAtIndex:9]];
    }
    else{
        returnedString = [NSMutableString stringWithFormat:@"-"];
    }
    
    myString=[NSString stringWithFormat:@"Follow Up: %@",returnedString];
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];


    
    if([returnedArray count] > 9){
        if ([[[ch setRecommendationFields:entry_no ]objectAtIndex:9] containsString:@"Other"]) {
            
            textHeight= [self calculateHeight:myString withfont:font].height;
            pdfyPos += textHeight+20;
            
            
            textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
            returnedArray =[ch setRecommendationFields:entry_no ];
            
            if([returnedArray count] > 23){
                returnedString=[self checkString:[returnedArray objectAtIndex:23]];
            }
            else{
                returnedString = [NSMutableString stringWithFormat:@"-"];
            }
            
            myString=[NSString stringWithFormat:@"Other Value: %@",returnedString];
            [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
        }
        else if ([[[ch setRecommendationFields:entry_no ]objectAtIndex:9] containsString:@"Appointment"])
        {
            textHeight= [self calculateHeight:myString withfont:font].height;
            pdfyPos += textHeight+20;
            
            
            textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
            returnedArray =[ch setRecommendationFields:entry_no ];
            
            if([returnedArray count] > 23){
                returnedString=[self checkString:[returnedArray objectAtIndex:23]];
                
            }
            else{
                returnedString = [NSMutableString stringWithFormat:@"-"];
            }
            
            myString=[NSString stringWithFormat:@"Appointment Made For The Date: %@",returnedString];
            [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];
        }
    }
    

    
    
    font=[UIFont fontWithName:@"Helvetica" size:20];
    textHeight= [self calculateHeight:myString withfont:font].height;
    pdfyPos += textHeight+20;
    
    
    textRect=CGRectMake(kInitialSpace,pdfyPos, 924, kEachLineHight);
    
    returnedArray =[ch setRecommendationFields:entry_no ];
    
    if([returnedArray count] >10){
        returnedString=[self checkString:[returnedArray objectAtIndex:10]];
    }
    else{
        returnedString = [NSMutableString stringWithFormat:@"-"];
    }
    
    myString=[NSString stringWithFormat:@"Time Spent With Patient: %@",returnedString];
    [myString drawInRect:textRect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:style}];

    
    
}


-(NSMutableString *)checkString:(NSMutableString *)string
{
    if ([string containsString:@"Select" ] || [string isEqualToString:@""]) {
        string = [NSMutableString stringWithFormat:@"-"];
        return string;
        
    }
    else
    {
        return string;
    }
}

-(CGSize)calculateHeight:(NSString *)string  withfont:(UIFont *)font
{
    
    
    
    CGRect text = [string boundingRectWithSize:CGSizeMake(924, kEachLineHight)
                                         options:NSStringDrawingUsesLineFragmentOrigin
                                      attributes:@{NSFontAttributeName:font}
                                         context:nil];
    
    return   text.size;

    
}


-(void)generatePDF:(NSString *)filepath{
    
    UIGraphicsBeginPDFContextToFile(filepath, CGRectZero, nil);
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGSize screenSize = rect.size;
    UIGraphicsBeginPDFPageWithInfo(CGRectMake(0,0,screenSize.width,4000), nil);
    
    [self drawText];
    UIGraphicsEndPDFContext();
    UIActionSheet* actionSheet = [[UIActionSheet alloc] initWithTitle:@"Would you like to view the generated PDF?"
                                                             delegate:self
                                                    cancelButtonTitle:@"Review"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"Submit", nil] ;
    [actionSheet showInView:self.view];
    
    
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        
        CGRect rect = [[UIScreen mainScreen] bounds];
        CGSize screenSize = rect.size;
        webView = [[UIWebView alloc] initWithFrame:CGRectMake(0,0,screenSize.width,screenSize.height)];
        
        
        NSURL *targetURL = [NSURL fileURLWithPath:filePath];
        NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
        [webView loadRequest:request];
        
        [self.view addSubview:webView];
            //[self createPDFfromUIView:webView];
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
        
        [[CoreDataHelper sharedInstance] fetchAllImages];
        [sender setImage:[UIImage imageNamed:@"imggalleryhover2013.png"] forState:UIControlStateNormal];
        [self setButtonBackground];
       gblPictureViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"PictureViewController"];
        [self.initialview addSubview:gblPictureViewController.view];
        [self addChildViewController:gblPictureViewController];
        self.delete.alpha=0;
        _btnclickobj.buttonClicked=[sender tag];
        
        
    }
    if([sender tag]==8){
        
        [self setButtonBackground];
        
        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main"
                                    
                                                             bundle:nil];
        ViewController *add =
        
        [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
        [self presentViewController:add
         
                           animated:YES
         
                         completion:nil];
        
        
        
    }
    if([sender tag] == 11)
    {
        [self setButtonBackground];
        AssignmentsViewController *assignment=[self.storyboard instantiateViewControllerWithIdentifier:@"AssignmentsViewController"];
        [self presentViewController:assignment animated:NO completion:nil];
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
- (IBAction)searchEntryNumber:(UIButton *)sender {
    BOOL found = NO;
    if([self.txtSearchEntryNumber.text intValue] > 0){
        for(int i=0;i<[[patientsDetails valueForKey:@"entry_number"]count];i++ ){
            if ([[[patientsDetails valueForKey:@"entry_number"] objectAtIndex:i] isEqualToString:self.txtSearchEntryNumber.text]) {
                found = YES;
                CoreDataHelper *helper = [CoreDataHelper sharedInstance];
                helper.imageArr = [[NSMutableDictionary alloc]init];
                helper.imageText = [[NSMutableDictionary alloc]init];
                helper.woundIdDic = [[NSMutableDictionary alloc]init];
                helper.woundName = [[NSMutableDictionary alloc]init];
                helper.woundImageName = [[NSMutableArray alloc]init];
                helper.woundCoordinates = [[NSMutableArray alloc]init];
                helper.woundNumber = [[NSMutableArray alloc]init];
                [self setButtonBackground]; //saves currently selected screen
                selectedPatientIndex = i;
                entry_no=[[patientsDetails valueForKey:@"entry_number"] objectAtIndex:i];
                self.delete.alpha=1;
                [self.human setImage:[UIImage imageNamed:@"homanhover2013.png"] forState:UIControlStateNormal];
                WoundImageViewController *tvc=[self.storyboard instantiateViewControllerWithIdentifier:@"WoundImageViewController"];
                [self.initialview addSubview:tvc.view];
                [self addChildViewController:tvc];
                _btnclickobj.buttonClicked=6;
                self.txtSearchEntryNumber.text =@"";
                NSString *pName = [[[[[[[patientsDetails valueForKey:@"patient_name"]objectAtIndex:selectedPatientIndex] stringByAppendingString:@", DOB : "] stringByAppendingString:[[patientsDetails valueForKey:@"dob"]objectAtIndex:selectedPatientIndex] ] stringByAppendingString:@" ("] stringByAppendingString:[[patientsDetails valueForKey:@"age" ]objectAtIndex:selectedPatientIndex]] stringByAppendingString:@" Y)"];
                [self.btnCurrentPatient setTitle:pName forState:UIControlStateNormal];
                
            }
        }
        if (!found) {
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Entry number Search" message:@"Entry number not found" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
    }
    else{
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Entry number Search" message:@"Search field cannot be empty" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
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

-(void)getPictureViewData{
    CoreDataHelper *helper = [CoreDataHelper sharedInstance];
    [helper.pictureImgArr removeAllObjects];
    [helper.pictureImgName removeAllObjects];
    [helper.pictureImgText removeAllObjects];
    
   
    
    if([gblPictureViewController.btn1 accessibilityValue])
        [helper.pictureImgName addObject:[gblPictureViewController.btn1 accessibilityValue]];
    else
        [helper.pictureImgName addObject:@"graycircle.png"];
    
    if([gblPictureViewController.btn2 accessibilityValue])
        [helper.pictureImgName addObject:[gblPictureViewController.btn2 accessibilityValue]];
    else
        [helper.pictureImgName addObject:@"graycircle.png"];
    
    if([gblPictureViewController.btn3 accessibilityValue])
        [helper.pictureImgName addObject:[gblPictureViewController.btn3 accessibilityValue]];
    else
        [helper.pictureImgName addObject:@"graycircle.png"];
    
    if([gblPictureViewController.btn4 accessibilityValue])
        [helper.pictureImgName addObject:[gblPictureViewController.btn4 accessibilityValue]];
    else
        [helper.pictureImgName addObject:@"graycircle.png"];
    
    if([gblPictureViewController.btn5 accessibilityValue])
        [helper.pictureImgName addObject:[gblPictureViewController.btn5 accessibilityValue]];
    else
        [helper.pictureImgName addObject:@"graycircle.png"];
    
    if([gblPictureViewController.btn6 accessibilityValue])
        [helper.pictureImgName addObject:[gblPictureViewController.btn6 accessibilityValue]];
    else
        [helper.pictureImgName addObject:@"graycircle.png"];
    
    if([gblPictureViewController.btn7 accessibilityValue])
        [helper.pictureImgName addObject:[gblPictureViewController.btn7 accessibilityValue]];
    else
        [helper.pictureImgName addObject:@"graycircle.png"];
        
   
    
    
    if([helper.selectedImageTag isEqualToString:@"1"] && helper.isCropDone)
        [helper.pictureImgArr addObject:helper.gblCroppedImage];
    else
        [helper.pictureImgArr addObject:gblPictureViewController.img1.image];
    
    if([helper.selectedImageTag isEqualToString:@"2"] && helper.isCropDone)
        [helper.pictureImgArr addObject:helper.gblCroppedImage];
    else
        [helper.pictureImgArr addObject:gblPictureViewController.img2.image];
    
    if([helper.selectedImageTag isEqualToString:@"3"] && helper.isCropDone)
        [helper.pictureImgArr addObject:helper.gblCroppedImage];
    else
        [helper.pictureImgArr addObject:gblPictureViewController.img3.image];
    
    if([helper.selectedImageTag isEqualToString:@"4"] && helper.isCropDone)
        [helper.pictureImgArr addObject:helper.gblCroppedImage];
    else
        [helper.pictureImgArr addObject:gblPictureViewController.img4.image];
    
    if([helper.selectedImageTag isEqualToString:@"5"] && helper.isCropDone)
        [helper.pictureImgArr addObject:helper.gblCroppedImage];
    else
        [helper.pictureImgArr addObject:gblPictureViewController.img5.image];
    
    if([helper.selectedImageTag isEqualToString:@"6"] && helper.isCropDone)
        [helper.pictureImgArr addObject:helper.gblCroppedImage];
    else
        [helper.pictureImgArr addObject:gblPictureViewController.img6.image];
    
    if([helper.selectedImageTag isEqualToString:@"7"] && helper.isCropDone)
        [helper.pictureImgArr addObject:helper.gblCroppedImage];
    else
        [helper.pictureImgArr addObject:gblPictureViewController.img7.image];

    helper.isCropDone = NO;
    
    [helper.pictureImgText addObject:gblPictureViewController.txtField1.text];
    [helper.pictureImgText addObject:gblPictureViewController.txtField2.text];
    [helper.pictureImgText addObject:gblPictureViewController.txtField3.text];
    [helper.pictureImgText addObject:gblPictureViewController.txtField4.text];
    [helper.pictureImgText addObject:gblPictureViewController.txtField5.text];
    [helper.pictureImgText addObject:gblPictureViewController.txtField6.text];
    [helper.pictureImgText addObject:gblPictureViewController.txtField7.text];
    
}


-(void)showCamera{
  //  gblPictureViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"PictureViewController"];
    [[CoreDataHelper sharedInstance].assessmentGlobalView addSubview:gblPictureViewController.view];
    [[CoreDataHelper sharedInstance].assessmentglobalviewcontroller addChildViewController:gblPictureViewController];
    [CoreDataHelper sharedInstance].buttonClicked = 7;
}

@end
