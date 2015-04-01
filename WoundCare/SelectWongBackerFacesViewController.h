//
//  SelectWongBackerFacesViewController.h
//  PainView
//
//  Created by Antony on 30/03/14.
//  Copyright (c) 2014 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetDataProtocol.h"

@interface SelectWongBackerFacesViewController : UIViewController


@property(nonatomic,assign)id<GetDataProtocol>dataDelegate;

@property (weak, nonatomic) IBOutlet UIImageView *faceZeroImageView;
@property (weak, nonatomic) IBOutlet UIImageView *faceTwoimageView;
@property (weak, nonatomic) IBOutlet UIImageView *faceFourImageView;
@property (weak, nonatomic) IBOutlet UIImageView *faceSixImageView;
@property (weak, nonatomic) IBOutlet UIImageView *faceEightImageView;
@property (weak, nonatomic) IBOutlet UIImageView *faceTenImageView;

@end
