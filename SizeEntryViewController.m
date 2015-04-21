//
//  SizeEntryViewController.m
//  Ostomy
//
//  Created by keerthana on 20/04/15.
//  Copyright (c) 2015 keerthana. All rights reserved.
//

#import "SizeEntryViewController.h"
#import "OstomyViewController.h"

@interface SizeEntryViewController ()

@end

@implementation SizeEntryViewController

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
    NSLog(@"length %lu",(unsigned long)[_entryData length]);
    if([_entryData length] >6){
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Entry number should be only 6 digits" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
        [_entryData deleteCharactersInRange:  NSMakeRange([_entryData length]-1, 1)];
    }
    else{
        if([self.selectedCategorySize isEqualToString:@"StomaLength"])
        {
            [self.delegate updateStomaLength:_entryData];
        }
        else if ([self.selectedCategorySize isEqualToString:@"StomaWidth"])
        {
            [self.delegate updateStomaWidth:_entryData];
        }
        else if ([self.selectedCategorySize isEqualToString:@"StomaDepth"])
        {
            [self.delegate updateStomaDepth:_entryData];
        }
        else if ([self.selectedCategorySize isEqualToString:@"FistulaLength"])
        {
            [self.delegate updateFistulaLength:_entryData];
        }
        else if ([self.selectedCategorySize isEqualToString:@"FistulaWidth"])
        {
            [self.delegate updateFistulaWidth:_entryData];
        }
        else if ([self.selectedCategorySize isEqualToString:@"FistulaDepth"])
        {
            [self.delegate updateFistulaDepth:_entryData];
        }

    }
}

- (IBAction)btnGoClicked:(id)sender {
    //CoreDataHelper *coreDataHelper = [CoreDataHelper sharedInstance];
    BOOL valid = YES;//[coreDataHelper validateEntryNumber:_entryData];
    if (valid) {
        [self.delegate OkSizeClicked];
    }
    else{
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Entry number should be unique" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    [self.delegate OkSizeClicked];
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
