//
//  SelectFlaccViewController.m
//  PainView
//
//  Created by Antony on 30/03/14.
//  Copyright (c) 2014 Cognizant. All rights reserved.
//

#import "SelectFlaccViewController.h"


@interface SelectFlaccViewController()



@property(nonatomic,strong)UIPopoverController *PopOver;

@property(nonatomic)NSInteger PainScore;
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
    

    
    _selectFlaccPropertiesViewController=[[SelectFlaccPropertiesTableViewController alloc]init];
    _selectFlaccPropertiesViewController.dataDelegate=self;
      
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
    [self.PopOver dismissPopoverAnimated:YES];
    _facePainScore=painScore;
    
    
    
}


-(void)getLegString:(NSString *)data andScore:(NSInteger)painScore
{
    
    self.legButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
    
    [self.legButtonOutlet setTitle:data forState:UIControlStateNormal];
    [self.PopOver dismissPopoverAnimated:YES];
    _legsPainScore=painScore;
        //NSLog(@"%ld",(long)_PainScore);
    
    
}

-(void)getActivityString:(NSString *)data andScore:(NSInteger)painScore
{
    
    self.activityButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
    
    [self.activityButtonOutlet setTitle:data forState:UIControlStateNormal];
    [self.PopOver dismissPopoverAnimated:YES];
    _activityPainScore=painScore;
        //  NSLog(@"%ld",(long)_PainScore);
    

}

-(void)getCryString:(NSString *)data andScore:(NSInteger)painScore
{
    
    
    self.cryButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
    
    [self.cryButtonOutlet setTitle:data forState:UIControlStateNormal];
    [self.PopOver dismissPopoverAnimated:YES];
    _cryPainScore=painScore;

    
}

-(void)getConsolabilityString:(NSString *)data andScore:(NSInteger)painScore
{
    
    self.consolabilityButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
    
    [self.consolabilityButtonOutlet setTitle:data forState:UIControlStateNormal];
    [self.PopOver dismissPopoverAnimated:YES];
    _consolabilityPainScore=painScore;
   
    

}

- (IBAction)selectButtonAction:(UIButton *)sender {
    
    
    switch (sender.tag) {
            
            
        case 1:
            
            self.PopOver=[[UIPopoverController alloc]initWithContentViewController:_selectFlaccPropertiesViewController];
            [self.PopOver setPopoverContentSize:CGSizeMake(300,135)];

            _selectFlaccPropertiesViewController.selectedCategory=@"Face";
            

            [self.PopOver presentPopoverFromRect:[sender frame]inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            
            
            
            break;
            
        case 2:
            
            self.PopOver=[[UIPopoverController alloc]initWithContentViewController:_selectFlaccPropertiesViewController];
            [self.PopOver setPopoverContentSize:CGSizeMake(300,135)];
            _selectFlaccPropertiesViewController.selectedCategory=@"Leg";

            
            
            [self.PopOver presentPopoverFromRect:[sender frame]inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            
            
            
            break;
            
        case 3:
            
            self.PopOver=[[UIPopoverController alloc]initWithContentViewController:_selectFlaccPropertiesViewController];
            [self.PopOver setPopoverContentSize:CGSizeMake(300,135)];
            
            _selectFlaccPropertiesViewController.selectedCategory=@"Activity";
            

            [self.PopOver presentPopoverFromRect:[sender frame]inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            
            
            
            break;
            

        case 4:
            
            self.PopOver=[[UIPopoverController alloc]initWithContentViewController:_selectFlaccPropertiesViewController];
            [self.PopOver setPopoverContentSize:CGSizeMake(300,135)];
            _selectFlaccPropertiesViewController.selectedCategory=@"Cry";
            

            
            [self.PopOver presentPopoverFromRect:[sender frame]inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            
            
            
            break;
            
            
        case 5:
            
            self.PopOver=[[UIPopoverController alloc]initWithContentViewController:_selectFlaccPropertiesViewController];
            [self.PopOver setPopoverContentSize:CGSizeMake(300,135)];
            
            _selectFlaccPropertiesViewController.selectedCategory=@"Consolability";
            

            [self.PopOver presentPopoverFromRect:[sender frame]inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            
            
            
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
