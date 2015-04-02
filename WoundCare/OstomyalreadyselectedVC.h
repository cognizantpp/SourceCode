//
//  sixthviewcontroller.h
//  pic1
//
//  Created by Sujitha on 31/03/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "selectDataProtocol.h"


@interface OstomyalreadyselectedVC : UIViewController
@property(nonatomic,weak)id<selectDataProtocol>dataDelegate;
@property(nonatomic)NSInteger *tagtobepassed4;

@end
