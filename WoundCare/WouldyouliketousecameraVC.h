//
//  thirdviewcontroller.h
//  pic1
//
//  Created by Sujitha on 30/03/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GastrostomyViewController.h"
#import "OstomyViewController.h"
#import "WoundViewHomeViewController.h"
#import "WoundImageViewController.h"
GastrostomyViewController *GVC;
@class AssessmentViewController;
@interface WouldyouliketousecameraVC : UIViewController

@property(nonatomic,strong)NSString *data;
@property(nonatomic,strong)NSString *selectedString;
//@property(nonatomic,strong)GastrostomyViewController *GVC;
@property(nonatomic,strong)OstomyViewController *OVC;
@property(nonatomic,strong)WoundViewHomeViewController *WVC;

@end
