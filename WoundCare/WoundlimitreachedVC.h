//
//  fourthviewcontroller.h
//  pic1
//
//  Created by Sujitha on 30/03/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "selectDataProtocol.h"

@interface WoundlimitreachedVC : UIViewController
@property(nonatomic,weak)id<selectDataProtocol>dataDelegate;
@property(nonatomic)NSInteger *tagtobepassed2;


@end
