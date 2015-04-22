//
//  RecommendationsNumberEntryViewController.m
//  WoundCare
//
//  Created by Sangeetha on 07/04/15.
//
//

#import "LengthNumberEntryViewController.h"

@interface LengthNumberEntryViewController ()

@end

@implementation LengthNumberEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.entryData = [[NSMutableString alloc]init];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)numberClicked:(UIButton*)sender {
    
    switch (sender.tag) {
        case 11:
            [_entryData appendString:@"."];
            break;
        case 12:
            [_entryData deleteCharactersInRange:  NSMakeRange([_entryData length]-1, 1)];
            break;
        default:
            [_entryData appendString:[NSString stringWithFormat:@"%ld",(long)sender.tag]];
            break;
    }
    if([_entryData length] >6){
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Entry number should be only 6 digits" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
        [_entryData deleteCharactersInRange:  NSMakeRange([_entryData length]-1, 1)];
    }
    else{
        [self.delegate updateLengthEntryNumber:_entryData];
    }
}
- (IBAction)btnGoClicked:(id)sender {
    [self.delegate OkLengthClicked];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
