//
//  EducationHomeViewController.m
//  EducationView
//
//  Created by Antony on 20/03/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import "EducationHomeViewController.h"

@interface EducationHomeViewController ()
{
    CGPoint p;
    UIStoryboard *storyBoardEducation;
    
}
@property (strong, nonatomic)UIPopoverController *popOver;
@property(nonatomic,strong)NSMutableArray *discussedArray;
@property(nonatomic,strong)NSMutableArray *methodArray;
@property(nonatomic,strong)NSMutableArray *handOutArray;
@property(nonatomic,strong)NSMutableArray  *personTaughtArray;
@property(nonatomic,strong)NSMutableArray *comprehensionArray;
@property(nonatomic,strong)NSMutableArray *teachingAssessmentArray;

@end
NSArray *eduarr;
@implementation EducationHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _selectEducationViewController=[[SelectEduactionTableViewController alloc]init];
    _selectEducationViewController.dataDelegate=self;
    
    
    CoreDataHelper *cdh=[CoreDataHelper sharedInstance];
    self.discussedArray=[cdh fetchTheTreatmentFields:@"1"];
     self.methodArray= [cdh fetchTheEducationFields:@"2"];
      self.handOutArray= [cdh fetchTheEducationFields:@"3"];
      self.personTaughtArray= [cdh fetchTheEducationFields:@"4"];
      self.comprehensionArray= [cdh fetchTheEducationFields:@"5"];
      self.teachingAssessmentArray= [cdh fetchTheEducationFields:@"6"];
    
       eduarr=[cdh setEducationFields:entry_no];
        if(eduarr.count>0){
        [self.discussedButtonOutlet setTitle:[eduarr objectAtIndex:0] forState:UIControlStateNormal];
        [self.methodUsedOutlet setTitle:[eduarr objectAtIndex:1] forState:UIControlStateNormal];
        [self.handoutOutlet setTitle:[eduarr objectAtIndex:2] forState:UIControlStateNormal];
        [self.personTaughtOutlet setTitle:[eduarr objectAtIndex:3] forState:UIControlStateNormal];
        [self.comprehensionOutlet setTitle:[eduarr objectAtIndex:4] forState:UIControlStateNormal];
        [self.teachingAssessmentOutlet setTitle:[eduarr objectAtIndex:5] forState:UIControlStateNormal];
        [self.btnEducationNumber setTitle:[eduarr objectAtIndex:6] forState:UIControlStateNormal];
        NSString *otherStr=[eduarr objectAtIndex:7];
        [self.otherTextField setText:otherStr];
            if([[eduarr objectAtIndex:0]containsString:@"Other"]){
                self.discussedOtherTextField.hidden=NO;
                NSString *othertext=[eduarr objectAtIndex:8] ;
                [self.discussedOtherTextField setText:othertext];
            }
            if([[eduarr objectAtIndex:1]containsString:@"Other"]){
                self.methodUsedOtherTextField.hidden=NO;
                NSString *othertext=[eduarr objectAtIndex:9] ;
                [self.methodUsedOtherTextField setText:othertext];
            }
            if([[eduarr objectAtIndex:2]containsString:@"Other"]){
                self.handOutOtherTextField.hidden=NO;
                NSString *othertext=[eduarr objectAtIndex:10] ;
                [self.handOutOtherTextField setText:othertext];
            }
            if([[eduarr objectAtIndex:3]containsString:@"Other"]){
                self.personTaughtOtherTextField.hidden=NO;
                NSString *othertext=[eduarr objectAtIndex:11] ;
                [self.personTaughtOtherTextField setText:othertext];
            }
            if([[eduarr objectAtIndex:5]containsString:@"Other"]){
                self.teachingAssessmentOtherTextField.hidden=NO;
                NSString *othertext=[eduarr objectAtIndex:13] ;
                [self.teachingAssessmentOtherTextField setText:othertext];
            }
            if([eduarr objectAtIndex:14]){
                self.minButtonOutlet.hidden=NO;
                NSString *othertext=[eduarr objectAtIndex:14] ;
                if([othertext isEqualToString:@"min"])
                    [self.minButtonOutlet setSelected:YES];
                else if([othertext isEqualToString:@"hr"])
                    [self.hrButtonOutlet setSelected:YES];
            }


    }

    
    
    _discussedCount=0;
   
    _methodUsedCount=0;
    
    
    _handOutCount=0;
    
   
    _personTaughtCount=0;
    
  
    _teachingAssessmentCount=0;

    self.teachingAssessmentOtherTextField.delegate = self;
    self.otherTextField.delegate = self;
    
    self.otherTextField.layer.cornerRadius=5.0f;
    
    
}
-(void)viewDidAppear:(BOOL)animated
{
//    self.discussedOtherTextField.hidden=YES;
//        self.methodUsedOtherTextField.hidden=YES;
//    self.handOutOtherTextField.hidden=YES;
//    self.personTaughtOtherTextField.hidden=YES;
//    self.teachingAssessmentOtherTextField.hidden=YES;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)getDiscussedData:(NSArray *)data
{
    NSString *selectedData=[data componentsJoinedByString:@","];
    NSLog(@"%@",selectedData);
    
    
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
    
    if ([data count]==0) {
        [self.discussedButtonOutlet setTitle:@"Select" forState:UIControlStateNormal];

    }
    else
    {
        NSLog(@"%@",selectedData);
        _discussedButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
        [self.discussedButtonOutlet setTitle:selectedData forState:UIControlStateNormal];
        

    }
    
    
    
    
    [self.popOver dismissPopoverAnimated: YES];
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
    
    if ([data count]==0) {
        [self.methodUsedOutlet setTitle:@"Select" forState:UIControlStateNormal];
        
    }
    else
    { NSLog(@"%@",selectedData);
        _methodUsedOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
        [self.methodUsedOutlet setTitle:selectedData forState:UIControlStateNormal];
        
        
    }
   
    
    
    
    
    [self.popOver dismissPopoverAnimated: YES];
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
    
    if ([data count]==0) {
        [self.handoutOutlet setTitle:@"Select" forState:UIControlStateNormal];
        
    }
    else
    {
        NSLog(@"%@",selectedData);
        _handoutOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
        [self.handoutOutlet setTitle:selectedData forState:UIControlStateNormal];
        

    }
    
    
    
    
    [self.popOver dismissPopoverAnimated: YES];
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
    
    if ([data count]==0) {
        [self.personTaughtOutlet setTitle:@"Select" forState:UIControlStateNormal];
        
    }
    else
    {
        
        NSLog(@"%@",selectedData);
        _personTaughtOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
        [self.personTaughtOutlet setTitle:selectedData forState:UIControlStateNormal];
        
    }
   
    
    
    
    
    [self.popOver dismissPopoverAnimated: YES];
}
-(void)getComprehensionData:(NSArray *)data
{
    NSString *selectedData=[data componentsJoinedByString:@","];
    
    if ([data count]==0) {
        [self.comprehensionOutlet setTitle:@"Select" forState:UIControlStateNormal];
        
    }
    else
    {
        NSLog(@"%@",selectedData);
        
        _comprehensionOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
        [self.comprehensionOutlet setTitle:selectedData forState:UIControlStateNormal];
        
        
    }
   
  
    
    
    
    [self.popOver dismissPopoverAnimated: YES];
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
    
    
    if ([data count]==0) {
        [self.teachingAssessmentOutlet setTitle:@"Select" forState:UIControlStateNormal];
        
    }
    else
    {
        NSLog(@"%@",selectedData);
        _teachingAssessmentOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
        [self.teachingAssessmentOutlet setTitle:selectedData forState:UIControlStateNormal];
        
    }
    
   
    
    
    
    
    [self.popOver dismissPopoverAnimated: YES];

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
            
            self.popOver=[[UIPopoverController alloc]initWithContentViewController:_selectEducationViewController];
            [self.popOver setPopoverContentSize:CGSizeMake(300, 300)];
            
            _selectEducationViewController.selectedArray=_discussedArray;
            _selectEducationViewController.selectedString=@"Discussed";
            
            _selectEducationViewController.array= [NSMutableArray arrayWithArray:[sender.titleLabel.text componentsSeparatedByString:@","]];
            [self.popOver presentPopoverFromRect:[sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            break;
        case 1:
            
            
            self.popOver=[[UIPopoverController alloc]initWithContentViewController:_selectEducationViewController];
            [self.popOver setPopoverContentSize:CGSizeMake(300, 300)];
            
            _selectEducationViewController.selectedArray=_methodArray;
            _selectEducationViewController.selectedString=@"Method";
            
            _selectEducationViewController.array= [NSMutableArray arrayWithArray:[sender.titleLabel.text componentsSeparatedByString:@","]];
            [self.popOver presentPopoverFromRect:[sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            break;
        case 2:
            
            
            self.popOver=[[UIPopoverController alloc]initWithContentViewController:_selectEducationViewController];
            [self.popOver setPopoverContentSize:CGSizeMake(300, 270)];
            
            _selectEducationViewController.selectedArray=_handOutArray;
            _selectEducationViewController.selectedString=@"HandOut";
            
            _selectEducationViewController.array= [NSMutableArray arrayWithArray:[sender.titleLabel.text componentsSeparatedByString:@","]];
            [self.popOver presentPopoverFromRect:[sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            break;
        case 3:
            
            self.popOver=[[UIPopoverController alloc]initWithContentViewController:_selectEducationViewController];
            [self.popOver setPopoverContentSize:CGSizeMake(300, 230)];
            
            _selectEducationViewController.selectedArray=_personTaughtArray;
            _selectEducationViewController.selectedString=@"PersonTaught";
            
            _selectEducationViewController.array= [NSMutableArray arrayWithArray:[sender.titleLabel.text componentsSeparatedByString:@","]];
            [self.popOver presentPopoverFromRect:[sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            break;
        case 4:
            
            
            self.popOver=[[UIPopoverController alloc]initWithContentViewController:_selectEducationViewController];
            [self.popOver setPopoverContentSize:CGSizeMake(300, 300)];
            
            _selectEducationViewController.selectedArray=_comprehensionArray;
            _selectEducationViewController.selectedString=@"Comprehension";
            
            _selectEducationViewController.array= [NSMutableArray arrayWithArray:[sender.titleLabel.text componentsSeparatedByString:@","]];
            [self.popOver presentPopoverFromRect:[sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            break;
        case 5:
            
            
            self.popOver=[[UIPopoverController alloc]initWithContentViewController:_selectEducationViewController];
            [self.popOver setPopoverContentSize:CGSizeMake(300, 180)];
            
            _selectEducationViewController.selectedArray=_teachingAssessmentArray;
            _selectEducationViewController.selectedString=@"Teaching";
            
            _selectEducationViewController.array= [NSMutableArray arrayWithArray:[sender.titleLabel.text componentsSeparatedByString:@","]];
            [self.popOver presentPopoverFromRect:[sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            break;
        
        case 6:
            
           storyBoardEducation = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            self.educationNumberEntryViewController = [storyBoardEducation instantiateViewControllerWithIdentifier:@"EducationNumberEntryViewController"];
            self.educationNumberEntryViewController.delegate=self;
            self.popOver =  [[UIPopoverController alloc]initWithContentViewController:self.educationNumberEntryViewController];
            [self.popOver setPopoverContentSize:CGSizeMake(300, 250)];
            [self.popOver presentPopoverFromRect:[sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
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
    p= self.scrollView.contentOffset;
    
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x, 275)];
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    self.scrollView.contentOffset =p;
    
}

-(void)OkEducationClicked{
    [self.popOver dismissPopoverAnimated:YES];
}


-(void)updateEducationEntryNumber:(NSString *)entryNumber{
    [self.btnEducationNumber setTintColor:[UIColor blackColor]];
    self.btnEducationNumber.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
    [self.btnEducationNumber setAttributedTitle: [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",entryNumber]] forState:UIControlStateNormal];
    
    
}
@end
