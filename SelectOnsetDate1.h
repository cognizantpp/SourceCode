//
//  SelectOnsetDate.h
//  Ostomy
//
//  Created by keerthana on 17/04/15.
//  Copyright (c) 2015 keerthana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetDataProtocol.h"

@interface SelectOnsetDate1 : UIViewController

- (IBAction)doneButtonAction:(UIBarButtonItem *)sender;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *doneButtonAction;

@property (weak, nonatomic) IBOutlet id toolBarOutlet;

@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;


@property(nonatomic,assign)id<GetDataProtocol>dataDelegate;

@end
