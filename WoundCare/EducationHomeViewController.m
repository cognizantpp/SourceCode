//
//  EducationHomeViewController.m
//  EducationView
//
//  Created by Antony on 20/03/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import "EducationHomeViewController.h"

@interface EducationHomeViewController ()
@property(nonatomic,strong)UIPopoverController *discussedPopOver;
@property(nonatomic,strong)UIPopoverController *methodPopOver;
@property(nonatomic,strong)UIPopoverController *handOutPopOver;
@property(nonatomic,strong)UIPopoverController *personTaughtPopOver;
@property(nonatomic,strong)UIPopoverController *comprehensionPopOver;
@property(nonatomic,strong)UIPopoverController *teachingAssessmentPopOver;
@end

@implementation EducationHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _selectDiscussedViewController=[[SelectDiscussedTableViewController alloc]init];
    _selectDiscussedViewController.dataDelegate=self;
    _discussedCount=0;
    
    _selectMethodViewController=[[SelectMethodUsedTableViewController alloc]init];
    _selectMethodViewController.dataDelegate=self;
    _methodUsedCount=0;
    
    _handOutViewController=[[HandOutTableViewController alloc]init];
    _handOutViewController.dataDelegate=self;
    _handOutCount=0;
    
    _personTaughtViewController=[[PersonTaughtTableViewController alloc]init];
    _personTaughtViewController.dataDelegate=self;
    _personTaughtCount=0;
    
    _selectComprehensionViewController=[[SelectComprehensionTableViewController alloc]init];
    _selectComprehensionViewController.dataDelegate=self;
    
    _selectTeachingAssessmentViewController=[[SelectTeachingAssessmentTableViewController alloc]init];
    _selectTeachingAssessmentViewController.dataDelegate=self;
    _teachingAssessmentCount=0;
//    self.discussedOtherTextField.delegate = self;
//    self.methodUsedOtherTextField.delegate = self;
//    self.handOutOtherTextField.delegate = self;
//    self.personTaughtOtherTextField.delegate = self;
    self.teachingAssessmentOtherTextField.delegate = self;
    self.otherTextField.delegate = self;
    
    
}
-(void)viewDidAppear:(BOOL)animated
{
    self.discussedOtherTextField.hidden=YES;
        self.methodUsedOtherTextField.hidden=YES;
    self.handOutOtherTextField.hidden=YES;
    self.personTaughtOtherTextField.hidden=YES;
    self.teachingAssessmentOtherTextField.hidden=YES;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)getDiscussedData:(NSArray *)data
{
    NSString *selectedData=[data componentsJoinedByString:@","];
    BOOL isTheObjectThere = [selectedData containsString:@"Other"];
    if(isTheObjectThere )
    {
        _discussedCount++;
        
        self.discussedOtherTextField.hidden=NO;
        if (_discussedCount>1) {
            self.discussedOtherTextField.text=@"";
        }
        
    }
    else
    {
        self.discussedOtherTextField.hidden=YES;
    }
    NSLog(@"%@",selectedData);
    _discussedButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
    [self.discussedButtonOutlet setTitle:selectedData forState:UIControlStateNormal];
    
    
    
    
    
    [self.discussedPopOver dismissPopoverAnimated: YES];
}


-(void)getMethodEducationData:(NSArray *)data
{
    
    NSString *selectedData=[data componentsJoinedByString:@","];
    BOOL isTheObjectThere = [selectedData containsString:@"Other"];
    if(isTheObjectThere )
    {
        _methodUsedCount++;
        
        self.methodUsedOtherTextField.hidden=NO;
        if (_methodUsedCount>1) {
            self.methodUsedOtherTextField.text=@"";
        }
        
    }
    else
    {
        self.methodUsedOtherTextField.hidden=YES;
    }
    NSLog(@"%@",selectedData);
    _methodUsedOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
    [self.methodUsedOutlet setTitle:selectedData forState:UIControlStateNormal];
    
    
    
    
    
    [self.methodPopOver dismissPopoverAnimated: YES];
}


-(void)getHandOutData:(NSArray *)data
{
    NSString *selectedData=[data componentsJoinedByString:@","];
    BOOL isTheObjectThere = [selectedData containsString:@"Other"];
    if(isTheObjectThere )
    {
        _handOutCount++;
        
        self.handOutOtherTextField.hidden=NO;
        if (_handOutCount>1) {
            self.handOutOtherTextField.text=@"";
        }
        
    }
    else
    {
        self.handOutOtherTextField.hidden=YES;
    }
    NSLog(@"%@",selectedData);
    _handoutOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
    [self.handoutOutlet setTitle:selectedData forState:UIControlStateNormal];
    
    
    
    
    
    [self.handOutPopOver dismissPopoverAnimated: YES];
}
-(void)getPersonTaughtData:(NSArray *)data
{
    NSString *selectedData=[data componentsJoinedByString:@","];
    BOOL isTheObjectThere = [selectedData containsString:@"Other"];
    if(isTheObjectThere )
    {
        _personTaughtCount++;
        
        self.personTaughtOtherTextField.hidden=NO;
        if (_personTaughtCount>1) {
            self.personTaughtOtherTextField.text=@"";
        }
        
    }
    else
    {
        self.personTaughtOtherTextField.hidden=YES;
    }
    NSLog(@"%@",selectedData);
    _personTaughtOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
    [self.personTaughtOutlet setTitle:selectedData forState:UIControlStateNormal];
    
    
    
    
    
    [self.personTaughtPopOver dismissPopoverAnimated: YES];
}
-(void)getComprehensionData:(NSArray *)data
{
    NSString *selectedData=[data componentsJoinedByString:@","];
  
   
    NSLog(@"%@",selectedData);
    
    _comprehensionOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
    [self.comprehensionOutlet setTitle:selectedData forState:UIControlStateNormal];
    
    
    
    
    
    [self.comprehensionPopOver dismissPopoverAnimated: YES];
}


