//
//  WoundBedPopUpViewController.m
//  WoundView
//
//  Created by Sangeetha on 21/04/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import "WoundBedPopUpViewController.h"
#import "LengthNumberEntryViewController.h"
@interface WoundBedPopUpViewController ()
@property (strong, nonatomic)UIPopoverController *popOver;
- (IBAction)dismissWoundBedPopOver:(UIButton *)sender;
@end

@implementation WoundBedPopUpViewController
int selectedEntryButton;
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

- (IBAction)OkButtonClicked:(UIButton *)sender {
    [self dismissViewControllerAnimated:NO completion:Nil];
    
    
}

- (IBAction)percentButtonClicked:(UIButton *)sender {
    selectedEntryButton = (int)[sender tag];
    LengthNumberEntryViewController *lengthNumberEntryViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LengthNumberEntryViewController"];
    self.popOver = [[UIPopoverController alloc]initWithContentViewController:lengthNumberEntryViewController];
    lengthNumberEntryViewController.delegate = self;
    CGRect _r = [sender frame];
    
    //trect gives coordinate of sender wrt view
    
   CGRect _tRect = [sender convertRect:sender.bounds toView:self.view];
    _tRect.origin.x=_r.origin.x;
    [self.popOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
}

-(void)updateLengthEntryNumber:(NSString *)data{
    NSAttributedString *datString = [[NSAttributedString alloc]initWithString:data];
    if(selectedEntryButton == 1){
        [self.btnGranulation setAttributedTitle:datString forState:UIControlStateNormal];
    }
    else if(selectedEntryButton == 2){
        [self.btnEpithel setAttributedTitle:datString forState:UIControlStateNormal];
    }
    else if(selectedEntryButton == 3){
        [self.btnEschar setAttributedTitle:datString forState:UIControlStateNormal];
    }
    else if(selectedEntryButton == 4){
        [self.btnSlough setAttributedTitle:datString forState:UIControlStateNormal];
    }
}

-(void)OkLengthClicked{
    //[self.delegate updateWoundBed:self.btnGranulation.titleLabel.text andEpithel:self.btnEpithel.titleLabel.text andEschar:self.btnEschar.titleLabel.text andSlough:self.btnSlough.titleLabel.text];
    [self.popOver dismissPopoverAnimated:YES];
}
- (IBAction)dismissWoundBedPopOver:(UIButton *)sender {
    [self.delegate updateWoundBed:self.btnGranulation.titleLabel.text andEpithel:self.btnEpithel.titleLabel.text andEschar:self.btnEschar.titleLabel.text andSlough:self.btnSlough.titleLabel.text];
}
@end
