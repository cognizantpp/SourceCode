//
//  secondviewcontroller.m
//  pic1
//
//  Created by Sujitha on 27/03/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import "WouldyouliketomarkVC.h"

@implementation WouldyouliketomarkVC
- (IBAction)yescancelbutton:(UIButton *)sender {
    
    switch(sender.tag)
    
    {
        case 1: self.tagtobepassed=(NSInteger *)1;
            [self.dataDelegate getTagId:self.tagtobepassed];
            
            
        case 2: self.tagtobepassed=(NSInteger *)2;
            [self.dataDelegate getTagId:self.tagtobepassed];

            
            
            
    }
    
    
}

@end
