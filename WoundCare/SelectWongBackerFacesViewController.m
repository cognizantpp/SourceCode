//
//  SelectWongBackerFacesViewController.m
//  PainView
//
//  Created by Antony on 30/03/14.
//  Copyright (c) 2014 Cognizant. All rights reserved.
//

#import "SelectWongBackerFacesViewController.h"

@implementation SelectWongBackerFacesViewController



-(void)viewDidLoad
{
    
    [super viewDidLoad];
    
    
}



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    if ([touch view] == _faceZeroImageView) {
        
        [self.dataDelegate getPainScore:0];
        
        
             }
    
    if ([touch view] == _faceTwoimageView) {
        
        [self.dataDelegate getPainScore:(NSInteger)2];
        
        
    } if ([touch view] == _faceFourImageView) {
        
        [self.dataDelegate getPainScore:(NSInteger)4];
        
        
    } if ([touch view] == _faceSixImageView) {
        
        [self.dataDelegate getPainScore:(NSInteger )6];
        
        
    } if ([touch view] == _faceEightImageView) {
        
        [self.dataDelegate getPainScore:(NSInteger )8];
        
        
    } if ([touch view] == _faceTenImageView) {
        
        [self.dataDelegate getPainScore:(NSInteger )10];
        
        
    }
    
    
    
    
}





@end
