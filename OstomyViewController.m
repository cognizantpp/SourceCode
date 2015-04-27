//
//  OstomyViewController.m
//  Ostomy
//
//  Created by keerthana on 07/04/15.
//  Copyright (c) 2015 keerthana. All rights reserved.
//

#import "OstomyViewController.h"
#import "SizeEntryViewController.h"


@interface OstomyViewController ()

@property(nonatomic)CGRect r;
@property(nonatomic)CGRect tRect;

@property(nonatomic,strong)UIPopoverController *OstomySitePopOver;
@property(nonatomic,strong)UIPopoverController *StomaPopOver;
@property(nonatomic,strong)UIPopoverController *datePickerPopOver;
@property(nonatomic,strong)UIPopoverController *SizeViewPopOver;



@property(nonatomic,strong)NSArray *ostomySiteArray;
@property(nonatomic,strong)NSArray *StomaOutputCharacterArray;
@property(nonatomic,strong)NSArray *PeristomalSkinCharacterArray;
@property(nonatomic,strong)NSArray *ExudateCharacterArray;


@end

@implementation OstomyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [_AtypicalTextView.layer setBackgroundColor: [[UIColor whiteColor] CGColor]];
    [_AtypicalTextView.layer setBorderColor: [[UIColor grayColor] CGColor]];
    [_AtypicalTextView.layer setBorderWidth: 1.0];
    [_AtypicalTextView.layer setCornerRadius:8.0f];
    [_AtypicalTextView.layer setMasksToBounds:YES];
    
    [_CommentsTextView.layer setBackgroundColor: [[UIColor whiteColor] CGColor]];
    [_CommentsTextView.layer setBorderColor: [[UIColor grayColor] CGColor]];
    [_CommentsTextView.layer setBorderWidth: 1.0];
    [_CommentsTextView.layer setCornerRadius:8.0f];
    [_CommentsTextView.layer setMasksToBounds:YES];
    
    
    CoreDataHelper *cdh=[CoreDataHelper sharedInstance];
    self.ostomySiteArray=[cdh fetchTheOstomyFields:@"1"];
    self.StomaOutputCharacterArray= [cdh fetchTheOstomyFields:@"5"];
    self.PeristomalSkinCharacterArray= [cdh fetchTheOstomyFields:@"8"];
    self.ExudateCharacterArray= [cdh fetchTheOstomyFields:@"9"];

    
    _scrollView.delegate=self;
    _scrollView.contentSize=CGSizeMake(1024, 1020);
    
    _SelectOstomySiteController=[[SelectOstomySiteTVController alloc]init];
    _SelectOstomySiteController.dataDelegate=self;
    
    _StomaOutputCharacterCount=0;
    _PeristomalSkinCharacterCount=0;
    _ExudateCharacterCount=0;
    

    _SelectStomaLocationController=[[StomaLocationTVController alloc]init];
    _SelectStomaLocationController.dataDelegate=self;
    
    _StomaLocationCount=0;
    _StomaColorCount=0;
    _StomaOutputColorCount=0;
    _FistulaLocationCount=0;
    _FistulaColorCount=0;
    _ExudateOdourCount=0;
    _GranulationTissueCount=0;
   
}

