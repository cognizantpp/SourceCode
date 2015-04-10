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

@end

@implementation AssessmentViewController
PainHomeViewController *painController;
EducationHomeViewController *educationHomeviewcontroller;
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
            [self.education setBackgroundImage:[UIImage imageNamed:@"icon_education.png"] forState:UIControlStateNormal];
            break;
        case 4:
            [self.treatment setBackgroundImage:[UIImage imageNamed:@"icon_treatment.png"] forState:UIControlStateNormal];
            break;
        case 5:
            [self.recommendation setBackgroundImage:[UIImage imageNamed:@"icon_recommend.png"] forState:UIControlStateNormal];
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
//        NSMutableArray *category_id=[[NSMutableArray alloc]init];
//        category_id =[[NSString stringWithFormat:@"%ld",(long)tvc.characterButtonOutlet.tag],[NSString stringWithFormat:@"%ld",(long)tvc.scoreButtonOutlet.tag] ];
        NSString *charstring=[NSString stringWithFormat:@"%ld",(long)painController.characterButtonOutlet.tag];
        NSString *scorestring=[NSString stringWithFormat:@"%ld",(long)painController.scoreButtonOutlet.tag];
        [CoreDataHelper sharedInstance].paincategoryid=[NSArray arrayWithObjects:charstring,scorestring,nil];
        [CoreDataHelper sharedInstance].paincategory_name=[NSArray arrayWithObjects:@"Character",@"score", nil];
               buttonClicked=[sender tag];
        //flag=1;
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
        //FirstViewController *tvc=[self.storyboard instantiateViewControllerWithIdentifier:@"FirstViewController"];
        //[self.initialview addSubview:tvc.view];
        //[self addChildViewController:tvc];
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
    //    NSString *teachingassessid=[NSString stringWithFormat:@"%ld",(long)educationHomeviewcontroller.teachingAssessmentCount.tag];
   //     NSString *timespentid=[NSString stringWithFormat:@"%ld",(long)educationHomeviewcontroller..tag];
        buttonClicked=[sender tag];
        self.delete.alpha=0;
        
    }
    if([sender tag]==4){
        [sender setBackgroundImage:[UIImage imageNamed:@"visited.png"] forState:UIControlStateNormal];
        [self setButtonBackground];
        TreatmentHomeViewController *tvc=[self.storyboard instantiateViewControllerWithIdentifier:@"TreatmentHomeViewController"];
        [self.initialview addSubview:tvc.view];
        [self addChildViewController:tvc];
        buttonClicked=[sender tag];
        self.delete.alpha=0;
    }
    if([sender tag]==5){
        [sender setBackgroundImage:[UIImage imageNamed:@"visited.png"] forState:UIControlStateNormal];
      [self setButtonBackground];
       RecommendationHomeViewController *tvc=[self.storyboard instantiateViewControllerWithIdentifier:@"RecommendationHomeViewController"];
        [self.initialview addSubview:tvc.view];
        [self addChildViewController:tvc];
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
@end
