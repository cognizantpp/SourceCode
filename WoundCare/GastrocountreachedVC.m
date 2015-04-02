//
//  fifthviewcontroller.m
//  pic1
//
//  Created by Sujitha on 31/03/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import "GastrocountreachedVC.h"

@implementation GastrocountreachedVC
- (IBAction)okbtnn:(UIButton *)sender {
    
    
    self.tagtobepassed3=(NSInteger *)1;
    [self.dataDelegate getTagId3:self.tagtobepassed3];

}

@end