-(void)viewDidAppear:(BOOL)animated{
    //self.OstomySiteOtherTextField.hidden=YES;
    [super viewWillAppear:YES];
    
    self.StomaOutputCharacterOtherTextField.hidden=YES;
    self.CharacterOtherTextField.hidden=YES;
    self.ExudateCharacterOtherTextField.hidden=YES;
    
    self.StomaLocationOtherTextField.hidden=YES;
    self.StomaColorOtherTextField.hidden=YES;
    self.StomaOutputColorOtherTextField.hidden=YES;
    self.FistulaLocationOtherTextField.hidden=YES;
    self.FistulaColorOtherTextField.hidden=YES;
    self.ExudateOdourOtherTextField.hidden=YES;
    self.GranulationTissueOtherTextField.hidden=YES;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getOstomySiteData:(NSArray *)data{
    NSString *selectedData=[data componentsJoinedByString:@","];
    NSLog(@"%@",selectedData);
    
    if ( [data count] == 0) {
        [self.OstomySiteButton setTitle:@"Select" forState:UIControlStateNormal];
        
    }
    else
    {
    _OstomySiteButton.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
    [self.OstomySiteButton setTitle:selectedData forState:UIControlStateNormal];
    }
    [self.OstomySitePopOver dismissPopoverAnimated: YES];
}

-(void)getStomaOutputCharacterData:(NSArray *)data
{
    NSString *selectedData=[data componentsJoinedByString:@","];
    BOOL isTheObjectThere = [selectedData containsString:@"Other"];
    if(isTheObjectThere )
    {
        _StomaOutputCharacterCount++;
        
        self.StomaOutputCharacterOtherTextField.hidden=NO;
        if (_StomaOutputCharacterCount>1) {
            self.StomaOutputCharacterOtherTextField.text=@"";
        }
        
    }
    else
    {
        self.StomaOutputCharacterOtherTextField.hidden=YES;
    }
    
    if ( [data count] == 0) {
        [self.StomaOutputCharacterButton setTitle:@"Select" forState:UIControlStateNormal];
        
    }
    else
    {
        _StomaOutputCharacterButton.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
        [self.StomaOutputCharacterButton setTitle:selectedData forState:UIControlStateNormal];
    }
    
    
    [self.OstomySitePopOver dismissPopoverAnimated: YES];
    
}

-(void)getPeristomalSkinCharacterData:(NSArray *)data
{
    NSString *selectedData=[data componentsJoinedByString:@","];
    BOOL isTheObjectThere = [selectedData containsString:@"Other"];
    if(isTheObjectThere )
    {
        _PeristomalSkinCharacterCount++;
        
        self.CharacterOtherTextField.hidden=NO;
        if (_PeristomalSkinCharacterCount>1) {
            self.CharacterOtherTextField.text=@"";
        }
        
    }
    else
    {
        self.CharacterOtherTextField.hidden=YES;
    }
    
    if ( [data count] == 0) {
        [self.PeristomalSkinButton setTitle:@"Select" forState:UIControlStateNormal];
        
    }
    else
    {
        _PeristomalSkinButton.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
        [self.PeristomalSkinButton setTitle:selectedData forState:UIControlStateNormal];
    }
    
    
    [self.OstomySitePopOver dismissPopoverAnimated: YES];
    
}

-(void)getPeristomalSkinExudateCharacterData:(NSArray *)data

{
    NSString *selectedData=[data componentsJoinedByString:@","];
    BOOL isTheObjectThere = [selectedData containsString:@"Other"];
    if(isTheObjectThere )
    {
        _ExudateCharacterCount++;
        
        self.ExudateCharacterOtherTextField.hidden=NO;
        if (_ExudateCharacterCount>1) {
            self.ExudateCharacterOtherTextField.text=@"";
        }
        
    }
    else
    {
        self.ExudateCharacterOtherTextField.hidden=YES;
    }
    
    if ( [data count] == 0) {
        [self.ExudateCharacterButton setTitle:@"Select" forState:UIControlStateNormal];
        
    }
    else
    {
        _ExudateCharacterButton.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
        [self.ExudateCharacterButton setTitle:selectedData forState:UIControlStateNormal];
    }
    
    
    [self.OstomySitePopOver dismissPopoverAnimated: YES];
    
}



-(void)getStomaLocationData:(NSString *)data{
    
    NSString *selectedStomaLocation = [NSString stringWithFormat: @"%@",data];
        if ([selectedStomaLocation isEqualToString:@"Other"])
    {
        _StomaLocationCount++;
        
        self.StomaLocationOtherTextField.hidden=NO;
        if (_StomaLocationCount>1) {
            self.StomaLocationOtherTextField.text=@"";
        }
        
    }
    else
    {
        self.StomaLocationOtherTextField.hidden=YES;
    }
    NSLog(@"%@",selectedStomaLocation);
   
    [self.StomaLocationButton setTitle:selectedStomaLocation forState:UIControlStateNormal];
    
    [self.StomaPopOver dismissPopoverAnimated: YES];
}

-(void)getStomaColorData:(NSString *)data{
    
    NSString *selectedStomaColor = [NSString stringWithFormat: @"%@",data];
    if ([selectedStomaColor isEqualToString:@"Other"])
    {
        _StomaColorCount++;
        
        self.StomaColorOtherTextField.hidden=NO;
        if (_StomaColorCount>1) {
            self.StomaColorOtherTextField.text=@"";
        }
        
    }
    else
    {
        self.StomaColorOtherTextField.hidden=YES;
    }
    NSLog(@"%@",selectedStomaColor);

    
    [self.StomaColorButton setTitle:selectedStomaColor forState:UIControlStateNormal];
    
    [self.StomaPopOver dismissPopoverAnimated: YES];
}

-(void)getStomaOutputColorData:(NSString *)data{
    
    NSString *selectedStomaOutputColor = [NSString stringWithFormat: @"%@",data];
    if ([selectedStomaOutputColor isEqualToString:@"Other"])
    {
        _StomaOutputColorCount++;
        
        self.StomaOutputColorOtherTextField.hidden=NO;
        if (_StomaOutputColorCount>1) {
            self.StomaOutputColorOtherTextField.text=@"";
        }
        
    }
    else
    {
        self.StomaOutputColorOtherTextField.hidden=YES;
    }
    NSLog(@"%@",selectedStomaOutputColor);
 
    
    [self.StomaOutputColorButton setTitle:selectedStomaOutputColor forState:UIControlStateNormal];
    
    [self.StomaPopOver dismissPopoverAnimated: YES];
}

-(void)getFistulaLocationData:(NSString *)data{
    
    NSString *selectedFistulaLocation = [NSString stringWithFormat: @"%@",data];
    if ([selectedFistulaLocation isEqualToString:@"Other"])
    {
        _FistulaLocationCount++;
        
        self.FistulaLocationOtherTextField.hidden=NO;
        if (_FistulaLocationCount>1) {
            self.FistulaLocationOtherTextField.text=@"";
        }
        
    }
    else
    {
        self.FistulaLocationOtherTextField.hidden=YES;
    }
    NSLog(@"%@",selectedFistulaLocation);
    
    
    [self.FistulaLocationButton setTitle:selectedFistulaLocation forState:UIControlStateNormal];
    
    [self.StomaPopOver dismissPopoverAnimated: YES];
}

-(void)getFistulaColorData:(NSString *)data{
    
    NSString *selectedFistulaColor = [NSString stringWithFormat: @"%@",data];
    if ([selectedFistulaColor isEqualToString:@"Other"])
    {
        _FistulaColorCount++;
        
        self.FistulaColorOtherTextField.hidden=NO;
        if (_FistulaColorCount>1) {
            self.FistulaColorOtherTextField.text=@"";
        }
        
    }
    else
    {
        self.FistulaColorOtherTextField.hidden=YES;
    }
    NSLog(@"%@",selectedFistulaColor);
    
    
    [self.FistulaColorButton setTitle:selectedFistulaColor forState:UIControlStateNormal];
    
    [self.StomaPopOver dismissPopoverAnimated: YES];
}

-(void)getPeristomalSkinExudateOdourData:(NSString *)data{
    
    NSString *selectedExudateOdour = [NSString stringWithFormat: @"%@",data];
    if ([selectedExudateOdour isEqualToString:@"Other"])
    {
        _ExudateOdourCount++;
        
        self.ExudateOdourOtherTextField.hidden=NO;
        if (_ExudateOdourCount>1) {
            self.ExudateOdourOtherTextField.text=@"";
        }
        
    }
    else
    {
        self.ExudateOdourOtherTextField.hidden=YES;
    }
    NSLog(@"%@",selectedExudateOdour);
    
    
    [self.ExudateOdourButton setTitle:selectedExudateOdour forState:UIControlStateNormal];
    
    [self.StomaPopOver dismissPopoverAnimated: YES];
}

-(void)getPeristomalSkinExudateAmountData:(NSString *)data{
    
    NSString *selectedExudateAmount = [NSString stringWithFormat: @"%@",data];
    NSLog(@"%@",selectedExudateAmount);
    [self.ExudateAmountButton setTitle:selectedExudateAmount forState:UIControlStateNormal];
    
    [self.StomaPopOver dismissPopoverAnimated: YES];
}

-(void)getPeristomalSkinGranulationTissueData:(NSString *)data{
    
    NSString *selectedGranulatedTissue = [NSString stringWithFormat: @"%@",data];
    if ([selectedGranulatedTissue isEqualToString:@"Other"])
    {
        _GranulationTissueCount++;
        
        self.GranulationTissueOtherTextField.hidden=NO;
        if (_GranulationTissueCount>1) {
            self.GranulationTissueOtherTextField.text=@"";
        }
        
    }
    else
    {
        self.GranulationTissueOtherTextField.hidden=YES;
    }
    NSLog(@"%@",selectedGranulatedTissue);
    
    
    [self.GranulationTissueButton setTitle:selectedGranulatedTissue forState:UIControlStateNormal];
    
    [self.StomaPopOver dismissPopoverAnimated: YES];
}


-(void)getPeristomalSkinEdemaData:(NSString *)data{
    
    NSString *selectedEdema = [NSString stringWithFormat: @"%@",data];
    NSLog(@"%@",selectedEdema);
    
    
    [self.EdemaButton setTitle:selectedEdema forState:UIControlStateNormal];
    
    [self.StomaPopOver dismissPopoverAnimated: YES];
}

-(void)getPeristomalSkinConditionData:(NSString *)data{
    
    NSString *selectedCondition = [NSString stringWithFormat: @"%@",data];
    
    NSLog(@"%@",selectedCondition);
    
    
    [self.PeristomalSkinConditionButton setTitle:selectedCondition forState:UIControlStateNormal];
    
    [self.StomaPopOver dismissPopoverAnimated: YES];
}

-(void)getOnsetDate:(NSString *)date
{
    [self.dateButtonOutlet setTitle:date forState:UIControlStateNormal];
}

-(void)updateStomaLength:(NSString *)entryNumber{
    [self.StomaLengthButton setTintColor:[UIColor blackColor]];
    [self.StomaLengthButton setAttributedTitle: [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",entryNumber]] forState:UIControlStateNormal];
}

-(void)updateStomaWidth:(NSString *)entryNumber{
    [self.StomaWidthButton setTintColor:[UIColor blackColor]];
    [self.StomaWidthButton setAttributedTitle: [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",entryNumber]] forState:UIControlStateNormal];
}

-(void)updateStomaDepth:(NSString *)entryNumber{
    [self.StomaDepthButton setTintColor:[UIColor blackColor]];
    [self.StomaDepthButton setAttributedTitle: [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",entryNumber]] forState:UIControlStateNormal];
}

-(void)updateFistulaLength:(NSString *)entryNumber{
    [self.FistulaLengthButton setTintColor:[UIColor blackColor]];
    [self.FistulaLengthButton setAttributedTitle: [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",entryNumber]] forState:UIControlStateNormal];
}

-(void)updateFistulaWidth:(NSString *)entryNumber{
    [self.FistulaWidthButton setTintColor:[UIColor blackColor]];
    [self.FistulaWidthButton setAttributedTitle: [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",entryNumber]] forState:UIControlStateNormal];
}

-(void)updateFistulaDepth:(NSString *)entryNumber{
    [self.FistulaDepthButton setTintColor:[UIColor blackColor]];
    [self.FistulaDepthButton setAttributedTitle: [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",entryNumber]] forState:UIControlStateNormal];
}


-(void)OkSizeClicked{
    NSLog(@"dismiss in addassignment popover ");
    [self.SizeViewPopOver dismissPopoverAnimated:YES];
}


- (IBAction)selectDateButtonAction:(UIButton *)sender {
    
    UIStoryboard *storyBoard=[UIStoryboard storyboardWithName:@"Main" bundle:Nil];
    _selectOnsetDateController=[storyBoard instantiateViewControllerWithIdentifier:@"OnsetdatePicker"];
    _selectOnsetDateController.dataDelegate=self;
    
    
    self.datePickerPopOver=[[UIPopoverController alloc]initWithContentViewController:_selectOnsetDateController];
    [self.datePickerPopOver setPopoverContentSize:CGSizeMake(300, 300)];
    
    _r = [sender frame];
    _tRect = [sender convertRect:sender.bounds toView:self.view];
    _tRect.origin.x=_r.origin.x;
    
    [self.datePickerPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];
    
}

- (IBAction)SelectCategoryAction:(UIButton *)sender {
    
    switch (sender.tag) {
        case 2:
            self.StomaPopOver=[[UIPopoverController alloc]initWithContentViewController:_SelectStomaLocationController];
            [self.StomaPopOver setPopoverContentSize:CGSizeMake(300, 200)];
            
            _r = [sender frame];
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _SelectStomaLocationController.selectedCategory=@"StomaLocation";
            [self.StomaPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            break;
            
        case 3:
            self.StomaPopOver=[[UIPopoverController alloc]initWithContentViewController:_SelectStomaLocationController];
            [self.StomaPopOver setPopoverContentSize:CGSizeMake(300, 200)];
            
            _r = [sender frame];
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _SelectStomaLocationController.selectedCategory=@"StomaColor";
            
            [self.StomaPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            break;
            
        case 4:
            self.StomaPopOver=[[UIPopoverController alloc]initWithContentViewController:_SelectStomaLocationController];
            [self.StomaPopOver setPopoverContentSize:CGSizeMake(300, 200)];
            
            _r = [sender frame];
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _SelectStomaLocationController.selectedCategory=@"StomaOutputColor";
            
            [self.StomaPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            break;
            
        case 6:
            self.StomaPopOver=[[UIPopoverController alloc]initWithContentViewController:_SelectStomaLocationController];
            [self.StomaPopOver setPopoverContentSize:CGSizeMake(300, 200)];
            
            _r = [sender frame];
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _SelectStomaLocationController.selectedCategory=@"FistulaLocation";
            [self.StomaPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            break;
            
        case 7:
            self.StomaPopOver=[[UIPopoverController alloc]initWithContentViewController:_SelectStomaLocationController];
            [self.StomaPopOver setPopoverContentSize:CGSizeMake(300, 200)];
            
            _r = [sender frame];
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _SelectStomaLocationController.selectedCategory=@"FistulaColor";
            
            [self.StomaPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            break;
            
        case 10:
            self.StomaPopOver=[[UIPopoverController alloc]initWithContentViewController:_SelectStomaLocationController];
            [self.StomaPopOver setPopoverContentSize:CGSizeMake(300, 200)];
            
            _r = [sender frame];
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _SelectStomaLocationController.selectedCategory=@"ExudateOdour";
            
            [self.StomaPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            break;
            
        case 11:
            self.StomaPopOver=[[UIPopoverController alloc]initWithContentViewController:_SelectStomaLocationController];
            [self.StomaPopOver setPopoverContentSize:CGSizeMake(300, 200)];
            
            _r = [sender frame];
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _SelectStomaLocationController.selectedCategory=@"ExudateAmount";
            
            [self.StomaPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            break;
            
        case 12:
            self.StomaPopOver=[[UIPopoverController alloc]initWithContentViewController:_SelectStomaLocationController];
            [self.StomaPopOver setPopoverContentSize:CGSizeMake(300, 200)];
            
            _r = [sender frame];
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _SelectStomaLocationController.selectedCategory=@"GranulationTissue";
            
            [self.StomaPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            break;
            
        case 13:
            self.StomaPopOver=[[UIPopoverController alloc]initWithContentViewController:_SelectStomaLocationController];
            [self.StomaPopOver setPopoverContentSize:CGSizeMake(300, 200)];
    
            _r = [sender frame];
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _SelectStomaLocationController.selectedCategory=@"Edema";
            
            [self.StomaPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            break;
            
        case 14:
            self.StomaPopOver=[[UIPopoverController alloc]initWithContentViewController:_SelectStomaLocationController];
            [self.StomaPopOver setPopoverContentSize:CGSizeMake(300, 200)];
            
            _r = [sender frame];
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _SelectStomaLocationController.selectedCategory=@"Condition";
            
            [self.StomaPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            break;
            
            case 15:
             _SizeViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"SizeEntryViewController"];
            

             _SizeViewController.delegate=self;
            
            self.SizeViewPopOver=[[UIPopoverController alloc]initWithContentViewController:_SizeViewController];
            [self.SizeViewPopOver setPopoverContentSize:CGSizeMake(300, 300)];
            
            _r = [sender frame];
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _SizeViewController.selectedCategorySize=@"StomaLength";
            
            
            [self.SizeViewPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            break;
            
        case 16:
            _SizeViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"SizeEntryViewController"];
            
            _SizeViewController.delegate=self;
            
            self.SizeViewPopOver=[[UIPopoverController alloc]initWithContentViewController:_SizeViewController];
            [self.SizeViewPopOver setPopoverContentSize:CGSizeMake(300, 300)];
            
            _r = [sender frame];
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _SizeViewController.selectedCategorySize=@"StomaWidth";
            
            
            [self.SizeViewPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            break;
            
        case 17:
            _SizeViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"SizeEntryViewController"];
            
            _SizeViewController.delegate=self;
            
            self.SizeViewPopOver=[[UIPopoverController alloc]initWithContentViewController:_SizeViewController];
            [self.SizeViewPopOver setPopoverContentSize:CGSizeMake(300, 300)];
            
            _r = [sender frame];
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _SizeViewController.selectedCategorySize=@"StomaDepth";
            
            
            [self.SizeViewPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            break;
            
        case 18:
            _SizeViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"SizeEntryViewController"];
            
            _SizeViewController.delegate=self;
            
            self.SizeViewPopOver=[[UIPopoverController alloc]initWithContentViewController:_SizeViewController];
            [self.SizeViewPopOver setPopoverContentSize:CGSizeMake(300, 300)];
            
            _r = [sender frame];
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _SizeViewController.selectedCategorySize=@"FistulaLength";
            
            
            [self.SizeViewPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            break;
            
        case 19:
            _SizeViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"SizeEntryViewController"];
            
            _SizeViewController.delegate=self;
            
            self.SizeViewPopOver=[[UIPopoverController alloc]initWithContentViewController:_SizeViewController];
            [self.SizeViewPopOver setPopoverContentSize:CGSizeMake(300, 300)];
            
            _r = [sender frame];
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _SizeViewController.selectedCategorySize=@"FistulaWidth";
            
            
            [self.SizeViewPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            break;
            
        case 20:
            _SizeViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"SizeEntryViewController"];
            
            _SizeViewController.delegate=self;
            
            self.SizeViewPopOver=[[UIPopoverController alloc]initWithContentViewController:_SizeViewController];
            [self.SizeViewPopOver setPopoverContentSize:CGSizeMake(300, 300)];
            
            _r = [sender frame];
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _SizeViewController.selectedCategorySize=@"FistulaDepth";
            
            
            [self.SizeViewPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            break;






            
        default:
            break;
    }
}



//*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
//*/

- (IBAction)selectButtonAction:(UIButton *)sender {

    switch (sender.tag) {
            
        case 1:
            
            self.OstomySitePopOver=[[UIPopoverController alloc]initWithContentViewController:_SelectOstomySiteController];
            [self.OstomySitePopOver setPopoverContentSize:CGSizeMake(300, 300)];
            
            
            _r = [sender frame];
            
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _SelectOstomySiteController.selectedArray=_ostomySiteArray;
            _SelectOstomySiteController.selectedString=@"OstomySite";
            
            _SelectOstomySiteController.array= [NSMutableArray arrayWithArray:[sender.titleLabel.text componentsSeparatedByString:@","]];
            
            [self.OstomySitePopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            
            break;
            
       case 5:
            self.OstomySitePopOver=[[UIPopoverController alloc]initWithContentViewController:_SelectOstomySiteController];
            [self.OstomySitePopOver setPopoverContentSize:CGSizeMake(300, 300)];
            
            
            _r = [sender frame];
            
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _SelectOstomySiteController.selectedArray=_StomaOutputCharacterArray;
            _SelectOstomySiteController.selectedString=@"StomaOutputCharacter";
            
            _SelectOstomySiteController.array= [NSMutableArray arrayWithArray:[sender.titleLabel.text componentsSeparatedByString:@","]];
            
            [self.OstomySitePopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            
            break;
        case 8:
            self.OstomySitePopOver=[[UIPopoverController alloc]initWithContentViewController:_SelectOstomySiteController];
            [self.OstomySitePopOver setPopoverContentSize:CGSizeMake(300, 300)];
            
            
            _r = [sender frame];
            
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _SelectOstomySiteController.selectedArray=_PeristomalSkinCharacterArray;
            _SelectOstomySiteController.selectedString=@"Character";
            
            _SelectOstomySiteController.array= [NSMutableArray arrayWithArray:[sender.titleLabel.text componentsSeparatedByString:@","]];
            
            [self.OstomySitePopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            
            break;
        case 9:
            self.OstomySitePopOver=[[UIPopoverController alloc]initWithContentViewController:_SelectOstomySiteController];
            [self.OstomySitePopOver setPopoverContentSize:CGSizeMake(300, 300)];
            
            
            _r = [sender frame];
            
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _SelectOstomySiteController.selectedArray=_ExudateCharacterArray;
            _SelectOstomySiteController.selectedString=@"ExudateCharacter";
            
            _SelectOstomySiteController.array= [NSMutableArray arrayWithArray:[sender.titleLabel.text componentsSeparatedByString:@","]];
            
            [self.OstomySitePopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            
            break;

        default:
            break;
    }

}

- (IBAction)RadioButtonAction:(UIButton *)sender {
    switch (sender.tag) {
        case 0:
            [self.StomaSizemmButton setSelected:YES];
            [self.StomaSizecmButton setSelected:NO];
            break;
        
        case 1:
            [self.StomaSizecmButton setSelected:YES];
            [self.StomaSizemmButton setSelected:NO];
            break;
            
        case 2:
            [self.FistulaSizemmButton setSelected:YES];
            [self.FistulaSizecmButton setSelected:NO];
            break;
            
        case 3:
            [self.FistulaSizecmButton setSelected:YES];
            [self.FistulaSizemmButton setSelected:NO];
            break;
            
        default:
            break;
    }
}



- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    if (sender.contentOffset.x != 0) {
        CGPoint offset = sender.contentOffset;
        offset.x = 0;
        sender.contentOffset = offset;
    }
}


@end


