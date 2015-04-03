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
            [self.pain setBackgroundImage:[UIImage imageNamed:@"icon_pain.png"] forState:UIControlStateNormal];
            break;
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
        PainHomeViewController *tvc=[self.storyboard instantiateViewControllerWithIdentifier:@"PainHomeViewController"];
        [self.initialview addSubview:tvc.view];
        [self addChildViewController:tvc];
        buttonClicked=[sender tag];
        self.delete.alpha=0;
        
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
        EducationHomeViewController *tvc=[self.storyboard         instantiateViewControllerWithIdentifier:@"EducationHomeViewController"];
        [self.initialview addSubview:tvc.view];
        [self addChildViewController:tvc];
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
