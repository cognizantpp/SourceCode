//
//  AssignmentTypePopOverController.m
//  WoundCare
//
//  Created by Sangeetha on 24/03/15.
//
//

#import "AssignmentTypePopOverController.h"

@interface AssignmentTypePopOverController ()

@end

@implementation AssignmentTypePopOverController

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

- (IBAction)btnCancelClicked:(id)sender {
    [self.delegate OkClicked];
}

- (IBAction)btnAddClicked:(id)sender {
}
@end
