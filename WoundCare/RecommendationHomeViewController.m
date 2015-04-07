//
//  RecommendationHomeViewController.m
//  RecommendationsView
//
//  Created by Antony on 24/03/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import "RecommendationHomeViewController.h"

@interface  RecommendationHomeViewController()
{
    CGPoint p;
    UIStoryboard *storyBoardRecommendation;
}


@property (strong, nonatomic)UIPopoverController *popOver;
@property(nonatomic,strong)UIPopoverController *mobilityPopOver;
@property(nonatomic,strong)UIPopoverController *activityPopOver;
@property(nonatomic,strong)UIPopoverController *sensoryPopOver;
@property(nonatomic,strong)UIPopoverController *moisturePopOver;
@property(nonatomic,strong)UIPopoverController *frictionPopOver;
@property(nonatomic,strong)UIPopoverController *tissuePopOver;
@property(nonatomic,strong)UIPopoverController *followUpPopOver;
@property(nonatomic,strong)UIPopoverController *datePickerPopOver;
    
@property(nonatomic)CGRect r;
@property(nonatomic)CGRect tRect;

@end


@implementation RecommendationHomeViewController


    



-(void)viewDidLoad{
    
    [super viewDidLoad];
    
    _selectMobilityController=[[SelectMobilityTableViewController alloc]init];
    _selectMobilityController.dataDelegate=self;
    
    _selectActivityController=[[SelectRecommendationActivityTableViewController alloc]init];
    _selectActivityController.dataDelegate=self;
    
    _sensoryViewController=[[SensoryPerceptionTableViewController alloc]init];
    _sensoryViewController.dataDelegate=self;
    
    _moistureViewController=[[MoistureTableViewController alloc]init];
    _moistureViewController.dataDelegate=self;
    
    _frictionViewController=[[FrictionTableViewController alloc]init];
    _frictionViewController.dataDelegate=self;
    
    _tissueViewController=[[TissueTableViewController alloc]init];
    _tissueViewController.dataDelegate=self;
    
    
    _followUpController=[[FollowUpTableViewController alloc]init];
    _followUpController.dataDelegate=self;
    _followUpCount=0;
    
        //  _selectDateViewController=[[SelectDatePickerViewController alloc]init];
 
    
    _scrollView.delegate=self;
    
    
       
    self.followUpOtherTextField.delegate = self;
    
    
    self.dateButtonOutlet.userInteractionEnabled=YES;
    
    
    

    

    
}








-(void)viewDidAppear:(BOOL)animated
{
    self.followUpOtherTextField.hidden=YES;
    _dateButtonOutlet.hidden=YES;
  
    
 
}

-(void)getMobilityData:(NSArray *)data
{
    
    
    
    NSString *selectedData=[data componentsJoinedByString:@","];
 
    NSLog(@"%@",selectedData);
   _mobilityButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
    [self.mobilityButtonOutlet setTitle:selectedData forState:UIControlStateNormal];
    
    
    
    
    
    [self.mobilityPopOver dismissPopoverAnimated: YES];

    
}

-(void)getActivityData:(NSArray *)data
{
    
    NSString *selectedData=[data componentsJoinedByString:@","];
    
    NSLog(@"%@",selectedData);
    _activityButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
    [self.activityButtonOutlet setTitle:selectedData forState:UIControlStateNormal];
    [self.activityPopOver dismissPopoverAnimated: YES];
    

}

-(void)getSensoryPerceptionData:(NSArray *)data
{
    
    NSString *selectedData=[data componentsJoinedByString:@","];
    
    NSLog(@"%@",selectedData);
    _sensoryPerceptionButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
    
    
    [self.sensoryPerceptionButtonOutlet setTitle:selectedData forState:UIControlStateNormal];
    
    [self.sensoryPopOver dismissPopoverAnimated: YES];
    
    
}
-(void)getMoistureData:(NSArray *)data
{
    
    NSString *selectedData=[data componentsJoinedByString:@","];
    
    NSLog(@"%@",selectedData);
    _moistureButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
    [self.moistureButtonOutlet setTitle:selectedData forState:UIControlStateNormal];
    
    [self.moisturePopOver dismissPopoverAnimated: YES];
    
}

-(void)getFrictionData:(NSArray *)data
{
    
    NSString *selectedData=[data componentsJoinedByString:@","];
    
    NSLog(@"%@",selectedData);
    _frictionButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
    [self.frictionButtonOutlet setTitle:selectedData forState:UIControlStateNormal];
    
    [self.frictionPopOver dismissPopoverAnimated: YES];
    

    
}

-(void)getTissueData:(NSArray *)data
{
    
    
    NSString *selectedData=[data componentsJoinedByString:@","];
    
    NSLog(@"%@",selectedData);
    _tissueperfusionButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
    [self.tissueperfusionButtonOutlet setTitle:selectedData forState:UIControlStateNormal];
    
    
    [self.tissuePopOver dismissPopoverAnimated: YES];
    

    
}

-(void)getFollowUpData:(NSString *)data
{
        BOOL isTheObjectThere = [data isEqualToString:@"Other"];
    BOOL isDateIsThere=[data isEqualToString: @"Appointment Made For The Date"];
    
    if(isTheObjectThere )
    {
        _followUpCount++;
        
        self.followUpOtherTextField.hidden=NO;
        if (_followUpCount>1) {
            self.followUpOtherTextField.text=@"";
        }
        
    }
    else
    {
        self.followUpOtherTextField.hidden=YES;
        
    }
    
    if(isDateIsThere )
    {
    
        
        self.dateButtonOutlet.hidden=NO;
        
    }
    else
    {
        self.dateButtonOutlet.hidden=YES;
        
    }
    
    
    
    
  
    _followUpButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
    [self.followUpButtonOutlet setTitle:data forState:UIControlStateNormal];

    
    
    [self.followUpPopOver dismissPopoverAnimated: YES];
    

    
    
}

