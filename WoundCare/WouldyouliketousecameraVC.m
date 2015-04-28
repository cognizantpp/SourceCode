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

- (IBAction)cameraNO:(UIButton *)sender {
    

      if ([_selectedString isEqualToString: @"Gastrostomy"])
    {
         [CoreDataHelper sharedInstance].buttonClicked=12;
        [self dismissViewControllerAnimated:NO completion:nil];
         NSLog(@"hey.......");
       
        GVC=[self.storyboard instantiateViewControllerWithIdentifier:@"gastro"];
        
        [[CoreDataHelper sharedInstance].assessmentGlobalView addSubview:GVC.view];
        
        [[CoreDataHelper sharedInstance].assessmentglobalviewcontroller addChildViewController:GVC];

             //[self presentViewController:_GVC animated:YES completion:nil];
      //  _GVC.dataDelegate=self;
       
    }
    
    
    else if ([_selectedString isEqualToString: @"Ostomy"])
    {
        
        [CoreDataHelper sharedInstance].buttonClicked=13;
        NSLog(@"hey.......");
        [self dismissViewControllerAnimated:NO completion:nil];
          OVC=[self.storyboard instantiateViewControllerWithIdentifier:@"OstomyViewController"];
        [[CoreDataHelper sharedInstance].assessmentGlobalView addSubview:OVC.view];
        [[CoreDataHelper sharedInstance].assessmentglobalviewcontroller addChildViewController:OVC];
        [CoreDataHelper sharedInstance].buttonClicked=13;
        //[self presentViewController:OVC animated:YES completion:nil];
        //  _GVC.dataDelegate=self;
    }
    
    else if ([_selectedString isEqualToString: @"Wound"])
    {
        NSLog(@"hey.......");
        [self dismissViewControllerAnimated:NO completion:nil];

        _WVC=[self.storyboard instantiateViewControllerWithIdentifier:@"woundreason"];
        [[CoreDataHelper sharedInstance].assessmentGlobalView addSubview:_WVC.view];
        [[CoreDataHelper sharedInstance].assessmentglobalviewcontroller addChildViewController:_WVC];

       // [assessmentGlobal addChildViewController:_WVC];
       // [assessmentGlobal.childViewControllers[0] removeFromSuperview];
        
        
        
        
    }


    
    
 }

@end
