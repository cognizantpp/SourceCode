//
//  ViewController.m
//  TreatmentApp
//
//  Created by Antony on 16/03/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import "TreatmentHomeViewController.h"

@interface TreatmentHomeViewController ()
@property(nonatomic,strong)UIPopoverController *popOver;
@property(nonatomic,strong)UIPopoverController *dressingPopOver;
@property(nonatomic,strong)UIPopoverController *negativePressureWoundPopOver;
@property(nonatomic,strong)UIPopoverController *skinCarePopOver;
@end

@implementation TreatmentHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    _selectCleansingViewController=[[SelectCleansingTableViewController alloc]init];
    
    _selectCleansingViewController.dataDelegate=self;
    _selectDressingViewController=[[selectDressingTableViewController alloc]init];
    _selectDressingViewController.dataDelegate=self;
  
    _dressingCount=0;
    _cleansingCount=0;
    
    _negativePressureWoundController=[[NegativePressureWoundTableViewController alloc]init];
    _negativePressureWoundController.dataDelegate=self;
    
    self.skinCareViewController=[[SkinCareTableViewController alloc]init];
    _skinCareViewController.dataDelegate=self;
    
}
-(void)viewDidAppear:(BOOL)animated
{
    self.CleansingOtherTextField.hidden=YES;
    self.dressingOtherTextField.hidden=YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    NSLog(@"%@",selectedData);
      _cleansingButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
    [self.cleansingButtonOutlet setTitle:selectedData forState:UIControlStateNormal];
    
    
    
  
   
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
    
    NSLog(@"%@",selectedData);
      _dressingButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
    [self.dressingButtonOutlet setTitle:selectedData forState:UIControlStateNormal];
    
    

    
 
    
    [self.dressingPopOver dismissPopoverAnimated: YES];
    

}

-(void)getNegativePressureWoundData:(NSArray *)data
{
    
    
    NSString *selectedData=[data componentsJoinedByString:@","];
   
    NSLog(@"%@",selectedData);
      _negativePressureWoundButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
    
    [self.negativePressureWoundButtonOutlet setTitle:selectedData forState:UIControlStateNormal];
    

    
    
    [self.negativePressureWoundPopOver dismissPopoverAnimated: YES];

    
    
}
-(void)getSkinCareData:(NSArray *)data{
    
    
    
    NSString *selectedData=[data componentsJoinedByString:@","];
    
    NSLog(@"%@",selectedData);
    _skinCareButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
    
    [self.skinCareButtonOutlet setTitle:selectedData forState:UIControlStateNormal];
    
    
    
//    CGSize size = [selectedData sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:17.0f]}];
//    
//    
//    
//    [self.skinCareButtonOutlet removeFromSuperview];
//    [self.skinCareButtonOutlet setTranslatesAutoresizingMaskIntoConstraints:YES];
// 
//    [_skinCareButtonOutlet setFrame:CGRectMake(self.skinCareButtonOutlet.frame.origin.x, self.skinCareButtonOutlet.frame.origin.y, ceilf(size.width), ceilf(size.height)+10)];
//    [self.view addSubview:self.skinCareButtonOutlet];
    
    
    [self.skinCarePopOver dismissPopoverAnimated: YES];
    
    
    
}

- (IBAction)SelectButtonAction:(UIButton *)sender {
    switch (sender.tag) {
        case 0:
            
            self.popOver=[[UIPopoverController alloc]initWithContentViewController:_selectCleansingViewController];
            [self.popOver setPopoverContentSize:CGSizeMake(300, 300)];
            [self.popOver presentPopoverFromRect:[sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
            
            break;
            case 1:
            self.dressingPopOver=[[UIPopoverController alloc]initWithContentViewController:_selectDressingViewController];
            [self.dressingPopOver setPopoverContentSize:CGSizeMake(300, 300)];
            [self.dressingPopOver presentPopoverFromRect:[sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
              break;
            case 2:
            self.negativePressureWoundPopOver=[[UIPopoverController alloc]initWithContentViewController:_negativePressureWoundController];
            [self.negativePressureWoundPopOver setPopoverContentSize:CGSizeMake(300, 300)];
            [self.negativePressureWoundPopOver presentPopoverFromRect:[sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            break;
            
        case 3:
            self.skinCarePopOver=[[UIPopoverController alloc]initWithContentViewController:_skinCareViewController];
            [self.skinCarePopOver setPopoverContentSize:CGSizeMake(300, 300)];
            [self.skinCarePopOver presentPopoverFromRect:[sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            break;
            
            
        default:
            break;
    }
}

- (IBAction)radioButtonAction:(UIButton *)sender {
    
 
    switch (sender.tag) {
        case 0:
        {
            [self.noButtonOutlet setSelected:YES];
            [self.yesButtonOutlet setSelected:NO];
        }
            break;
        case 1:
        {
            [self.noButtonOutlet setSelected:NO];
            [self.yesButtonOutlet setSelected:YES];
            
        }

            
        default:
            break;
    }
}
@end
