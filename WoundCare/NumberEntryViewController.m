//
//  NumberEntryViewController.m
//  WoundCare
//
//  Created by Sangeetha on 24/03/15.
//
//

#import "NumberEntryViewController.h"
#import "AddAssignmentPopOverController.h"
#import "CoreDataHelper.h"
@interface NumberEntryViewController ()

@end

@implementation NumberEntryViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.entryData = [[NSMutableString alloc]init];
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

- (IBAction)numberClicked:(UIButton*)sender {
    
    switch (sender.tag) {
        case 11:
            [_entryData appendString:@"."];
            break;
        case 12:
            if([_entryData length] > 0)
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
        [self.delegate updateEntryNumber:_entryData];
    }
}
- (IBAction)btnGoClicked:(id)sender {
    CoreDataHelper *coreDataHelper = [CoreDataHelper sharedInstance];
    BOOL valid = [coreDataHelper validateEntryNumber:_entryData];
    if (valid) {
        [self.delegate OkClicked];
    }
    else{
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Entry number should be unique" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    [self.delegate OkClicked];
}
@end
