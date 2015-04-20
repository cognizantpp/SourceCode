//
//  WoundIdPopupViewController.m
//  WoundCare
//
//  Created by Sangeetha on 16/04/15.
//
//

#import "WoundIdPopupViewController.h"

@interface WoundIdPopupViewController ()
- (IBAction)woundIdClicked:(id)sender;

@end

@implementation WoundIdPopupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)woundIdClicked:(id)sender {
    UIButton *senderbtn = (UIButton *)sender;
    [self.delegate dismissWoundPopOver:senderbtn.currentImage labelName:senderbtn.accessibilityLabel];
}
@end
