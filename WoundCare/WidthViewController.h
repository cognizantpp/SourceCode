//
//  WidthViewController.h
//  GastrostomyVC
//
//  Created by Sujitha on 16/04/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DismissPopOver.h"
@interface WidthViewController : UIViewController<DismissPopOver>
@property (strong,nonatomic)id<DismissPopOver> delegate;
@end
