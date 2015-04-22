//
//  NumberEntryViewController.h
//  WoundCare
//
//  Created by Sangeetha on 24/03/15.
//
//

#import <UIKit/UIKit.h>
#import "DismissPopOver.h"
@interface NumberEntryViewController1 : UIViewController<DismissPopOver>
- (IBAction)numberClicked:(UIButton*)sender;
@property (nonatomic, assign)id<DismissPopOver> delegate;
@property (nonatomic, strong)NSMutableString *entryData;
- (IBAction)btnGoClicked:(id)sender;

@end
