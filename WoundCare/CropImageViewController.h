//
//  CropImageViewController.h
//  WoundCare
//
//  Created by Sangeetha on 13/04/15.
//
//

#import <UIKit/UIKit.h>
#import "GetDataProtocol.h"

@interface CropImageViewController : UIViewController<UIGestureRecognizerDelegate>
{
    UIView *dummyView;
}
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) UIImage *imageTocrop;

@end
