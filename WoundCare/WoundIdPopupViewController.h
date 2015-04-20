//
//  WoundIdPopupViewController.h
//  WoundCare
//
//  Created by Sangeetha on 16/04/15.
//
//

#import <UIKit/UIKit.h>
#import "GetDataProtocol.h"
@interface WoundIdPopupViewController : UIViewController
@property(strong, nonatomic)id<GetDataProtocol> delegate;
@end
