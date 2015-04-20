//
//  WidthNumberViewController.m
//  GastrostomyVC
//
//  Created by Sujitha on 16/04/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import "WidthNumberViewController.h"
#import "GastrostomyViewController.h"





@interface WidthNumberViewController ()

@end

@implementation WidthNumberViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.entryDataW = [[NSMutableString alloc]init];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)numberClickedW:(UIButton *)sender{
    
    switch (sender.tag) {
        case 11:
            [_entryDataW appendString:@"."];
            break;
        case 12:
            [_entryDataW deleteCharactersInRange:  NSMakeRange([_entryDataW length]-1, 1)];
            break;
        default:
            [_entryDataW appendString:[NSString stringWithFormat:@"%ld",(long)sender.tag]];
            break;
    }
    NSLog(@"length %lu",(unsigned long)[_entryDataW length]);
    if([_entryDataW length] >6){
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Entry number should be only 6 digits" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
        [_entryDataW deleteCharactersInRange:  NSMakeRange([_entryDataW length]-1, 1)];
    }
    else{
        [self.delegate updateEntryNumberW:_entryDataW];
    }
}
- (IBAction)btnGoClickedW:(id)sender {
    //CoreDataHelper *coreDataHelper = [CoreDataHelper sharedInstance];
    BOOL valid = YES;//[coreDataHelper validateEntryNumber:_entryData];
    if (valid) {
        [self.delegate OkClickedW];
    }
    else{
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Entry number should be unique" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    [self.delegate OkClickedW];
}
@end
