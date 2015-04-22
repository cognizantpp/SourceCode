//
//  ReviewOfSystemsHomeViewController.m
//  ReviewOfSystemsView
//
//  Created by Antony on 01/04/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import "ReviewOfSystemsHomeViewController.h"

@interface  ReviewOfSystemsHomeViewController()


@property(nonatomic,strong)UIPopoverController *riskConsultTestPopOver;

@property(nonatomic,strong)UIPopoverController *rosPopOver;



@property(nonatomic)CGRect r;
@property(nonatomic)CGRect tRect;
@property(nonatomic,strong)NSMutableArray *riskFactorArray;
@property(nonatomic,strong)NSMutableArray *consultArray;
@property(nonatomic,strong)NSMutableArray *testsArray;

@property(nonatomic,strong)NSArray *mobilityAssessmentArray;
@property(nonatomic,strong)NSArray *activityAssessmentArray;
@property(nonatomic,strong)NSArray *sensoryAssessmentArray;
@property(nonatomic,strong)NSArray *moistureAssessmentArray;
@property(nonatomic,strong)NSArray *frictionAssessmentArray;
@property(nonatomic,strong)NSArray *nutritionAssessmentArray;
@property(nonatomic,strong)NSArray *tissueAssessmentArray;

@property(nonatomic,strong)NSArray *mobilityAssessmentSubFieldArray;
@property(nonatomic,strong)NSArray *activityAssessmentSubFieldArray;
@property(nonatomic,strong)NSArray *sensoryAssessmentSubFieldArray;
@property(nonatomic,strong)NSArray *moistureAssessmentSubFieldArray;
@property(nonatomic,strong)NSArray *frictionAssessmentSubFieldArray;
@property(nonatomic,strong)NSArray *nutritionAssessmentSubFieldArray;
@property(nonatomic,strong)NSArray *tissueAssessmentSubFieldArray;


@end

@implementation ReviewOfSystemsHomeViewController

-(void)viewDidLoad{
    
    [super viewDidLoad];
    
    
    
    _selectReviewViewController=[[SelectReviewOfSystemsTableViewController alloc]init];
    _selectReviewViewController.dataDelegate=self;
    _riskFactorCount=0;
    
    
    
    _consultCount=0;
    
   
    _testsCount=0;
    
    
    _rosViewController=[[ReviewAssessmentTableViewController alloc]init];
    _rosViewController.dataDelegate=self;
    
    
    CoreDataHelper *cdh=[CoreDataHelper sharedInstance];
    self.riskFactorArray=[cdh fetchTheReviewBaseFields:@"1"];
    self.consultArray=[cdh fetchTheReviewBaseFields:@"2"];
    self.testsArray=[cdh fetchTheReviewBaseFields:@"3"];
    
    self.mobilityAssessmentArray=[cdh fetchTheReviewAssessmentFields:@"4"];
    self.activityAssessmentArray=[cdh fetchTheReviewAssessmentFields:@"5"];
    self.sensoryAssessmentArray=[cdh fetchTheReviewAssessmentFields:@"6"];
    self.moistureAssessmentArray=[cdh fetchTheReviewAssessmentFields:@"7"];
    self.frictionAssessmentArray=[cdh fetchTheReviewAssessmentFields:@"8"];
    self.nutritionAssessmentArray=[cdh fetchTheReviewAssessmentFields:@"9"];
    self.tissueAssessmentArray=[cdh fetchTheReviewAssessmentFields:@"10"];

    self.mobilityAssessmentSubFieldArray=[cdh fetchTheReviewAssessmentSubFields:@"4"];
    self.activityAssessmentSubFieldArray=[cdh fetchTheReviewAssessmentSubFields:@"5"];
    self.sensoryAssessmentSubFieldArray=[cdh fetchTheReviewAssessmentSubFields:@"6"];
    self.moistureAssessmentSubFieldArray=[cdh fetchTheReviewAssessmentSubFields:@"7"];
    self.frictionAssessmentSubFieldArray=[cdh fetchTheReviewAssessmentSubFields:@"8"];
    self.nutritionAssessmentSubFieldArray=[cdh fetchTheReviewAssessmentSubFields:@"9"];
    self.tissueAssessmentSubFieldArray=[cdh fetchTheReviewAssessmentSubFields:@"10"];
    
    _mobilityAssessmentOutlet.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 20)];
    _mobilityAssessmentOutlet.leftViewMode = UITextFieldViewModeAlways;

    _scrollView.delegate=self;
          [_scrollView setContentSize:CGSizeMake(1024, 900)];
    
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.riskFactorOtherTextField.hidden=YES;
        self.consultOtherTextField.hidden=YES;
        self.testsOtherTextField.hidden=YES;
    
   }


- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    if (sender.contentOffset.x != 0) {
        CGPoint offset = sender.contentOffset;
        offset.x = 0;
        sender.contentOffset = offset;
    }
}

-(void)getRiskFactorData:(NSArray *)data
{
    NSString *selectedData=[data componentsJoinedByString:@","];
    BOOL isTheObjectThere = [selectedData containsString:@"Other"];
    
       if(isTheObjectThere )
    {
        _riskFactorCount++;
        
        self.riskFactorOtherTextField.hidden=NO;
        if (_riskFactorCount>1) {
            self.riskFactorOtherTextField.text=@"";
        }
        
    }
    else
    {
        self.riskFactorOtherTextField.hidden=YES;
    }
    if([data count] == 0){
        [self.riskFactorButtonOutlet setTitle:@"Select" forState:UIControlStateNormal];

    }
    else{
        NSLog(@"%@",selectedData);
        _riskFactorButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
        [self.riskFactorButtonOutlet setTitle:selectedData forState:UIControlStateNormal];
        self.riskFactorButtonOutlet.titleEdgeInsets = UIEdgeInsetsMake(0, 2, 0, 0);
        

    }
    
    
    
    
    [self.riskConsultTestPopOver dismissPopoverAnimated: YES];
    

    
    
}

-(void)getConsultsData:(NSArray *)data
{
    NSString *selectedData=[data componentsJoinedByString:@","];
    BOOL isTheObjectThere = [selectedData containsString:@"Other"];
    if(isTheObjectThere )
    {
        _consultCount++;
        
        self.consultOtherTextField.hidden=NO;
        if (_consultCount>1) {
            self.consultOtherTextField.text=@"";
        }
        
    }
    else
    {
        self.consultOtherTextField.hidden=YES;
    }
    if([data count] == 0){
        [self.consultButtonOutlet setTitle:@"Select" forState:UIControlStateNormal];
        
    }
    else{
        NSLog(@"%@",selectedData);
        _consultButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
        [self.consultButtonOutlet setTitle:selectedData forState:UIControlStateNormal];
    }
    
    
    
    
    [self.riskConsultTestPopOver dismissPopoverAnimated: YES];
    
    

}
-(void)getTestsData:(NSArray *)data
{
    
    
    NSString *selectedData=[data componentsJoinedByString:@","];
    BOOL isTheObjectThere = [selectedData containsString:@"Other"];
    if(isTheObjectThere )
    {
        _testsCount++;
        
        self.testsOtherTextField.hidden=NO;
        if (_testsCount>1) {
            self.testsOtherTextField.text=@"";
        }
        
    }
    else
    {
        self.testsOtherTextField.hidden=YES;
    }
    if([data count] == 0){
        [self.testsButtonOutlet setTitle:@"Select" forState:UIControlStateNormal];
        
    }
    else{
        NSLog(@"%@",selectedData);
        _testsButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
[self.testsButtonOutlet setTitle:selectedData forState:UIControlStateNormal];    }
    
    
    
    
    
    [self.riskConsultTestPopOver dismissPopoverAnimated: YES];
    
}
-(void)getROSMobilityString:(NSString *)data andScore:(NSInteger)painScore
{
    self.mobilityButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
 
    [self.mobilityButtonOutlet setTitle:data forState:UIControlStateNormal];
    [self.rosPopOver dismissPopoverAnimated:YES];

  
    _mobilityScore.text= [NSString stringWithFormat: @"%ld", (long)painScore+1];
    _mobilityAssessmentOutlet.text=[_mobilityAssessmentSubFieldArray objectAtIndex:painScore];
    
    [self updateTotal];

}
-(void)getROSActivityString:(NSString *)data andScore:(NSInteger)painScore
{
    self.activityButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
    
    [self.activityButtonOutlet setTitle:data forState:UIControlStateNormal];
    [self.rosPopOver dismissPopoverAnimated:YES];

    
    _activityScore.text= [NSString stringWithFormat: @"%ld", (long)painScore+1];
    _activityAssessmentOutlet.text=[_activityAssessmentSubFieldArray objectAtIndex:painScore];
    [self updateTotal];

}
-(void)getROSSensoryString:(NSString *)data andScore:(NSInteger)painScore
{
    self.sensoryPerceptionButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
    
    [self.sensoryPerceptionButtonOutlet setTitle:data forState:UIControlStateNormal];
    [self.rosPopOver dismissPopoverAnimated:YES];
  
    
    _sensoryPerceptionScore.text= [NSString stringWithFormat: @"%ld", (long)painScore+1];
    _sensoryPerceptionAssessmentOutlet.text=[_sensoryAssessmentSubFieldArray objectAtIndex:painScore];
    [self updateTotal];
}
-(void)getROSMoistureString:(NSString *)data andScore:(NSInteger)painScore

