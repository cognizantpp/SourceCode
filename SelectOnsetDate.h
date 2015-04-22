//
//  SelectOnsetDate.h
//  Ostomy
//
//  Created by keerthana on 17/04/15.
//  Copyright (c) 2015 keerthana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetDataProtocol.h"

@interface SelectOnsetDate : UIViewController
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
- (IBAction)doneButtonAction:(UIBarButtonItem *)sender;

@property (weak, nonatomic) IBOutlet id toolBarOutlet;



@property(nonatomic,assign)id<GetDataProtocol>dataDelegate;

@end