-(void)popoverController:(UIPopoverController *)popoverController willRepositionPopoverToRect:(inout CGRect *)rect inView:(inout UIView *__autoreleasing *)view
{
    
    
}

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    if (sender.contentOffset.x != 0) {
        CGPoint offset = sender.contentOffset;
        offset.x = 0;
        sender.contentOffset = offset;
        
     
        
        
        
    }
}



- (IBAction)selectButtonAction:(UIButton *)sender {
    
    switch (sender.tag) {
        case 0:
            
            self.mobilityPopOver=[[UIPopoverController alloc]initWithContentViewController:_selectMobilityController];
            [self.mobilityPopOver setPopoverContentSize:CGSizeMake(300, 300)];
                // [self.mobilityPopOver presentPopoverFromRect:[sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            
            _r = [sender frame];
            
                //trect gives coordinate of sender wrt view
            
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            
            [self.mobilityPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            
            break;
            
        case 1:
            
            self.activityPopOver=[[UIPopoverController alloc]initWithContentViewController:_selectActivityController];
            [self.activityPopOver setPopoverContentSize:CGSizeMake(300, 300)];
                // [self.activityPopOver presentPopoverFromRect:[sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            
            
            _r = [sender frame];
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            
            [self.activityPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
    
            break;
            
        case 2:
            
            self.sensoryPopOver=[[UIPopoverController alloc]initWithContentViewController:_sensoryViewController];
            [self.sensoryPopOver setPopoverContentSize:CGSizeMake(300, 300)];
                // [self.sensoryPopOver presentPopoverFromRect:[sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            
            
            _r = [sender frame];
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            
            [self.sensoryPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            break;
            
            
        case 3:
            
            self.moisturePopOver=[[UIPopoverController alloc]initWithContentViewController:_moistureViewController];
            [self.moisturePopOver setPopoverContentSize:CGSizeMake(300, 300)];
                //[self.moisturePopOver presentPopoverFromRect:[sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            
            _r = [sender frame];
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            
            [self.moisturePopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            
            break;
            
            
            
        case 4:
            
            self.frictionPopOver=[[UIPopoverController alloc]initWithContentViewController:_frictionViewController];
            [self.frictionPopOver setPopoverContentSize:CGSizeMake(300, 300)];
                //  [self.frictionPopOver presentPopoverFromRect:[sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            _r = [sender frame];
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            
            [self.frictionPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            
            break;
            
        case 5:
            
            self.tissuePopOver=[[UIPopoverController alloc]initWithContentViewController:_tissueViewController];
            [self.tissuePopOver setPopoverContentSize:CGSizeMake(300, 300)];
                //[self.tissuePopOver presentPopoverFromRect:[sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            
            _r = [sender frame];
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            
            [self.tissuePopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
           
            
            
            break;
            
        case 6:
            
            
            
            
            self.followUpPopOver=[[UIPopoverController alloc]initWithContentViewController:_followUpController];
            [self.followUpPopOver setPopoverContentSize:CGSizeMake(300, 200)];
            
            
            
            
          _r = [sender frame];
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            
            [self.followUpPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
         
            
            break;

        case 8:
            storyBoardRecommendation = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            self.recommendationsNumberEntryViewController = [storyBoardRecommendation instantiateViewControllerWithIdentifier:@"RecommendationsNumberEntryViewController"];
            self.recommendationsNumberEntryViewController.delegate=self;
            self.popOver =  [[UIPopoverController alloc]initWithContentViewController:self.recommendationsNumberEntryViewController];
            [self.popOver setPopoverContentSize:CGSizeMake(300, 250)];
            
            _r = [sender frame];
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            
            [self.popOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];

            break;

            
        default:
            
            break;
    }

}

-(void)getDate:(NSString *)date
{
    [self.dateButtonOutlet setTitle:date forState:UIControlStateNormal];
}


-(void)textFieldDidBeginEditing:(UITextField *)textField{
    p= self.scrollView.contentOffset;
    
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x, 550)];
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    self.scrollView.contentOffset =p;
    
}



- (IBAction)selectDateButtonAction:(UIButton *)sender {
    
    UIStoryboard *storyBoard=[UIStoryboard storyboardWithName:@"Main" bundle:Nil];
    _selectDateViewController=[storyBoard instantiateViewControllerWithIdentifier:@"datePicker"];
    _selectDateViewController.dataDelegate=self;
    

    self.datePickerPopOver=[[UIPopoverController alloc]initWithContentViewController:_selectDateViewController];
    [self.datePickerPopOver setPopoverContentSize:CGSizeMake(300, 300)];
    
    _r = [sender frame];
    _tRect = [sender convertRect:sender.bounds toView:self.view];
    _tRect.origin.x=_r.origin.x;
    
    [self.datePickerPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];

}

-(void)OkRecommendationsClicked{
    [self.popOver dismissPopoverAnimated:YES];
}


-(void)updateRecommendationsEntryNumber:(NSString *)entryNumber{
    [self.btnrecommendationNumberEntry setTintColor:[UIColor blackColor]];
    self.btnrecommendationNumberEntry.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
    [self.btnrecommendationNumberEntry setAttributedTitle: [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",entryNumber]] forState:UIControlStateNormal];
    
    
}
@end
