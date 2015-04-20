//
//  AssessmentViewController.m
//  woundcare1
//
//  Created by Uthra on 25/03/15.
//  Copyright (c) 2015 CTS. All rights reserved.
//

#import "AssessmentViewController.h"

@interface AssessmentViewController (){
    long buttonClicked;
}
- (IBAction)buttonClciked:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *baseView;
@property (weak, nonatomic) IBOutlet UIView *initialview;
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
- (IBAction)btnPatientInfoClicked:(id)sender;

@end
NSString *timespentother;
@implementation AssessmentViewController
PainHomeViewController *painController;
EducationHomeViewController *educationHomeviewcontroller;
TreatmentHomeViewController *treatmentHomeViewController;
RecommendationHomeViewController *recommendationHomeViewController;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
        
    buttonClicked=6;
    [self.human setImage:[UIImage imageNamed:@"homanhover2013.png"] forState:UIControlStateNormal];
    
}

-(void)viewDidAppear:(BOOL)animated{
    WoundImageViewController *tvc=[self.storyboard instantiateViewControllerWithIdentifier:@"WoundImageViewController"];
    [self.initialview addSubview:tvc.view];
    [self addChildViewController:tvc];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setButtonBackground{
    
    switch (buttonClicked) {
            
        case 1:
        {
            [self.pain setBackgroundImage:[UIImage imageNamed:@"icon_pain.png"] forState:UIControlStateNormal];
            CoreDataHelper *cdh=[CoreDataHelper sharedInstance];
            NSString *charselected_value=[NSString stringWithFormat:@"%@",painController.characterButtonOutlet.titleLabel.text];
            NSLog(@"charbutton:........ %@",painController.characterButtonOutlet.titleLabel.text);
            NSString *scoreselected_value=[NSString stringWithFormat:@"%@",painController.scoreButtonOutlet.titleLabel.text];
            [CoreDataHelper sharedInstance].painselected_value=[NSArray arrayWithObjects:charselected_value,scoreselected_value,nil];

            NSLog(@"_assignmentsViewController.entry_no   %@",entry_no );
            [cdh savePain:entry_no andCategoryid:[CoreDataHelper sharedInstance].paincategoryid andCategoryname:[CoreDataHelper sharedInstance].paincategory_name andSelectedvalue:[CoreDataHelper sharedInstance].painselected_value];
            break;
        }
        case 2:
        
            [self.review setBackgroundImage:[UIImage imageNamed:@"icon_risk.png"] forState:UIControlStateNormal];
                        break;
        
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
            [cdh saveEducation:entry_no andCategoryid:cdh.educationcategoryid andCategoryname:cdh.educationcategory_name andSelectedvalue:cdh.educationselected_value andOther:cdh.educationOthervalues];
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
            
             [cdh saveTreatment:entry_no andCategoryid:cdh.treatmentcategoryid andCategoryname:cdh.treatmentcategory_name andSelectedvalue:cdh.treatmentselected_value andOther:cdh.treatmentOthervalues];
        }
            break;
        case 5:
            [self.recommendation setBackgroundImage:[UIImage imageNamed:@"icon_recommend.png"] forState:UIControlStateNormal];
            [CoreDataHelper sharedInstance].treatmentselected_value=[NSArray arrayWithObjects:recommendationHomeViewController.mobilityButtonOutlet.titleLabel.text,nil];
            break;
        case 6:
            [self.human setImage:[UIImage imageNamed:@"human2013.png"] forState:UIControlStateNormal];
            break;
        case 7:
            [self.gallery setImage:[UIImage imageNamed:@"imggallery2013.png"] forState:UIControlStateNormal];
            break;
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
               buttonClicked=[sender tag];
        self.delete.alpha=0;
        if([CoreDataHelper sharedInstance].painselected_value.count != 0){
            NSLog(@"[selected_value objectAtIndex:0] %@",[[CoreDataHelper sharedInstance].painselected_value objectAtIndex:0]);
            [painController.characterButtonOutlet setTitle:[[CoreDataHelper sharedInstance].painselected_value objectAtIndex:0] forState:UIControlStateNormal];
            [painController.scoreButtonOutlet setTitle:[[CoreDataHelper sharedInstance].painselected_value objectAtIndex:1] forState:UIControlStateNormal];
            
        }
        
    }
    if([sender tag]==2){
        [sender setBackgroundImage:[UIImage imageNamed:@"visited.png"] forState:UIControlStateNormal];
        [self setButtonBackground];
        ReviewOfSystemsHomeViewController *tvc=[self.storyboard instantiateViewControllerWithIdentifier:@"ReviewOfSystemsHomeViewController"];
        [self.initialview addSubview:tvc.view];
        [self addChildViewController:tvc];
        buttonClicked=[sender tag];
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

        buttonClicked=[sender tag];
        self.delete.alpha=0;
        if([[CoreDataHelper sharedInstance].educationselected_value count] != 0){
            [educationHomeviewcontroller.discussedButtonOutlet setTitle:[[CoreDataHelper sharedInstance].educationselected_value objectAtIndex:0] forState:UIControlStateNormal];
            [educationHomeviewcontroller.methodUsedOutlet setTitle:[[CoreDataHelper sharedInstance].educationselected_value objectAtIndex:1] forState:UIControlStateNormal];
             [educationHomeviewcontroller.handoutOutlet setTitle:[[CoreDataHelper sharedInstance].educationselected_value objectAtIndex:2] forState:UIControlStateNormal];
             [educationHomeviewcontroller.personTaughtOutlet setTitle:[[CoreDataHelper sharedInstance].educationselected_value objectAtIndex:3] forState:UIControlStateNormal];
             [educationHomeviewcontroller.comprehensionOutlet setTitle:[[CoreDataHelper sharedInstance].educationselected_value objectAtIndex:4] forState:UIControlStateNormal];
             [educationHomeviewcontroller.teachingAssessmentOutlet setTitle:[[CoreDataHelper sharedInstance].educationselected_value objectAtIndex:5] forState:UIControlStateNormal];
             [educationHomeviewcontroller.btnEducationNumber setTitle:[[CoreDataHelper sharedInstance].educationselected_value objectAtIndex:6] forState:UIControlStateNormal];
            NSString *str=[[CoreDataHelper sharedInstance].educationselected_value objectAtIndex:7];
            [educationHomeviewcontroller.otherTextField setText:str];
            //[eduarr objectAtIndex:0]containsString:@"other"]
            if([[[CoreDataHelper sharedInstance].educationselected_value objectAtIndex:0]containsString:@"Other"])
            {
                educationHomeviewcontroller.discussedOtherTextField.hidden=NO;
                NSString *str=[[CoreDataHelper sharedInstance].educationOthervalues objectAtIndex:0];
                [educationHomeviewcontroller.discussedOtherTextField setText:str];
            }
            if([[[CoreDataHelper sharedInstance].educationselected_value objectAtIndex:1]containsString:@"Other"]){
                educationHomeviewcontroller.methodUsedOtherTextField.hidden=NO;
                NSString *str=[[CoreDataHelper sharedInstance].educationOthervalues objectAtIndex:1];
                [educationHomeviewcontroller.methodUsedOtherTextField setText:str];
            }
            if([[[CoreDataHelper sharedInstance].educationselected_value objectAtIndex:2]containsString:@"Other"]){
                educationHomeviewcontroller.handOutOtherTextField.hidden=NO;
                NSString *str=[[CoreDataHelper sharedInstance].educationOthervalues objectAtIndex:2];
                [educationHomeviewcontroller.handOutOtherTextField setText:str];
            }
            if([[[CoreDataHelper sharedInstance].educationselected_value objectAtIndex:3]containsString:@"Other"]){
                educationHomeviewcontroller.personTaughtOtherTextField.hidden=NO;
                NSString *str=[[CoreDataHelper sharedInstance].educationOthervalues objectAtIndex:3];
                [educationHomeviewcontroller.personTaughtOtherTextField setText:str];
           }
            if([[[CoreDataHelper sharedInstance].educationselected_value objectAtIndex:5]containsString:@"Other"]){
                educationHomeviewcontroller.teachingAssessmentOtherTextField.hidden=NO;
                NSString *str=[[CoreDataHelper sharedInstance].educationOthervalues objectAtIndex:5];
                [educationHomeviewcontroller.teachingAssessmentOtherTextField setText:str];
            }
            if([[CoreDataHelper sharedInstance].educationOthervalues objectAtIndex:6]){
                NSString *str=[[CoreDataHelper sharedInstance].educationOthervalues objectAtIndex:6];
                if([str isEqualToString:@"min"])
                [educationHomeviewcontroller.minButtonOutlet setSelected:YES];
                else if([str isEqualToString:@"hr"])
                    [educationHomeviewcontroller.hrButtonOutlet setSelected:YES];
            }
        }

        
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

        buttonClicked=[sender tag];
        self.delete.alpha=0;
        if([[CoreDataHelper sharedInstance].treatmentselected_value count] != 0){
            [treatmentHomeViewController.cleansingButtonOutlet setTitle:[[CoreDataHelper sharedInstance].treatmentselected_value objectAtIndex:0] forState:UIControlStateNormal];
            [treatmentHomeViewController.dressingButtonOutlet setTitle:[[CoreDataHelper sharedInstance].treatmentselected_value objectAtIndex:1] forState:UIControlStateNormal];
            [treatmentHomeViewController.negativePressureWoundButtonOutlet setTitle:[[CoreDataHelper sharedInstance].treatmentselected_value objectAtIndex:2] forState:UIControlStateNormal];
            NSString *str=[[CoreDataHelper sharedInstance].treatmentselected_value objectAtIndex:3];
                if([str isEqualToString:@"Yes"])
                    [treatmentHomeViewController.yesButtonOutlet setSelected:YES];
                else if([str isEqualToString:@"No"])
                    [treatmentHomeViewController.noButtonOutlet setSelected:YES];
            [treatmentHomeViewController.skinCareButtonOutlet setTitle:[[CoreDataHelper sharedInstance].treatmentselected_value objectAtIndex:4] forState:UIControlStateNormal];
            NSString *otherstr=[[CoreDataHelper sharedInstance].treatmentselected_value objectAtIndex:5];
            [educationHomeviewcontroller.otherTextField setText:otherstr];
            if([[[CoreDataHelper sharedInstance].treatmentselected_value objectAtIndex:0]containsString:@"Other"])
            {
                treatmentHomeViewController.CleansingOtherTextField.hidden=NO;
                NSString *str=[[CoreDataHelper sharedInstance].treatmentOthervalues objectAtIndex:0];
                [treatmentHomeViewController.CleansingOtherTextField setText:str];
            }
            if([[[CoreDataHelper sharedInstance].treatmentselected_value objectAtIndex:1]containsString:@"Other"]){
                treatmentHomeViewController.dressingOtherTextField.hidden=NO;
                NSString *str=[[CoreDataHelper sharedInstance].treatmentOthervalues objectAtIndex:1];
                [treatmentHomeViewController.dressingOtherTextField setText:str];
            }

            
        }
    }
    if([sender tag]==5){
        [sender setBackgroundImage:[UIImage imageNamed:@"visited.png"] forState:UIControlStateNormal];
      [self setButtonBackground];
       recommendationHomeViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"RecommendationHomeViewController"];
        [self.initialview addSubview:recommendationHomeViewController.view];
        [self addChildViewController:recommendationHomeViewController];
        [CoreDataHelper sharedInstance].recommendationcategoryid=[NSMutableArray arrayWithObjects:[NSNumber numberWithInt: recommendationHomeViewController.mobilityButtonOutlet.tag],[NSNumber numberWithInt: recommendationHomeViewController.activityButtonOutlet.tag],[NSNumber numberWithInt: recommendationHomeViewController.sensoryPerceptionButtonOutlet.tag],[NSNumber numberWithInt: recommendationHomeViewController.moistureButtonOutlet.tag],[NSNumber numberWithInt: recommendationHomeViewController.frictionButtonOutlet.tag],[NSNumber numberWithInt: recommendationHomeViewController.tissueperfusionButtonOutlet.tag],[NSNumber numberWithInt: recommendationHomeViewController.labelTypeObtained.tag],[NSNumber numberWithInt: recommendationHomeViewController.deiticianReferral.tag],[NSNumber numberWithInt: recommendationHomeViewController.OtherTextfield.tag],[NSNumber numberWithInt: recommendationHomeViewController.bradenQRiskCategory.tag],[NSNumber numberWithInt: recommendationHomeViewController.followUpButtonOutlet.tag],[NSNumber numberWithInt: recommendationHomeViewController.btnrecommendationNumberEntry.tag],nil];
        
        [CoreDataHelper sharedInstance].recommendationcategory_name=[NSArray arrayWithObjects:@"Mobility",@"Activity",@"Sensory Perception",@"Moisture",@"Friction and Shear",@"Tissue Perfusion and Oxygenation",@"Label Type Obtained From",@"Deitician Referral",@"Other",@"Braden Q Risk Category",@"Follow Up,"@"Time Spent with Patient", nil];
        
        if([[CoreDataHelper sharedInstance].recommendationselected_value count] != 0){
            [educationHomeviewcontroller.discussedButtonOutlet setTitle:[[CoreDataHelper sharedInstance].educationselected_value objectAtIndex:0] forState:UIControlStateNormal];
            
        }

        
        buttonClicked=[sender tag];
        self.delete.alpha=0;
        
    }
    if([sender tag]==6){
        self.delete.alpha=1;
        [sender setImage:[UIImage imageNamed:@"homanhover2013.png"] forState:UIControlStateNormal];
        [self setButtonBackground];
       WoundImageViewController *tvc=[self.storyboard instantiateViewControllerWithIdentifier:@"WoundImageViewController"];
        [self.initialview addSubview:tvc.view];
        [self addChildViewController:tvc];
//        NSLog(@"%d",buttonClicked);
        buttonClicked=[sender tag];
        
    }
    if([sender tag]==7){
        [sender setImage:[UIImage imageNamed:@"imggalleryhover2013.png"] forState:UIControlStateNormal];
       [self setButtonBackground];
//        FirstViewController *tvc=[self.storyboard instantiateViewControllerWithIdentifier:@"FirstViewController"];
//        [self.initialview addSubview:tvc.view];
//        [self addChildViewController:tvc];
//        NSLog(@"%d",buttonClicked);
       self.delete.alpha=0;
        buttonClicked=[sender tag];
        
    }
}
- (IBAction)btnPatientInfoClicked:(id)sender {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];

    self.patientInfoViewController = [storyBoard instantiateViewControllerWithIdentifier:@"PatientInfoViewController"];
    self.patientInfoViewController.delegate = self;
    self.popOver =  [[UIPopoverController alloc]initWithContentViewController:self.patientInfoViewController];
    [self.popOver presentPopoverFromRect:[sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
}
-(void)patientInfoOKClicked{
    [self.popOver dismissPopoverAnimated:YES];
}
@end
