//
//  secondviewcontroller.h
//  pic1
//
//  Created by Sujitha on 27/03/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "selectDataProtocol.h"

@interface WouldyouliketomarkVC : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *imageV1;
@property(nonatomic,weak)id<selectDataProtocol>dataDelegate;
@property(nonatomic)NSInteger *tagtobepassed;
@end
