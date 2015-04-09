//
//  PainHomeViewController.m
//  PainView
//
//  Created by Antony on 27/03/14.
//  Copyright (c) 2014 Cognizant. All rights reserved.
//

#import "PainHomeViewController.h"
@interface PainHomeViewController()



@property(nonatomic,strong)UIPopoverController *characterPopOver;
@property(nonatomic,strong)UIPopoverController *methodPopOver;
@property(nonatomic,strong)UIPopoverController *wongBackerPopOver;
@property(nonatomic,strong)UIPopoverController *flaccPopOver;



@end


@implementation PainHomeViewController




-(void)viewDidLoad

{
    
    [super viewDidLoad];
    
    _selectCharacterViewController=[[SelectCharacterTableViewController alloc]init];
    _selectCharacterViewController.dataDelegate=self;
    
    
    _selectMethodViewController=[[selectMethodTableViewController alloc]init];
    _selectMethodViewController.dataDelegate=self;
    
}


-(void)getCharacterData:(NSArray *)data
{
    
    
    NSString *selectedData=[data componentsJoinedByString:@","];
    if ([data count]==0) {
        [self.characterButtonOutlet setTitle:@"Select" forState:UIControlStateNormal];

    }
    else
    {
        NSLog(@"%@",selectedData);
        _characterButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
        [self.characterButtonOutlet setTitle:selectedData forState:UIControlStateNormal];
        
        
    }
    
   
    [self.characterPopOver dismissPopoverAnimated: YES];

    
}

-(void)getMethodData:(NSString *)data
{
    
    [self.methodButtonOutlet setTitle:data forState:UIControlStateNormal];
    [self.methodPopOver dismissPopoverAnimated:YES];
    
    if ([data isEqualToString:@"Wong-Backer FACES"]) {
        
        UIStoryboard *storyBoard=[UIStoryboard storyboardWithName:@"Main" bundle:Nil];
        _selectWongBackerViewController=[storyBoard instantiateViewControllerWithIdentifier:@"wongBacker"];
        _selectWongBackerViewController.dataDelegate=self;

        
        self.wongBackerPopOver=[[UIPopoverController alloc]initWithContentViewController:_selectWongBackerViewController];
        [self.wongBackerPopOver setPopoverContentSize:CGSizeMake(635,100)];
        [self.wongBackerPopOver presentPopoverFromRect:[_methodButtonOutlet frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
       
        
        

        
    }
    else if ([data isEqualToString:@"FLACC"]){
        
        UIStoryboard *storyBoard=[UIStoryboard storyboardWithName:@"Main" bundle:Nil];
        _selectFlaccViewController=[storyBoard instantiateViewControllerWithIdentifier:@"FLACC"];
             _selectFlaccViewController.dataDelegate=self;
        
        _selectFlaccViewController.btnFrame =_methodButtonOutlet.frame;

        
        self.flaccPopOver=[[UIPopoverController alloc]initWithContentViewController:_selectFlaccViewController];
        [self.flaccPopOver setPopoverContentSize:CGSizeMake(500,370)];
        [self.flaccPopOver presentPopoverFromRect:[_methodButtonOutlet frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
        
        

        
        
    }
    

    
}


-(void)getPainScore:(NSInteger )data
{
    NSString *selectedPainScore = [NSString stringWithFormat: @"%ld", (long)data];
    

    
    [ _scoreButtonOutlet setTitle:selectedPainScore forState:UIControlStateNormal];

    [self.wongBackerPopOver dismissPopoverAnimated:YES];
    
    
}

-(void)getFlaccPainScore:(NSInteger)data
{
NSString *inStr = [NSString stringWithFormat: @"%ld", (long)data];
    [self.scoreButtonOutlet setTitle:inStr forState:UIControlStateNormal];
    
}

-(void)dismissFlaccPopOver
{
    [self.flaccPopOver dismissPopoverAnimated:YES];
}


- (IBAction)selectButtonAction:(UIButton *)sender {
    switch (sender.tag) {
            
            
        case 0:
            
            self.methodPopOver=[[UIPopoverController alloc]initWithContentViewController:_selectMethodViewController];
            [self.methodPopOver setPopoverContentSize:CGSizeMake(250,100)];
            [self.methodPopOver presentPopoverFromRect:[sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            
            
            
            break;
            
        case 1:
            
            self.characterPopOver=[[UIPopoverController alloc]initWithContentViewController:_selectCharacterViewController];
            [self.characterPopOver setPopoverContentSize:CGSizeMake(300, 300)];
            [self.characterPopOver presentPopoverFromRect:[sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            
            
            
            break;
            
            
        default:
            
            break;
            
    }
    
    
    
    
}
@end
