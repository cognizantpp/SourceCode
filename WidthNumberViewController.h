//
//  WidthNumberViewController.h
//  GastrostomyVC
//
//  Created by Sujitha on 16/04/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DismissPopOver.h"

@interface WidthNumberViewController : UIViewController<DismissPopOver>



- (IBAction)numberClickedW:(UIButton*)sender;
@property (nonatomic, assign)id<DismissPopOver> delegate;
@property (nonatomic, strong)NSMutableString *entryDataW;
- (IBAction)btnGoClickedW:(id)sender;


@end