{  self.moistureButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
    
    [self.moistureButtonOutlet setTitle:data forState:UIControlStateNormal];
    [self.rosPopOver dismissPopoverAnimated:YES];
    
    
    _moistureScore.text= [NSString stringWithFormat: @"%ld", (long)painScore+1];
    _moistureAsessmentOutlet.text=[_moistureAssessmentSubFieldArray objectAtIndex:painScore];
    [self updateTotal];

    
}
-(void)getROSFrictionString:(NSString *)data andScore:(NSInteger)painScore
{
    self.frictionAndShearButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
    
    [self.frictionAndShearButtonOutlet setTitle:data forState:UIControlStateNormal];
    [self.rosPopOver dismissPopoverAnimated:YES];
    
    
    _frictionScore.text= [NSString stringWithFormat: @"%ld", (long)painScore+1];
    _frictionAssessmentOutlet.text=[_frictionAssessmentSubFieldArray objectAtIndex:painScore];
    [self updateTotal];

}
-(void)getROSNutritionString:(NSString *)data andScore:(NSInteger)painScore
{
    self.nutritionButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
    
    [self.nutritionButtonOutlet setTitle:data forState:UIControlStateNormal];
    [self.rosPopOver dismissPopoverAnimated:YES];
    
    
    _nutritionScore.text= [NSString stringWithFormat: @"%ld", (long)painScore+1];
    _nutritionAssessmentOutlet.text=[_nutritionAssessmentSubFieldArray objectAtIndex:painScore];
    [self updateTotal];

}
-(void)getROSTissueString:(NSString *)data andScore:(NSInteger)painScore
{
    self.tissuePerfusionOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
    
    [self.tissuePerfusionOutlet setTitle:data forState:UIControlStateNormal];
    [self.rosPopOver dismissPopoverAnimated:YES];
    
    
    _tissueScore.text= [NSString stringWithFormat: @"%ld", (long)painScore+1];
    _tissueAssessmentOutlet.text=[_tissueAssessmentSubFieldArray objectAtIndex:painScore];
    [self updateTotal];

}

