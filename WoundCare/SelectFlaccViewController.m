//
//  SelectFlaccViewController.m
//  PainView
//
//  Created by Antony on 30/03/14.
//  Copyright (c) 2014 Cognizant. All rights reserved.
//

#import "SelectFlaccViewController.h"


@interface SelectFlaccViewController()



@property(nonatomic,strong)UIPopoverController *facePopOver;
@property(nonatomic,strong)UIPopoverController *legsPopOver;
@property(nonatomic,strong)UIPopoverController *activityPopOver;
@property(nonatomic,strong)UIPopoverController *cryPopOver;
@property(nonatomic,strong)UIPopoverController *consolabilityPopOver;
@property(nonatomic)NSInteger facePainScore;
@property(nonatomic)NSInteger legsPainScore;
@property(nonatomic)NSInteger activityPainScore;
@property(nonatomic)NSInteger cryPainScore;
@property(nonatomic)NSInteger consolabilityPainScore;



@end


@implementation SelectFlaccViewController


-(void)viewDidLoad
{
    
    [super viewDidLoad];
    

    
    _selectFaceViewController=[[SelectFaceTableViewController alloc]init];
    _selectFaceViewController.dataDelegate=self;
    
    _selectLegViewController=[[SelectLegTableViewController alloc]init];
    _selectLegViewController.dataDelegate=self;
    
    
    _selectActivityViewController=[[SelectActivityTableViewController alloc]init];
    _selectActivityViewController.dataDelegate=self;
    
    
    _selectCryViewController=[[SelectCryTableViewController alloc]init];
    _selectCryViewController.dataDelegate=self;
    
    _consolabilityViewController=[[ConsolabilityTableViewController alloc]init];
    _consolabilityViewController.dataDelegate=self;
    
    _PainScore=0;
    _facePainScore=0;
    _legsPainScore=0;
    _cryPainScore=0;
    _activityPainScore=0;
    _consolabilityPainScore=0;
    
}

-(void)getFaceString:(NSString *)data andScore:(NSInteger )painScore

{
    self.faceButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;

    [self.faceButtonOutlet setTitle:data forState:UIControlStateNormal];
    [self.facePopOver dismissPopoverAnimated:YES];
    _facePainScore=painScore;
    
    
    
}


-(void)getLegString:(NSString *)data andScore:(NSInteger)painScore
{
    
    self.legButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
    
    [self.legButtonOutlet setTitle:data forState:UIControlStateNormal];
    [self.legsPopOver dismissPopoverAnimated:YES];
    _legsPainScore=painScore;
        //NSLog(@"%ld",(long)_PainScore);
    
    
}

-(void)getActivityString:(NSString *)data andScore:(NSInteger)painScore
{
    
    self.activityButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
    
    [self.activityButtonOutlet setTitle:data forState:UIControlStateNormal];
    [self.activityPopOver dismissPopoverAnimated:YES];
    _activityPainScore=painScore;
        //  NSLog(@"%ld",(long)_PainScore);
    

}

-(void)getCryString:(NSString *)data andScore:(NSInteger)painScore
{
    
    
    self.cryButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
    
    [self.cryButtonOutlet setTitle:data forState:UIControlStateNormal];
    [self.cryPopOver dismissPopoverAnimated:YES];
    _cryPainScore=painScore;

    
}

-(void)getConsolabilityString:(NSString *)data andScore:(NSInteger)painScore
{
    
    self.consolabilityButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
    
    [self.consolabilityButtonOutlet setTitle:data forState:UIControlStateNormal];
    [self.consolabilityPopOver dismissPopoverAnimated:YES];
    _consolabilityPainScore=painScore;
   
    

}

- (IBAction)selectButtonAction:(UIButton *)sender {
    
    
    switch (sender.tag) {
            
            
        case 1:
            
            self.facePopOver=[[UIPopoverController alloc]initWithContentViewController:_selectFaceViewController];
            [self.facePopOver setPopoverContentSize:CGSizeMake(300,135)];

            
            [self.facePopOver presentPopoverFromRect:[sender frame]inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            
            
            
            break;
            
        case 2:
            
            self.legsPopOver=[[UIPopoverController alloc]initWithContentViewController:_selectLegViewController];
            [self.legsPopOver setPopoverContentSize:CGSizeMake(300,135)];
            
            
            [self.legsPopOver presentPopoverFromRect:[sender frame]inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            
            
            
            break;
            
        case 3:
            
            self.activityPopOver=[[UIPopoverController alloc]initWithContentViewController:_selectActivityViewController];
            [self.activityPopOver setPopoverContentSize:CGSizeMake(300,135)];
            
            
            [self.activityPopOver presentPopoverFromRect:[sender frame]inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            
            
            
            break;
            

        case 4:
            
            self.cryPopOver=[[UIPopoverController alloc]initWithContentViewController:_selectCryViewController];
            [self.cryPopOver setPopoverContentSize:CGSizeMake(300,135)];
            
            
            [self.cryPopOver presentPopoverFromRect:[sender frame]inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            
            
            
            break;
            
            
        case 5:
            
            self.consolabilityPopOver=[[UIPopoverController alloc]initWithContentViewController:_consolabilityViewController];
            [self.consolabilityPopOver setPopoverContentSize:CGSizeMake(300,135)];
            
            
            [self.consolabilityPopOver presentPopoverFromRect:[sender frame]inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            
            
            
            break;
            

            
        default:
            
            break;
            
    }

    
    
    
}

- (IBAction)OkButtonAction:(UIButton *)sender {
    
    [ self.dataDelegate dismissFlaccPopOver];
    
    _PainScore=_facePainScore+_legsPainScore
    +_activityPainScore+_cryPainScore+_consolabilityPainScore;
    
    
    [self.dataDelegate getFlaccPainScore:self.PainScore];
    
    
}
@end
