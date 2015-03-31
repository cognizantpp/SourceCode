//
//  NumberEntryViewController.h
//  WoundCare
//
//  Created by Sangeetha on 24/03/15.
//
//

#import <UIKit/UIKit.h>
#import "DismissPopOver.h"
@interface NumberEntryViewController : UIViewController
- (IBAction)numberClicked:(UIButton*)sender;
@property (nonatomic, strong)id<DismissPopOver> delegate;
@property (nonatomic, strong)NSMutableString *entryData;
- (IBAction)btnGoClicked:(id)sender;

@end
