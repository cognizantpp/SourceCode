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


@property(nonatomic,strong)NSMutableArray *mobilityArray;
@property(nonatomic,strong)NSMutableArray *activityArray;
@property(nonatomic,strong)NSMutableArray *sensoryArray;
@property(nonatomic,strong)NSMutableArray  *moistureArray;
@property(nonatomic,strong)NSMutableArray  *frictionArray;
@property(nonatomic,strong)NSMutableArray  *tissueArray;

@property(nonatomic,strong)UIPopoverController *followUpPopOver;
@property(nonatomic,strong)UIPopoverController *datePickerPopOver;
    
@property(nonatomic)CGRect r;
@property(nonatomic)CGRect tRect;





@end

NSArray *recommendationarray;
@implementation RecommendationHomeViewController


    



-(void)viewDidLoad{
    
    [super viewDidLoad];

    _selectRecommendationsController=[[SelectRecommendationsTableViewController alloc]init];
    _selectRecommendationsController.dataDelegate=self;
    
    CoreDataHelper *cdh=[CoreDataHelper sharedInstance];
    [cdh fetchRecommendationsSaved];
    self.mobilityArray= [cdh fetchTheRecommendationsFields:@"1"];
    self.activityArray= [cdh fetchTheRecommendationsFields:@"2"];
    self.sensoryArray= [cdh fetchTheRecommendationsFields:@"3"];
    self.moistureArray= [cdh fetchTheRecommendationsFields:@"4"];
    self.frictionArray= [cdh fetchTheRecommendationsFields:@"5"];
    self.tissueArray= [cdh fetchTheRecommendationsFields:@"6"];
    
    
    recommendationarray=[cdh setRecommendationFields:entry_no];
    NSLog(@"%@",recommendationarray);
    if(recommendationarray.count>0){
        [self.mobilityButtonOutlet setTitle:[recommendationarray objectAtIndex:0] forState:UIControlStateNormal];
        [self.activityButtonOutlet setTitle:[recommendationarray objectAtIndex:4] forState:UIControlStateNormal];
        [self.sensoryPerceptionButtonOutlet setTitle:[recommendationarray objectAtIndex:5] forState:UIControlStateNormal];
        [self.moistureButtonOutlet setTitle:[recommendationarray objectAtIndex:6] forState:UIControlStateNormal];
        [self.frictionButtonOutlet setTitle:[recommendationarray objectAtIndex:7] forState:UIControlStateNormal];
        [self.tissueperfusionButtonOutlet setTitle:[recommendationarray objectAtIndex:8] forState:UIControlStateNormal];
        [self.labelTypeObtained setText:[recommendationarray objectAtIndex:11]];
        [self.deiticianReferral setText:[recommendationarray objectAtIndex:1]];
        [self.OtherTextfield setText:[recommendationarray objectAtIndex:2]];
        [self.bradenQRiskCategory setText:[recommendationarray objectAtIndex:3]];
        [self.followUpButtonOutlet setTitle:[recommendationarray objectAtIndex:9] forState:UIControlStateNormal];
        [self.btnrecommendationNumberEntry setTitle:[recommendationarray objectAtIndex:10] forState:UIControlStateNormal];
        if([[recommendationarray objectAtIndex:9]containsString:@"Other"]){
            self.followUpOtherTextField.hidden=NO;
            [self.followUpOtherTextField setText:[recommendationarray objectAtIndex:23]];
        }
        if([[recommendationarray objectAtIndex:9]containsString:@"Appointment Made For The Date"]){
            self.dateButtonOutlet.hidden=NO;
            [self.dateButtonOutlet setTitle:[recommendationarray objectAtIndex:23] forState:UIControlStateNormal];
        }
        

    }
    
    _followUpController=[[FollowUpTableViewController alloc]init];
    _followUpController.dataDelegate=self;
    _followUpCount=0;
    
        //  _selectDateViewController=[[SelectDatePickerViewController alloc]init];
 
    
    _scrollView.delegate=self;
    [_scrollView setContentSize:CGSizeMake(1024, 1000)];
    
    
       
    self.followUpOtherTextField.delegate = self;
    
    
    self.dateButtonOutlet.userInteractionEnabled=YES;
    
    
    

    

    
}








-(void)viewDidAppear:(BOOL)animated
{
    //self.followUpOtherTextField.hidden=YES;
    //_dateButtonOutlet.hidden=YES;
  
    
 
}

-(void)getMobilityData:(NSArray *)data
{
    
    
    
    NSString *selectedData=[data componentsJoinedByString:@","];
    if ([data count]==0) {
        [self.mobilityButtonOutlet setTitle:@"Select" forState:UIControlStateNormal];

    }
    else
    {
        NSLog(@"%@",selectedData);
        _mobilityButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
        [self.mobilityButtonOutlet setTitle:selectedData forState:UIControlStateNormal];
        
        
    }
 

    
    
    
    [self.popOver dismissPopoverAnimated: YES];

    
}

-(void)getActivityData:(NSArray *)data
{
    
    NSString *selectedData=[data componentsJoinedByString:@","];
    if ([data count]==0) {
        [self.activityButtonOutlet setTitle:@"Select" forState:UIControlStateNormal];
        
    }
    else
    {
        NSLog(@"%@",selectedData);
        _activityButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
        [self.activityButtonOutlet setTitle:selectedData forState:UIControlStateNormal];

    }
    
     [self.popOver dismissPopoverAnimated: YES];
    

}

