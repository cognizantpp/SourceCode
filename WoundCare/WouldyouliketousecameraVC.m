//
//  thirdviewcontroller.m
//  pic1
//
//  Created by Sujitha on 30/03/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import "WouldyouliketousecameraVC.h"

@implementation WouldyouliketousecameraVC


-(void)viewDidLoad
{
    [super viewDidLoad];
     NSLog(@"%@.......",_selectedString);
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"%@.....",_selectedString);
    
    
    }

- (IBAction)cameraNO:(UIButton *)sender {
    
    
      if ([_selectedString isEqualToString: @"Gastrostomy"])
    {
         NSLog(@"hey.......");
       
        _GVC=[self.storyboard instantiateViewControllerWithIdentifier:@"gastro"];
             [self presentViewController:_GVC animated:YES completion:nil];
      //  _GVC.dataDelegate=self;
    }
    
    
    else if ([_selectedString isEqualToString: @"Ostomy"])
    {
        NSLog(@"hey.......");
        
          _OVC=[self.storyboard instantiateViewControllerWithIdentifier:@"osto"];
        [self presentViewController:_OVC animated:YES completion:nil];
        //  _GVC.dataDelegate=self;
    }

    
    
    
    
    
}

@end
