//
//  fourthviewcontroller.m
//  pic1
//
//  Created by Sujitha on 30/03/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import "WoundlimitreachedVC.h"

@implementation WoundlimitreachedVC






- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    
    
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
//    self.tagtobepassed2=(NSInteger *)1;
//    [self.dataDelegate getTagId2:self.tagtobepassed2];
    
    
}
- (IBAction)okbtn:(UIButton *)sender {
    self.tagtobepassed2=(NSInteger *)1;
    [self.dataDelegate getTagId2:self.tagtobepassed2];
    

}


@end
