//
//  LengthNumberEntryViewController
//  WoundCare
//
//  Created by Sangeetha on 07/04/15.
//
//

#import <UIKit/UIKit.h>
#import "GetDataProtocol.h"
@interface LengthNumberEntryViewController : UIViewController
- (IBAction)numberClicked:(UIButton*)sender;
@property (nonatomic, strong)id<GetDataProtocol> delegate;
@property (nonatomic, strong)NSMutableString *entryData;
- (IBAction)btnGoClicked:(id)sender;

@end
