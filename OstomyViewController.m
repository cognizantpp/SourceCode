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
{
    
        CGPoint p;
    
    

}

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

NSArray *ostomyarr;

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

          ostomyarr=[cdh setOstomyFields:entry_no];//@"11111"
          //ostomyarr=[cdh setOstomyFields:@"11111"];

    if(ostomyarr.count>0){
        [self.OstomySiteButton setTitle:[ostomyarr objectAtIndex:0] forState:UIControlStateNormal];
        [self.StomaLocationButton setTitle:[ostomyarr objectAtIndex:1] forState:UIControlStateNormal];
        [self.StomaColorButton setTitle:[ostomyarr objectAtIndex:2] forState:UIControlStateNormal];
        [self.StomaOutputColorButton setTitle:[ostomyarr objectAtIndex:3] forState:UIControlStateNormal];
        [self.StomaOutputCharacterButton setTitle:[ostomyarr objectAtIndex:4] forState:UIControlStateNormal];
        [self.FistulaLocationButton setTitle:[ostomyarr objectAtIndex:5] forState:UIControlStateNormal];
        [self.FistulaColorButton setTitle:[ostomyarr objectAtIndex:6] forState:UIControlStateNormal];
        [self.PeristomalSkinButton setTitle:[ostomyarr objectAtIndex:7] forState:UIControlStateNormal];
        [self.ExudateCharacterButton setTitle:[ostomyarr objectAtIndex:8] forState:UIControlStateNormal];
        [self.ExudateOdourButton setTitle:[ostomyarr objectAtIndex:9] forState:UIControlStateNormal];
        [self.ExudateAmountButton setTitle:[ostomyarr objectAtIndex:10] forState:UIControlStateNormal];
        [self.GranulationTissueButton setTitle:[ostomyarr objectAtIndex:11] forState:UIControlStateNormal];
        [self.EdemaButton setTitle:[ostomyarr objectAtIndex:12] forState:UIControlStateNormal];
        [self.PeristomalSkinConditionButton setTitle:[ostomyarr objectAtIndex:13] forState:UIControlStateNormal];
        [self.StomaLengthButton setTitle:[ostomyarr objectAtIndex:14] forState:UIControlStateNormal];
        [self.StomaWidthButton setTitle:[ostomyarr objectAtIndex:15] forState:UIControlStateNormal];
        [self.StomaDepthButton setTitle:[ostomyarr objectAtIndex:16] forState:UIControlStateNormal];
        [self.FistulaLengthButton setTitle:[ostomyarr objectAtIndex:17] forState:UIControlStateNormal];
        [self.FistulaWidthButton setTitle:[ostomyarr objectAtIndex:18] forState:UIControlStateNormal];
        [self.FistulaDepthButton setTitle:[ostomyarr objectAtIndex:19] forState:UIControlStateNormal];
        NSString *atypicalStr=[ostomyarr objectAtIndex:20];
        [self.AtypicalTextView setText:atypicalStr];
        NSString *commentsStr=[ostomyarr objectAtIndex:21];
        [self.CommentsTextView setText:commentsStr];
        
        [self.dateButtonOutlet setTitle:[ostomyarr objectAtIndex:22] forState:UIControlStateNormal];

        if([[ostomyarr objectAtIndex:1]containsString:@"Other"]){
            self.StomaLocationOtherTextField.hidden=NO;
            NSString *othertext=[ostomyarr objectAtIndex:24] ;
            [self.StomaLocationOtherTextField setText:othertext];
        }
        if([[ostomyarr objectAtIndex:2]containsString:@"Other"]){
            self.StomaColorOtherTextField.hidden=NO;
            NSString *othertext=[ostomyarr objectAtIndex:25] ;
            [self.StomaColorOtherTextField setText:othertext];
        }
        if([[ostomyarr objectAtIndex:3]containsString:@"Other"]){
            self.StomaOutputColorOtherTextField.hidden=NO;
            NSString *othertext=[ostomyarr objectAtIndex:26] ;
            [self.StomaOutputColorOtherTextField setText:othertext];
        }
        if([[ostomyarr objectAtIndex:4]containsString:@"Other"]){
            self.StomaOutputCharacterOtherTextField.hidden=NO;
            NSString *othertext=[ostomyarr objectAtIndex:27] ;
            [self.StomaOutputCharacterOtherTextField setText:othertext];
        }
        if([[ostomyarr objectAtIndex:5]containsString:@"Other"]){
            self.FistulaLocationOtherTextField.hidden=NO;
            NSString *othertext=[ostomyarr objectAtIndex:28] ;
            [self.FistulaLocationOtherTextField setText:othertext];
        }
        if([[ostomyarr objectAtIndex:6]containsString:@"Other"]){
            self.FistulaColorOtherTextField.hidden=NO;
            NSString *othertext=[ostomyarr objectAtIndex:29] ;
            [self.FistulaColorOtherTextField setText:othertext];
        }
        if([[ostomyarr objectAtIndex:7]containsString:@"Other"]){
            self.CharacterOtherTextField.hidden=NO;
            NSString *othertext=[ostomyarr objectAtIndex:30] ;
            [self.CharacterOtherTextField setText:othertext];
        }
        if([[ostomyarr objectAtIndex:8]containsString:@"Other"]){
            self.ExudateCharacterOtherTextField.hidden=NO;
            NSString *othertext=[ostomyarr objectAtIndex:31] ;
            [self.ExudateCharacterOtherTextField setText:othertext];
        }
        if([[ostomyarr objectAtIndex:9]containsString:@"Other"]){
            self.ExudateOdourOtherTextField.hidden=NO;
            NSString *othertext=[ostomyarr objectAtIndex:32] ;
            [self.ExudateOdourOtherTextField setText:othertext];
        }
        if([[ostomyarr objectAtIndex:11]containsString:@"Other"]){
            self.GranulationTissueOtherTextField.hidden=NO;
            NSString *othertext=[ostomyarr objectAtIndex:34] ;
            [self.GranulationTissueOtherTextField setText:othertext];
        }
        if([ostomyarr objectAtIndex:37]){
            self.StomaSizecmButton.hidden=NO;
            NSString *othertext=[ostomyarr objectAtIndex:37] ;
            if([othertext isEqualToString:@"cm"])
                [self.StomaSizecmButton setSelected:YES];
            else if([othertext isEqualToString:@"mm"])
                [self.StomaSizemmButton setSelected:YES];
        }
        if([ostomyarr objectAtIndex:40]){
            self.FistulaSizecmButton.hidden=NO;
            NSString *othertext=[ostomyarr objectAtIndex:40] ;
            if([othertext isEqualToString:@"cm"])
                [self.FistulaSizecmButton setSelected:YES];
            else if([othertext isEqualToString:@"mm"])
                [self.FistulaSizemmButton setSelected:YES];
        }


        
    }
    _scrollView.delegate=self;
    _scrollView.contentSize=CGSizeMake(1024, 1300);
    
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
    
    
    self.StomaColorOtherTextField.delegate=self;
    self.StomaOutputColorOtherTextField.delegate=self;
    self.StomaOutputCharacterOtherTextField.delegate=self;
    self.FistulaLocationOtherTextField.delegate=self;
    self.FistulaColorOtherTextField.delegate=self;
    self.CharacterOtherTextField.delegate=self;
    self.ExudateCharacterOtherTextField.delegate=self;
    self.ExudateOdourOtherTextField.delegate=self;
    self.GranulationTissueOtherTextField.delegate=self;
    self.CommentsTextView.delegate=self;


    


    
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

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if (textField==_StomaColorOtherTextField) {
        p= self.scrollView.contentOffset;
        
        [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x, 200)];
    }
    else if (textField==_StomaOutputColorOtherTextField)
    {
        p= self.scrollView.contentOffset;
        
        [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x, 250)];
        
    }
    else if (textField==_StomaOutputCharacterOtherTextField)
    {
        p= self.scrollView.contentOffset;
        
        [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x, 300)];
        
    }
    else if (textField==_FistulaLocationOtherTextField)
    {
        p= self.scrollView.contentOffset;
        
        [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x, 350)];
        
    }
    else if (textField==_FistulaColorOtherTextField)
    {
        p= self.scrollView.contentOffset;
        
        [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x, 450)];
        
    }
    else if (textField==_CharacterOtherTextField)
    {
        p= self.scrollView.contentOffset;
        
        [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x, 500)];
        
    }
    else if (textField==_ExudateCharacterOtherTextField)
    {
        p= self.scrollView.contentOffset;
        
        [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x, 650)];
        
    }
    else if (textField==_ExudateOdourOtherTextField)
    {
        p= self.scrollView.contentOffset;
        
        [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x, 700)];
        
    }
    else if (textField==_GranulationTissueOtherTextField)
    {
        p= self.scrollView.contentOffset;
        
        [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x, 800)];
        
    }
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    self.scrollView.contentOffset =p;
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
-(void)textViewDidBeginEditing:(UITextView *)textView
{
    if (textView==_CommentsTextView) {
        p= self.scrollView.contentOffset;
        
        [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x, 900)];
        
    }
    
}
-(void)textViewDidEndEditing:(UITextView *)textView{
    self.scrollView.contentOffset =p;
    
}
@end