-(void)getTeachingAssessmentData:(NSArray *)data
{
    NSString *selectedData=[data componentsJoinedByString:@","];
    BOOL isTheObjectThere = [selectedData containsString:@"Other"];
    if(isTheObjectThere )
    {
        _teachingAssessmentCount++;
        
        self.teachingAssessmentOtherTextField.hidden=NO;
        if (_teachingAssessmentCount>1) {
            self.teachingAssessmentOtherTextField.text=@"";
        }
        
    }
    else
    {
        self.teachingAssessmentOtherTextField.hidden=YES;
    }
    NSLog(@"%@",selectedData);
    _teachingAssessmentOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
    [self.teachingAssessmentOutlet setTitle:selectedData forState:UIControlStateNormal];
    
    
    
    
    
    [self.teachingAssessmentPopOver dismissPopoverAnimated: YES];

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)selectButtonAction:(UIButton *)sender {
    switch (sender.tag) {
        case 0:
            
            self.discussedPopOver=[[UIPopoverController alloc]initWithContentViewController:_selectDiscussedViewController];
            [self.discussedPopOver setPopoverContentSize:CGSizeMake(300, 300)];
            [self.discussedPopOver presentPopoverFromRect:[sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
            
            break;
        case 1:
            
            self.methodPopOver=[[UIPopoverController alloc]initWithContentViewController:_selectMethodViewController];
            [self.methodPopOver setPopoverContentSize:CGSizeMake(300, 300)];
            [self.methodPopOver presentPopoverFromRect:[sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
            
            break;
        case 2:
            
            self.handOutPopOver=[[UIPopoverController alloc]initWithContentViewController:_handOutViewController];
            [self.handOutPopOver setPopoverContentSize:CGSizeMake(300, 300)];
            [self.handOutPopOver presentPopoverFromRect:[sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
            
            break;
            break;
        case 3:
            
            self.personTaughtPopOver=[[UIPopoverController alloc]initWithContentViewController:_personTaughtViewController];
            [self.personTaughtPopOver setPopoverContentSize:CGSizeMake(300, 300)];
            [self.personTaughtPopOver presentPopoverFromRect:[sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
            
            break;
            
            
            break;
        case 4:
            
            self.comprehensionPopOver=[[UIPopoverController alloc]initWithContentViewController:_selectComprehensionViewController];
            [self.comprehensionPopOver setPopoverContentSize:CGSizeMake(300, 300)];
            [self.comprehensionPopOver presentPopoverFromRect:[sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
            
            break;
            
            break;
        case 5:
            
            self.teachingAssessmentPopOver=[[UIPopoverController alloc]initWithContentViewController:_selectTeachingAssessmentViewController];
            [self.teachingAssessmentPopOver setPopoverContentSize:CGSizeMake(300, 300)];
            [self.teachingAssessmentPopOver presentPopoverFromRect:[sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
            
            break;
        default:
            break;
    }
}
- (IBAction)radioButtonAction:(UIButton *)sender {
    
    
    switch (sender.tag)
    {
        
        case 0:
        {
            [self.minButtonOutlet setSelected:YES];
            [self.hrButtonOutlet setSelected:NO];
        }
            break;
        
        case 1:
        {
            [self.minButtonOutlet setSelected:NO];
            [self.hrButtonOutlet setSelected:YES];
            
        }
            break;
            
        default:
        
            break;
    }
    
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    //    CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y);
    //    [self.scrollView setContentOffset:scrollPoint animated:NO];
    //[self animateTextField:textField up:YES];
    [UIView animateWithDuration:0.5
                          delay:0.1
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^
     {
         CGRect frame = self.view.frame;
         frame.origin.y = (-150);
         frame.origin.x = 0;
         self.view.frame = frame;
     }
                     completion:^(BOOL finished)
     {
         NSLog(@"Completed");
         
     }];
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    //[self.scrollView setContentOffset:CGPointZero animated:NO];
    //[self animateTextField:textField up:NO];
    [UIView animateWithDuration:0.5
                          delay:0.1
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^
     {
         CGRect frame = self.view.frame;
         frame.origin.y = 0;
         frame.origin.x = 0;
         self.view.frame = frame;
     }
                     completion:^(BOOL finished)
     {
         NSLog(@"Completed");
         
     }];
    
}

@end
