//
//  ViewController.m
//  TreatmentApp
//
//  Created by Antony on 16/03/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import "TreatmentHomeViewController.h"

@interface TreatmentHomeViewController ()
{
    CGPoint p;
}
@property(nonatomic,strong)UIPopoverController *popOver;


@property(nonatomic,strong)NSMutableArray *cleansingArray;
@property(nonatomic,strong)NSMutableArray *dressingArray;
@property(nonatomic,strong)NSMutableArray *negativePressureWoundArray;
@property(nonatomic,strong)NSMutableArray*skinCareArray;


@end
NSArray *treatmentarray;
@implementation TreatmentHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CoreDataHelper *cdh=[CoreDataHelper sharedInstance];

    treatmentarray=[cdh setTreatmentFields:entry_no];
    if(treatmentarray.count>0){
        [self.cleansingButtonOutlet setTitle:[treatmentarray objectAtIndex:0] forState:UIControlStateNormal];
        [self.dressingButtonOutlet setTitle:[treatmentarray objectAtIndex:1] forState:UIControlStateNormal];
        [self.negativePressureWoundButtonOutlet setTitle:[treatmentarray objectAtIndex:2] forState:UIControlStateNormal];
        NSString *debridementstr=[treatmentarray objectAtIndex:3];
        if([debridementstr isEqualToString:@"Yes"])
            [self.yesButtonOutlet setSelected:YES];
        else if([debridementstr isEqualToString:@"No"])
            [self.noButtonOutlet setSelected:YES];
            
        [self.skinCareButtonOutlet setTitle:[treatmentarray objectAtIndex:4] forState:UIControlStateNormal];
        NSString *otherStr=[treatmentarray objectAtIndex:5];
        [self.otherTextField setText:otherStr];
        if([[treatmentarray objectAtIndex:0]containsString:@"Other"]){
            self.CleansingOtherTextField.hidden=NO;
            NSString *othertext=[treatmentarray objectAtIndex:6] ;
            [self.CleansingOtherTextField setText:othertext];
        }
        if([[treatmentarray objectAtIndex:1]containsString:@"Other"]){
            self.dressingOtherTextField.hidden=NO;
            NSString *othertext=[treatmentarray objectAtIndex:7] ;
            [self.dressingOtherTextField setText:othertext];
        }

    }
    

    _selectTreatmentViewController=[[SelectTreatmentTableViewController alloc]init];
    
    _selectTreatmentViewController.dataDelegate=self;

  
    _dressingCount=0;
    _cleansingCount=0;
        self.otherTextField.delegate = self;
    
        self.cleansingArray=[cdh fetchTheTreatmentFields:@"1"];
        self.dressingArray=[cdh fetchTheTreatmentFields:@"2"];
    
        self.negativePressureWoundArray=[cdh fetchTheTreatmentFields:@"3"];
        self.skinCareArray=[cdh fetchTheTreatmentFields:@"4"];
    
    
    
}

-(void)viewDidAppear:(BOOL)animated
{
//    self.CleansingOtherTextField.hidden=YES;
//    self.dressingOtherTextField.hidden=YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)textFieldDidBeginEditing:(UITextField *)textField{
    p= self.scrollView.contentOffset;
    
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x, 275)];
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    self.scrollView.contentOffset =p;
    
}


-(void)getData:data;
{  NSString *selectedData=[data componentsJoinedByString:@","];
    BOOL isTheObjectThere = [selectedData containsString:@"Other"];
    if(isTheObjectThere )
    {
        _cleansingCount++;
        
 self.CleansingOtherTextField.hidden=NO;
        if (_cleansingCount>1) {
            self.CleansingOtherTextField.text=@"";
        }
        
    }
    else
    {
        self.CleansingOtherTextField.hidden=YES;
    }
  
    
    if ([data count]==0 ) {
        [self.cleansingButtonOutlet setTitle:@"Select" forState:UIControlStateNormal];

    }
    else
    { _cleansingButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
        [self.cleansingButtonOutlet setTitle:selectedData forState:UIControlStateNormal];
        

        
    }
    
    
  
   
    [self.popOver dismissPopoverAnimated: YES];
    

}

-(void)getDressingData:(NSArray *)data
{
    NSString *selectedData=[data componentsJoinedByString:@","];
    BOOL isTheObjectThere = [selectedData containsString:@"Other"];
    
    if(isTheObjectThere )
    {
        _dressingCount++;
        
        self.dressingOtherTextField.hidden=NO;
        if (_dressingCount>1) {
            self.dressingOtherTextField.text=@"";
        }
        
    }
    else
    {
        self.dressingOtherTextField.hidden=YES;
        
    }
    
    
    if ([data count]==0 ) {
        [self.dressingButtonOutlet setTitle:@"Select" forState:UIControlStateNormal];
        
    }
    else
    {
        NSLog(@"%@",selectedData);
        
        _dressingButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
        [self.dressingButtonOutlet setTitle:selectedData forState:UIControlStateNormal];
        
    }
    
    

    
 
    
    [self.popOver dismissPopoverAnimated: YES];
    

}