- (IBAction)selectButtonAction:(UIButton *)sender
{
    
    
    switch (sender.tag)
    {
            
        case 1:
            
            self.riskConsultTestPopOver=[[UIPopoverController alloc]initWithContentViewController:_selectReviewViewController];
            [self.riskConsultTestPopOver setPopoverContentSize:CGSizeMake(300, 300)];
            
            
            _r = [sender frame];
            
                //trect gives coordinate of sender wrt view
            
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _selectReviewViewController.selectedArray=_riskFactorArray;
            _selectReviewViewController.selectedString=@"Risk";
            
                _selectReviewViewController.array= [NSMutableArray arrayWithArray:[sender.titleLabel.text componentsSeparatedByString:@","]];
            
            [self.riskConsultTestPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            
            break;
        case 2:
        {
 
            
            
         
            
            self.riskConsultTestPopOver=[[UIPopoverController alloc]initWithContentViewController:_selectReviewViewController];
            
            [self.riskConsultTestPopOver setPopoverContentSize:CGSizeMake(300, 300)];
            
            _r = [sender frame];
            
                //trect gives coordinate of sender wrt view
            
            
            
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _selectReviewViewController.selectedArray=self.consultArray;
            _selectReviewViewController.selectedString=@"Consult";
            _selectReviewViewController.array= [NSMutableArray arrayWithArray:[sender.titleLabel.text componentsSeparatedByString:@","]];

            
            [self.riskConsultTestPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
        }
          
            break;
        case 3:
            
            self.riskConsultTestPopOver=[[UIPopoverController alloc]initWithContentViewController:_selectReviewViewController];
            [self.riskConsultTestPopOver setPopoverContentSize:CGSizeMake(300, 300)];
                            _r = [sender frame];
            
                //trect gives coordinate of sender wrt view
            
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _selectReviewViewController.selectedArray=_testsArray;
            _selectReviewViewController.selectedString=@"Tests";
            _selectReviewViewController.array=[NSMutableArray arrayWithArray:[sender.titleLabel.text componentsSeparatedByString:@","]];

            [self.riskConsultTestPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            
            break;
      

            
        default:
            
            break;
    }
    
}
- (void)updateTotal
{
 
    
    self.totalScoreTextField.text =[NSString stringWithFormat:@"%d ",[self.mobilityScore.text intValue]+[self.activityScore.text intValue]+[self.sensoryPerceptionScore.text intValue]+[self.moistureScore.text intValue]+[self.frictionScore.text intValue]+[self.nutritionScore.text intValue]+[self.tissueScore.text intValue]];
    
}
- (IBAction)SelectCategoryAction:(UIButton *)sender {
    
 
    switch (sender.tag)
    {
            
        case 4:
           
            self.rosPopOver=[[UIPopoverController alloc]initWithContentViewController:_rosViewController];
            [self.rosPopOver setPopoverContentSize:CGSizeMake(300, 200)];
 
 
            _r = [sender frame];
            
                //trect gives coordinate of sender wrt view
            
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _rosViewController.selectedCategory=@"Mobility";
            
            [self.rosPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            

            
            break;
            
            
        case 5:
            
            self.rosPopOver=[[UIPopoverController alloc]initWithContentViewController:_rosViewController];
            [self.rosPopOver setPopoverContentSize:CGSizeMake(300, 200)];
            
            
            _r = [sender frame];
            
                //trect gives coordinate of sender wrt view
            
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _rosViewController.selectedCategory=@"Activity";
            [self.rosPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            
            
            
            break;
            
        case 6:
            
            self.rosPopOver=[[UIPopoverController alloc]initWithContentViewController:_rosViewController];
            [self.rosPopOver setPopoverContentSize:CGSizeMake(300, 200)];
            
            
            _r = [sender frame];
            
                //trect gives coordinate of sender wrt view
            
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _rosViewController.selectedCategory=@"Sensory";
            [self.rosPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            
            
            
            break;
            

            
        case 7:
            
            self.rosPopOver=[[UIPopoverController alloc]initWithContentViewController:_rosViewController];
            [self.rosPopOver setPopoverContentSize:CGSizeMake(300, 200)];
            
            
            _r = [sender frame];
            
                //trect gives coordinate of sender wrt view
            
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _rosViewController.selectedCategory=@"Moisture";
            [self.rosPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            
            
            
            break;
            
        case 8:
            
            self.rosPopOver=[[UIPopoverController alloc]initWithContentViewController:_rosViewController];
            [self.rosPopOver setPopoverContentSize:CGSizeMake(300, 200)];
            
            
            _r = [sender frame];
            
                //trect gives coordinate of sender wrt view
            
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _rosViewController.selectedCategory=@"Friction";
            [self.rosPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            
            
            
            break;
            
            
        case 9:
            
            self.rosPopOver=[[UIPopoverController alloc]initWithContentViewController:_rosViewController];
            [self.rosPopOver setPopoverContentSize:CGSizeMake(300, 200)];
            
            
            _r = [sender frame];
            
                //trect gives coordinate of sender wrt view
            
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _rosViewController.selectedCategory=@"Nutrition";
            [self.rosPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            
            
            
            break;
            
        case 10:
            
            self.rosPopOver=[[UIPopoverController alloc]initWithContentViewController:_rosViewController];
            [self.rosPopOver setPopoverContentSize:CGSizeMake(300, 200)];
            
            
            _r = [sender frame];
            
                //trect gives coordinate of sender wrt view
            
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _rosViewController.selectedCategory=@"Tissue";
            [self.rosPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            break;

            default:
            break;
}



}


@end
