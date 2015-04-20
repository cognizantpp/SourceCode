//
//  SizeEntryViewController.h
//  Ostomy
//
//  Created by keerthana on 20/04/15.
//  Copyright (c) 2015 keerthana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetDataProtocol.h"

@interface SizeEntryViewController : UIViewController


- (IBAction)numberClicked:(UIButton*)sender;
@property (nonatomic, strong)NSMutableString *entryData;
@property (nonatomic, assign)id<GetDataProtocol> delegate;
- (IBAction)btnGoClicked:(id)sender;
@property(nonatomic,strong)NSString *selectedCategorySize;

@end
