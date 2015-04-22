//
//  WoundBedPopUpViewController.h
//  WoundView
//
//  Created by Sangeetha on 21/04/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetDataProtocol.h"

@interface WoundBedPopUpViewController : UIViewController<GetDataProtocol>
- (IBAction)OkButtonClicked:(UIButton *)sender;
- (IBAction)percentButtonClicked:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnGranulation;
@property (weak, nonatomic) IBOutlet UIButton *btnEpithel;
@property (weak, nonatomic) IBOutlet UIButton *btnEschar;
@property (weak, nonatomic) IBOutlet UIButton *btnSlough;
@property (nonatomic, strong)id<GetDataProtocol> delegate;
@end
