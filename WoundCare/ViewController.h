//
//  ViewController.h
//  WoundCare
//
//  Created by Sangeetha on 19/03/15.
//
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) IBOutlet UITextField *txtUserName;
@property (strong, nonatomic) IBOutlet UITextField *txtPassword;

- (IBAction)btnLoginClicked:(id)sender;
@end
