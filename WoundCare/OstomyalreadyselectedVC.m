//
//  sixthviewcontroller.m
//  pic1
//
//  Created by Sujitha on 31/03/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import "OstomyalreadyselectedVC.h"

@implementation OstomyalreadyselectedVC
- (IBAction)okbtnn:(UIButton *)sender {
    
    self.tagtobepassed4=(NSInteger *)1;
    [self.dataDelegate getTagId4:self.tagtobepassed4];

}

@end