-(void)getSensoryPerceptionData:(NSArray *)data
{
    
    NSString *selectedData=[data componentsJoinedByString:@","];
    if ([data count]==0) {
        [self.sensoryPerceptionButtonOutlet setTitle:@"Select" forState:UIControlStateNormal];
        
    }
    else
    {
        NSLog(@"%@",selectedData);
        _sensoryPerceptionButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
        
        
        [self.sensoryPerceptionButtonOutlet setTitle:selectedData forState:UIControlStateNormal];

    }
    
    
    [self.popOver dismissPopoverAnimated: YES];
    
    
}
-(void)getMoistureData:(NSArray *)data
{
    
    NSString *selectedData=[data componentsJoinedByString:@","];
    if ([data count]==0) {
        [self.moistureButtonOutlet setTitle:@"Select" forState:UIControlStateNormal];
        
    }
    else
    {
        NSLog(@"%@",selectedData);
        _moistureButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
        [self.moistureButtonOutlet setTitle:selectedData forState:UIControlStateNormal];
    }
    
  
    
    [self.popOver dismissPopoverAnimated: YES];
    
}

-(void)getFrictionData:(NSArray *)data
{
    
    NSString *selectedData=[data componentsJoinedByString:@","];
    if ([data count]==0) {
        [self.frictionButtonOutlet setTitle:@"Select" forState:UIControlStateNormal];
        
    }
    else
    {NSLog(@"%@",selectedData);
        _frictionButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
        [self.frictionButtonOutlet setTitle:selectedData forState:UIControlStateNormal];

        
    }
    
    [self.popOver dismissPopoverAnimated: YES];
    

    
}

-(void)getTissueData:(NSArray *)data
{
    
    
    NSString *selectedData=[data componentsJoinedByString:@","];
    if ([data count]==0) {
        [self.tissueperfusionButtonOutlet setTitle:@"Select" forState:UIControlStateNormal];
        
    }
    else
    {
        NSLog(@"%@",selectedData);
        _tissueperfusionButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
        [self.tissueperfusionButtonOutlet setTitle:selectedData forState:UIControlStateNormal];
        

    }
    
    [self.popOver dismissPopoverAnimated: YES];
    

    
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
        case 1:
            
            self.popOver=[[UIPopoverController alloc]initWithContentViewController:_selectRecommendationsController];
            [self.popOver setPopoverContentSize:CGSizeMake(300, 300)];
            
            _selectRecommendationsController.selectedArray=_mobilityArray;
            _selectRecommendationsController.selectedString=@"Mobility";
            
            _selectRecommendationsController.array= [NSMutableArray arrayWithArray:[sender.titleLabel.text componentsSeparatedByString:@","]];
            _r = [sender frame];
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            
            [self.popOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            break;
            
        case 2:
            
            self.popOver=[[UIPopoverController alloc]initWithContentViewController:_selectRecommendationsController];
            [self.popOver setPopoverContentSize:CGSizeMake(300, 300)];
            
            _selectRecommendationsController.selectedArray=_activityArray;
            _selectRecommendationsController.selectedString=@"Activity";
            
            _selectRecommendationsController.array= [NSMutableArray arrayWithArray:[sender.titleLabel.text componentsSeparatedByString:@","]];
            _r = [sender frame];
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            
            [self.popOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            break;
        case 3:
            
            self.popOver=[[UIPopoverController alloc]initWithContentViewController:_selectRecommendationsController];
            [self.popOver setPopoverContentSize:CGSizeMake(300, 300)];
            
            _selectRecommendationsController.selectedArray=_sensoryArray;
            _selectRecommendationsController.selectedString=@"Sensory";
            
            _selectRecommendationsController.array= [NSMutableArray arrayWithArray:[sender.titleLabel.text componentsSeparatedByString:@","]];
            _r = [sender frame];
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            
            [self.popOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            break;
            
            
        case 4:
            
            self.popOver=[[UIPopoverController alloc]initWithContentViewController:_selectRecommendationsController];
            [self.popOver setPopoverContentSize:CGSizeMake(300, 300)];
            
            _selectRecommendationsController.selectedArray=_moistureArray;
            _selectRecommendationsController.selectedString=@"Moisture";
            
            _selectRecommendationsController.array= [NSMutableArray arrayWithArray:[sender.titleLabel.text componentsSeparatedByString:@","]];
            _r = [sender frame];
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            
            [self.popOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            break;
            
        case 5:
            
            self.popOver=[[UIPopoverController alloc]initWithContentViewController:_selectRecommendationsController];
            [self.popOver setPopoverContentSize:CGSizeMake(300, 300)];
            
            _selectRecommendationsController.selectedArray=_frictionArray;
            _selectRecommendationsController.selectedString=@"Friction";
            
            _selectRecommendationsController.array= [NSMutableArray arrayWithArray:[sender.titleLabel.text componentsSeparatedByString:@","]];
            _r = [sender frame];
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            
            [self.popOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            break;
            
        case 6:
            
            self.popOver=[[UIPopoverController alloc]initWithContentViewController:_selectRecommendationsController];
            [self.popOver setPopoverContentSize:CGSizeMake(300, 300)];
            
            _selectRecommendationsController.selectedArray=_tissueArray;
            _selectRecommendationsController.selectedString=@"Tissue";
            
            _selectRecommendationsController.array= [NSMutableArray arrayWithArray:[sender.titleLabel.text componentsSeparatedByString:@","]];
            _r = [sender frame];
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            
            [self.popOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            break;
        case 7:
            
            
            
            
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
    _selectDateViewController.selectedString=@"Recommendations";
    

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
