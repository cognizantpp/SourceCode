//
//  NumberEntryViewController.h
//  WoundCare
//
//  Created by Sangeetha on 24/03/15.
//
//

#import <UIKit/UIKit.h>
#import "GetDataProtocol.h"
@interface NumberEntryViewController : UIViewController
- (IBAction)numberClicked:(UIButton*)sender;
@property (nonatomic, strong)id<GetDataProtocol> delegate;
@property (nonatomic, strong)NSMutableString *entryData;
- (IBAction)btnGoClicked:(id)sender;

@end