-(void)getNegativePressureWoundData:(NSArray *)data
{
    
    
    NSString *selectedData=[data componentsJoinedByString:@","];
    
    
    if ([data count]==0 ) {
        [self.negativePressureWoundButtonOutlet setTitle:@"Select" forState:UIControlStateNormal];
        
    }
    else
    {
        
        NSLog(@"%@",selectedData);
        _negativePressureWoundButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
        
        [self.negativePressureWoundButtonOutlet setTitle:selectedData forState:UIControlStateNormal];
        

    }
    
    
   
    
    
    [self.popOver dismissPopoverAnimated: YES];

    
    
}
-(void)getSkinCareData:(NSArray *)data{
    
    
    
    NSString *selectedData=[data componentsJoinedByString:@","];
    
    
    
    if ([data count]==0 ) {
        [self.skinCareButtonOutlet setTitle:@"Select" forState:UIControlStateNormal];
        
    }
    else
    {
        NSLog(@"%@",selectedData);
        _skinCareButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
        
        [self.skinCareButtonOutlet setTitle:selectedData forState:UIControlStateNormal];
        
        
    }
    
    
    
//    CGSize size = [selectedData sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:17.0f]}];
//    
//    
//    
//    [self.skinCareButtonOutlet removeFromSuperview];
//    [self.skinCareButtonOutlet setTranslatesAutoresizingMaskIntoConstraints:YES];
// 
//    [_skinCareButtonOutlet setFrame:CGRectMake(self.skinCareButtonOutlet.frame.origin.x, self.skinCareButtonOutlet.frame.origin.y, ceilf(size.width), ceilf(size.height)+10)];
//    [self.view addSubview:self.skinCareButtonOutlet];
    
    
    [self.popOver dismissPopoverAnimated: YES];
    
    
    
}

- (IBAction)SelectButtonAction:(UIButton *)sender {
    switch (sender.tag) {
        case 1:
            
            self.popOver=[[UIPopoverController alloc]initWithContentViewController:_selectTreatmentViewController];
            [self.popOver setPopoverContentSize:CGSizeMake(300, 300)];
            
            
            _selectTreatmentViewController.selectedArray=_cleansingArray;
            _selectTreatmentViewController.selectedString=@"Cleansing";
            
            _selectTreatmentViewController.array= [NSMutableArray arrayWithArray:[sender.titleLabel.text componentsSeparatedByString:@","]];
            
            
            [self.popOver presentPopoverFromRect:[sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            break;
            
            case 2:
            self.popOver=[[UIPopoverController alloc]initWithContentViewController:_selectTreatmentViewController];
            [self.popOver setPopoverContentSize:CGSizeMake(300, 300)];
            
            
            
            _selectTreatmentViewController.selectedArray=_dressingArray;
            _selectTreatmentViewController.selectedString=@"Dressing";
            
            _selectTreatmentViewController.array= [NSMutableArray arrayWithArray:[sender.titleLabel.text componentsSeparatedByString:@","]];
            

            
            [self.popOver presentPopoverFromRect:[sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
              break;
            
            
            case 3:
            
            self.popOver=[[UIPopoverController alloc]initWithContentViewController:_selectTreatmentViewController];
            [self.popOver setPopoverContentSize:CGSizeMake(300, 300)];
            
            _selectTreatmentViewController.selectedArray=_negativePressureWoundArray;
            _selectTreatmentViewController.selectedString=@"Negative";
            
            _selectTreatmentViewController.array= [NSMutableArray arrayWithArray:[sender.titleLabel.text componentsSeparatedByString:@","]];
            

            
            [self.popOver presentPopoverFromRect:[sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            break;
            
        case 6:
            self.popOver=[[UIPopoverController alloc]initWithContentViewController:_selectTreatmentViewController];
            [self.popOver setPopoverContentSize:CGSizeMake(300, 150)];
            
            
            _selectTreatmentViewController.selectedArray=_skinCareArray;
            _selectTreatmentViewController.selectedString=@"SkinCare";
            
            _selectTreatmentViewController.array= [NSMutableArray arrayWithArray:[sender.titleLabel.text componentsSeparatedByString:@","]];
            

            
            [self.popOver presentPopoverFromRect:[sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            break;
            
            
        default:
            break;
    }
}

- (IBAction)radioButtonAction:(UIButton *)sender {
    
 
    switch (sender.tag) {
        case 4:
        {
            [self.noButtonOutlet setSelected:YES];
            [self.yesButtonOutlet setSelected:NO];
        }
            break;
        case 5:
        {
            [self.noButtonOutlet setSelected:NO];
            [self.yesButtonOutlet setSelected:YES];
            
        }

            
        default:
            break;
    }
}
@end
