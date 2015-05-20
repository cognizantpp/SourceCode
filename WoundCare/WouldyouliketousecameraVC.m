//
//  thirdviewcontroller.m
//  pic1
//
//  Created by Sujitha on 30/03/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import "WouldyouliketousecameraVC.h"
#import "AssessmentViewController.h"

@interface WouldyouliketousecameraVC()
@property(nonatomic,strong)AssessmentViewController *assessment;
@end



@implementation WouldyouliketousecameraVC




-(void)viewDidLoad
{
    [super viewDidLoad];
     NSLog(@"%@.......",_selectedString);
   // _assessment=[[AssessmentViewController alloc]init];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"%@.....",_selectedString);
    
    
    }
- (IBAction)cameraYes:(UIButton *)sender {
//    gblPictureViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"PictureViewController"];
//    [[CoreDataHelper sharedInstance].assessmentGlobalView addSubview:gblPictureViewController.view];
//   
//    
//    [[CoreDataHelper sharedInstance].assessmentglobalviewcontroller addChildViewController:gblPictureViewController];
   // self.delete.alpha=0;
    AssessmentViewController *assess = [[AssessmentViewController alloc]init];
    [self dismissViewControllerAnimated:NO completion:nil];
    [assess showCamera];
    
}

- (IBAction)cameraNO:(UIButton *)sender {
    

      if ([_selectedString isEqualToString: @"Gastrostomy"])
    {
         [CoreDataHelper sharedInstance].buttonClicked=12;
        [self dismissViewControllerAnimated:NO completion:nil];
         //NSLog(@"hey.......");
       
        GVC=[self.storyboard instantiateViewControllerWithIdentifier:@"gastro"];
        
        [[CoreDataHelper sharedInstance].assessmentGlobalView addSubview:GVC.view];
        
        [[CoreDataHelper sharedInstance].assessmentglobalviewcontroller addChildViewController:GVC];
       // AssessmentViewController *assessment=[[AssessmentViewController alloc]init];
       // [assessment setButtonBackground];


             //[self presentViewController:_GVC animated:YES completion:nil];
      //  _GVC.dataDelegate=self;
       
    }
    
    
    else if ([_selectedString isEqualToString: @"Ostomy"])
    {
        
        [CoreDataHelper sharedInstance].buttonClicked=14;
        //NSLog(@"hey.......");
        [self dismissViewControllerAnimated:NO completion:nil];
          OVC=[self.storyboard instantiateViewControllerWithIdentifier:@"OstomyViewController"];
        [[CoreDataHelper sharedInstance].assessmentGlobalView addSubview:OVC.view];
        [[CoreDataHelper sharedInstance].assessmentglobalviewcontroller addChildViewController:OVC];
        //AssessmentViewController *assessment=[[AssessmentViewController alloc]init];
        //[assessment setButtonBackground];
        
        //[self presentViewController:OVC animated:YES completion:nil];
        //  _GVC.dataDelegate=self;
    }
    
    else if ([_selectedString isEqualToString: @"Wound"])
    {
        //NSLog(@"hey.......");
        [self dismissViewControllerAnimated:NO completion:nil];

        WVC=[self.storyboard instantiateViewControllerWithIdentifier:@"woundreason"];
        [[CoreDataHelper sharedInstance].assessmentGlobalView addSubview:WVC.view];
        [[CoreDataHelper sharedInstance].assessmentglobalviewcontroller addChildViewController:WVC];

       // [assessmentGlobal addChildViewController:_WVC];
       // [assessmentGlobal.childViewControllers[0] removeFromSuperview];
        
        
        
        
    }


    
    
 }

@end
