//
//  ViewController.h
//  pic1
//
//  Created by Sujitha on 25/03/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectWoundTypeTableViewController.h"
#import "WouldyouliketousecameraVC.h"
#import "WoundlimitreachedVC.h"
#import "gastrocountreachedVC.h"
#import "OstomyalreadyselectedVC.h"
#import "selectDataProtocol.h"


@interface WoundImageViewController : UIViewController<selectDataProtocol>

//-(void)tapDetected:(UIGestureRecognizer*)recognizer;



//-(UIView*) viewForZoomingInScrollView:(UIScrollView *)scrollView ;

@property (strong, nonatomic) IBOutlet UIImageView *imageV;
@property (nonatomic, strong) SelectWoundTypeTableViewController *popViewController;
@property (nonatomic, strong) WouldyouliketomarkVC *popViewController2;
@property (nonatomic, strong) WoundlimitreachedVC *popViewController3;
@property (nonatomic, strong) GastrocountreachedVC *popViewControlle4;
@property (nonatomic, strong) OstomyalreadyselectedVC *popViewControlle5;
@property(nonatomic,strong)NSMutableArray *WoundCordinateArray;
@property(nonatomic,strong)NSMutableArray *GastroCordinateArray;
@property(nonatomic,strong)NSMutableArray *OstoCordinateArray;
@property(nonatomic,weak)id<selectDataProtocol>dataDelegate;



@property(nonatomic,strong)WouldyouliketousecameraVC *captureImage;



@end

