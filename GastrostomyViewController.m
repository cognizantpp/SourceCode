//
//  ViewController.m
//  GastrostomyVC
//
//  Created by Sujitha on 07/04/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import "GastrostomyViewController.h"
#import "NumberEntryViewController1.h"
#import "WidthNumberViewController.h"
#import "AssignmentsViewController.h"

@interface GastrostomyViewController ()


@property(nonatomic,strong)UIPopoverController *GastrostomySitePopOver;
@property(nonatomic,strong)UIPopoverController *NumberViewPopOver;
@property(nonatomic,strong)UIPopoverController *popOver;
@property(nonatomic,strong)UIPopoverController *oklessgastroPopOver;
@property(nonatomic,strong)UIPopoverController *datePickerPopOver;



@property(nonatomic)CGRect r;
@property(nonatomic)CGRect tRect;
@property(nonatomic,strong)NSMutableArray *GastrostomySiteArray;
@property(nonatomic,strong)NSMutableArray *GastrostomyTubeTypeArray;
@property(nonatomic,strong)NSMutableArray *AtypicalArray;
@property(nonatomic,strong)NSMutableArray *SizeLengthArray;
@property(nonatomic,strong)NSMutableArray *SizeWidthArray;



@property(nonatomic,strong)NSMutableArray *CharacterArray;
@property(nonatomic,strong)NSMutableArray *RetentionDiskArray;
@property(nonatomic,strong)NSMutableArray *PeristomalCharacterArray;
@property(nonatomic,strong)NSMutableArray *ExudateCharacterArray;
@property(nonatomic,strong)NSMutableArray *ExudateOdorArray;
@property(nonatomic,strong)NSMutableArray *ExudateAmountArray;
@property(nonatomic,strong)NSMutableArray *GranulationTissueArray;
@property(nonatomic,strong)NSMutableArray *EdemaArray;
@property(nonatomic,strong)NSMutableArray *ConditionArray;
@property(nonatomic,strong)NSMutableArray *CommentsArray;
@property(nonatomic,strong)NSMutableArray *OnsetArray;





@property(nonatomic,strong)NSArray *GastrostomySiteArray1;
@property(nonatomic,strong)NSArray *GastrostomyTubeTypeArray1;
@property(nonatomic,strong)NSArray *AtypicalArray1;
@property(nonatomic,strong)NSArray *SizeLengthArray1;
@property(nonatomic,strong)NSArray *SizeWidthArray1;
@property(nonatomic,strong)NSArray *CharacterArray1;
@property(nonatomic,strong)NSArray *RetentionDiskArray1;
@property(nonatomic,strong)NSArray *PeristomalCharacterArray1;
@property(nonatomic,strong)NSArray *ExudateCharacterArray1;
@property(nonatomic,strong)NSArray *ExudateOdorArray1;
@property(nonatomic,strong)NSArray *ExudateAmountArray1;
@property(nonatomic,strong)NSArray *GranulationTissueArray1;
@property(nonatomic,strong)NSArray *EdemaArray1;
@property(nonatomic,strong)NSArray *ConditionArray1;
@property(nonatomic,strong)NSArray *CommentsArray1;
@property(nonatomic,strong)NSArray *OnsetArray1;



@property (strong, nonatomic) IBOutlet UIButton *SizeLengthButton;

@property (strong, nonatomic) IBOutlet UIButton *SizeWidthButton;


@end
NSArray *gastroarr;
@implementation GastrostomyViewController


-(void)viewDidAppear:(BOOL)animated{
    //self.OstomySiteOtherTextField.hidden=YES;
    [super viewWillAppear:YES];
    
//    self.CharacterOtherTextField.hidden=YES;
//    
//    self.RetentionDiskOtherTextField.hidden=YES;
//    self.PeristomalSkinCharacterOtherTextField.hidden=YES;
//    self.ExudateCharacterOtherTextField.hidden=YES;
//    self.ExudateOdorOtherTextField.hidden=YES;
//    self.GranulationTissueOtherTextField.hidden=YES;
    //
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _scrollView.delegate=self;
    _scrollView.contentSize=CGSizeMake(1024, 1200);
    

    
    _selectGastrostomySiteViewController=[[SelectGastrostomySiteTableViewController alloc]init];
    _selectGastrostomySiteViewController.dataDelegate=self;
    _GastrostomySiteCount=0;
        _GastrostomyTubeTypeCount=0;
    
    
     _CharacterCount=0;
     _RetentionDiskCount=0;
    _PeristomalSkinCharacterCount=0;
     _ExudateCharacterCount=0;
    _ExudateOdorCount=0;
    _GranulationTissueCount=0;
    
    self.atypicaltextview.layer.cornerRadius=8;
    self.commentstextview.layer.cornerRadius=8;
    
    
    
   _oklessgastroViewController=[[OklessGastroTableViewController alloc]init];
    _oklessgastroViewController.dataDelegate=self;

    self.GastrostomySiteArray = [NSMutableArray arrayWithObjects:@"Gastrostomy", @"Gastrojejunal", @"Jejunal", nil];
    self.GastrostomyTubeTypeArray = [NSMutableArray arrayWithObjects:@"Gastrostomy button", @"Gastrostomy tube", @"Gastrojejunal tube",@"Gastric decompression tube",@"Jejunal tube",@"PEG tube",@"Mushroom tube",@"Foley catheter", nil];
    self.CharacterArray = [NSMutableArray arrayWithObjects:@"Intact and clamped", @"Intact,clamped and without leakage", @"Intact with continuous feeds via feeding pump",@"Intact with continuous feeds via feeding pump and without leakage",@"Intact,flushed easily with===mL of sterile water and clamped",@"Intact,flushed easily with===mL of sterile water and placed on continuous feed",@"Leakage from inside the button",@"Leakage around the tube",@"Leakage around the button",@"Drainage at insertion site",@"Clogged tube",@"Other", nil];
    self.ExudateCharacterArray = [NSMutableArray arrayWithObjects:@"None", @"Serous", @"Serosanguinous",@"Purulent",@"Bloody",@"Green",@"Brown",@"Other", nil];
    self.RetentionDiskArray = [NSMutableArray arrayWithObjects:@"None", @"Present", @"Intact",@"Displaces",@"At the_cm mark",@"Adjusted to_cm mark",@"Other", nil];
    self.PeristomalCharacterArray = [NSMutableArray arrayWithObjects:@"Healthy and intact", @"Pink", @"Macerated",@"Shiny",@"Red",@"Excoriated",@"Pimply",@"Rash,elevated",@"Rash,non-elevated",@"Erosion",@"Other", nil];
    self.ExudateOdorArray = [NSMutableArray arrayWithObjects:@"None", @"Present",@"Other", nil];
    self.ExudateAmountArray = [NSMutableArray arrayWithObjects:@"None", @"Minimal",@"Moderate",@"Large", nil];
    self.GranulationTissueArray = [NSMutableArray arrayWithObjects:@"No new protruding pink,moist tissue noted at stoma site", @"Fleshy,moist,pink,patchy tissue around stoma site",@"Fleshy,moist,pink tissue,partially surrounding the stoma site",@"Fleshy,moist,pink tissue,completely surrounding stoma",@"Other", nil];
    self.EdemaArray = [NSMutableArray arrayWithObjects:@"None", @"1+Edema",@"2+Edema",@"3+Edema",@"4+Edema",nil];
    self.ConditionArray = [NSMutableArray arrayWithObjects:@"Acute", @"Recurrent",@"Chronic",nil];
    
    
    
    _scrollView.delegate=self;
    [_scrollView setContentSize:CGSizeMake(1024, 1200)];
    
    
    
    
    
    
    //fetch
 CoreDataHelper *cdh=[CoreDataHelper sharedInstance];
//    self.GastrostomySiteArray1=[cdh setGastroFields:@"0"];
//    self.GastrostomyTubeTypeArray1= [cdh setGastroFields:@"1"];
//    self.AtypicalArray1= [cdh setGastroFields:@"2"];
//    self.SizeLengthArray1= [cdh setGastroFields:@"3"];
//    self.SizeWidthArray1= [cdh setGastroFields:@"4"];
//    self.CharacterArray1= [cdh setGastroFields:@"5"];
//    self.RetentionDiskArray1= [cdh setGastroFields:@"6"];
//    self.PeristomalCharacterArray1= [cdh setGastroFields:@"7"];
//    self.ExudateCharacterArray1= [cdh setGastroFields:@"8"];
//    self.ExudateOdorArray1= [cdh setGastroFields:@"9"];
//    self.ExudateAmountArray1= [cdh setGastroFields:@"10"];
//    self.GranulationTissueArray1= [cdh setGastroFields:@"11"];
//    self.EdemaArray1= [cdh setGastroFields:@"12"];
//    self.ConditionArray1= [cdh setGastroFields:@"13"];
//    self.OnsetArray1= [cdh setGastroFields:@"14"];
//    self.CommentsArray1= [cdh setGastroFields:@"15"];
//    
    gastroarr=[cdh setGastroFields:entry_no];
    NSLog(@"gastro array is...%@",gastroarr);
    if(gastroarr.count>0){
        [self.GastrostomySiteOutlet setTitle:[gastroarr objectAtIndex:0] forState:UIControlStateNormal];
        [self.GastrostomyTubeTypeOutlet setTitle:[gastroarr objectAtIndex:1] forState:UIControlStateNormal];
        NSString *atypicalStr=[gastroarr objectAtIndex:2];
        [self.atypicaltextview setText:atypicalStr];
        [self.SizeLengthOutlet setTitle:[gastroarr objectAtIndex:3] forState:UIControlStateNormal];
        [self.SizeWidthOutlet setTitle:[gastroarr objectAtIndex:4] forState:UIControlStateNormal];
        [self.CharacterOutlet setTitle:[gastroarr objectAtIndex:5] forState:UIControlStateNormal];
        [self.RetentionDiskOutlet setTitle:[gastroarr objectAtIndex:6] forState:UIControlStateNormal];
        [self.PeristomalSkinCharacterOutlet setTitle:[gastroarr objectAtIndex:7] forState:UIControlStateNormal];
        [self.ExudateCharacterOutlet setTitle:[gastroarr objectAtIndex:8] forState:UIControlStateNormal];
        [self.ExudateOdorOutlet setTitle:[gastroarr objectAtIndex:9] forState:UIControlStateNormal];
        [self.ExudateAmountOutlet setTitle:[gastroarr objectAtIndex:10] forState:UIControlStateNormal];
        [self.GranulationTissueOutlet setTitle:[gastroarr objectAtIndex:11] forState:UIControlStateNormal];
        [self.EdemaOutlet setTitle:[gastroarr objectAtIndex:12] forState:UIControlStateNormal];
        [self.ConditionOutlet setTitle:[gastroarr objectAtIndex:13] forState:UIControlStateNormal];
        [self.dateButtonOutlet setTitle:[gastroarr objectAtIndex:14] forState:UIControlStateNormal];
        NSString *commentsStr=[gastroarr objectAtIndex:15];
        [self.commentstextview setText:commentsStr];
        
        
        
        if([[gastroarr objectAtIndex:5]containsString:@"Other"]){
            self.CharacterOtherTextField.hidden=NO;
            NSString *characterothertext=[gastroarr objectAtIndex:21] ;
            [self.CharacterOtherTextField setText:characterothertext];
        }
        if([[gastroarr objectAtIndex:6]containsString:@"Other"]){
            self.RetentionDiskOtherTextField.hidden=NO;
            NSString *retentiondiskothertext=[gastroarr objectAtIndex:22] ;
            [self.RetentionDiskOtherTextField setText:retentiondiskothertext];
        }
        if([[gastroarr objectAtIndex:7]containsString:@"Other"]){
            self.PeristomalSkinCharacterOtherTextField.hidden=NO;
            NSString *peristomalskincharacterothertext=[gastroarr objectAtIndex:23] ;
            [self.PeristomalSkinCharacterOtherTextField setText:peristomalskincharacterothertext];
        }
        if([[gastroarr objectAtIndex:8]containsString:@"Other"]){
            self.ExudateCharacterOtherTextField.hidden=NO;
            NSString *exudatecharacterothertext=[gastroarr objectAtIndex:24] ;
            [self.ExudateCharacterOtherTextField setText:exudatecharacterothertext];
        }
        if([[gastroarr objectAtIndex:9]containsString:@"Other"]){
            self.ExudateOdorOtherTextField.hidden=NO;
            NSString *exudateodorothertext=[gastroarr objectAtIndex:25] ;
            [self.ExudateOdorOtherTextField setText:exudateodorothertext];
        }
        if([[gastroarr objectAtIndex:10]containsString:@"Other"]){
            self.GranulationTissueOtherTextField.hidden=NO;
            NSString *granulationtissueothertext=[gastroarr objectAtIndex:26] ;
            [self.GranulationTissueOtherTextField setText:granulationtissueothertext];
        }
        
        if([gastroarr objectAtIndex:16]){
           // self.minButtonOutlet.hidden=NO;
           // self.cmbtnoutlet.hidden=YES;
            NSString *othertextunit=[gastroarr objectAtIndex:16] ;
            if([othertextunit isEqualToString:@"cm"])
                [self.cmbtnoutlet setSelected:YES];
                //[self.minButtonOutlet setSelected:YES];
            else if([othertextunit isEqualToString:@"mm"])
                [self.mmbtnoutlet setSelected:YES];
        }




  //  }
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getGastrostomySite:(NSArray *)data
{
    
    NSString *selectedData=[data componentsJoinedByString:@","];
    
//    BOOL isTheObjectThere = [selectedData containsString:@"Other"];
//    
//    if(isTheObjectThere )
//    {
//        _GastrostomySiteCount++;
//        
//        self.riskFactorOtherTextFiel.hidden=NO;
//        if (_riskFactorCount>1) {
//            self.riskFactorOtherTextField.text=@"";
//        }
//        
//    }
//    else
//    {
//        self.riskFactorOtherTextField.hidden=YES;
//    }

    
    
   

        NSLog(@"%@",selectedData);
    if ( [data count] == 0) {
        [self.GastrostomySiteOutlet setTitle:@"Select" forState:UIControlStateNormal];
        
    }

    else{
    
    _GastrostomySiteOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
        [self.GastrostomySiteOutlet setTitle:selectedData forState:UIControlStateNormal];}
    
    
    
    
    
    [self.GastrostomySitePopOver dismissPopoverAnimated: YES];
}


-(void)getGastrostomyTubeType:(NSArray *)data
{
    
    NSString *selectedData=[data componentsJoinedByString:@","];
    
//        BOOL isTheObjectThere = [selectedData containsString:@"Other"];
//    
//        if(isTheObjectThere )
//        {
//            _GastrostomyTubeTypeCount++;
//    
//            self.riskFactorOtherTextField.hidden=NO;
//            if (_riskFactorCount>1) {
//                self.riskFactorOtherTextField.text=@"";
//            }
//    
//        }
//        else
//        {
//            self.riskFactorOtherTextField.hidden=YES;
//        }
    
    NSLog(@"%@",selectedData);
    if ( [data count] == 0) {
        [self.GastrostomyTubeTypeOutlet setTitle:@"Select" forState:UIControlStateNormal];
        
    }
    else{
    _GastrostomyTubeTypeOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
        [self.GastrostomyTubeTypeOutlet setTitle:selectedData forState:UIControlStateNormal];}
    
    
    
    
    
    [self.GastrostomySitePopOver dismissPopoverAnimated: YES];
}


-(void)getCharacter:(NSArray *)data
{
    
    NSString *selectedData=[data componentsJoinedByString:@","];
    
        BOOL isTheObjectThere = [selectedData containsString:@"Other"];
    
        if(isTheObjectThere )
        {
            _CharacterCount++;
    
            self.CharacterOtherTextField.hidden=NO;
            if (_CharacterCount>1) {
                self.CharacterOtherTextField.text=@"";
            }
    
        }
        else
        {
            self.CharacterOtherTextField.hidden=YES;
        }
    
    NSLog(@"%@",selectedData);
    if ( [data count] == 0) {
        [self.CharacterOutlet setTitle:@"Select" forState:UIControlStateNormal];
        
    }
    else{
    _CharacterOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
        [self.CharacterOutlet setTitle:selectedData forState:UIControlStateNormal];}
    
    
    
    
    
    [self.GastrostomySitePopOver dismissPopoverAnimated: YES];
}



-(void)getRetentionDisk:(NSArray *)data
{
    
    NSString *selectedData=[data componentsJoinedByString:@","];
    
        BOOL isTheObjectThere = [selectedData containsString:@"Other"];
    
        if(isTheObjectThere )
        {
            _RetentionDiskCount++;
    
            self.RetentionDiskOtherTextField.hidden=NO;
            if (_RetentionDiskCount>1) {
                self.RetentionDiskOtherTextField.text=@"";
            }
    
        }
        else
        {
            self.RetentionDiskOtherTextField.hidden=YES;
        }
    
    NSLog(@"%@",selectedData);
    if ( [data count] == 0) {
        [self.RetentionDiskOutlet setTitle:@"Select" forState:UIControlStateNormal];
        
    }
    else
    {_RetentionDiskOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
        [self.RetentionDiskOutlet setTitle:selectedData forState:UIControlStateNormal];}
    
    
    
    
    
    [self.GastrostomySitePopOver dismissPopoverAnimated: YES];
}

-(void)getPeristomalSkinCharacter:(NSArray *)data
{
    
    NSString *selectedData=[data componentsJoinedByString:@","];
    
        BOOL isTheObjectThere = [selectedData containsString:@"Other"];
    
        if(isTheObjectThere )
        {
            _PeristomalSkinCharacterCount++;
    
            self.PeristomalSkinCharacterOtherTextField.hidden=NO;
            if (_PeristomalSkinCharacterCount>1) {
                self.PeristomalSkinCharacterOtherTextField.text=@"";
            }
    
        }
        else
        {
            self.PeristomalSkinCharacterOtherTextField.hidden=YES;
        }
    
    NSLog(@"%@",selectedData);
    
    if ( [data count] == 0) {
        [self.PeristomalSkinCharacterOutlet setTitle:@"Select" forState:UIControlStateNormal];
        
    }
    else{
    _PeristomalSkinCharacterOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
    [self.PeristomalSkinCharacterOutlet setTitle:selectedData forState:UIControlStateNormal];
    }
    
    
    
    
    [self.GastrostomySitePopOver dismissPopoverAnimated: YES];
}


-(void)getExudateCharacter:(NSArray *)data
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
    
    NSLog(@"%@",selectedData);
    if ( [data count] == 0) {
        [self.ExudateCharacterOutlet setTitle:@"Select" forState:UIControlStateNormal];
        
    }
    
    else{
    _ExudateCharacterOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
        [self.ExudateCharacterOutlet setTitle:selectedData forState:UIControlStateNormal];}
    
    
    
    
    
    [self.GastrostomySitePopOver dismissPopoverAnimated: YES];
}


-(void)getExudateOdor:(NSString *)data
{
    
    NSString *selectedData = [NSString stringWithFormat: @"%@",data];
    BOOL isTheObjectThere = [selectedData containsString:@"Other"];
    
    if(isTheObjectThere )
    {
        _ExudateOdorCount++;
        
        self.ExudateOdorOtherTextField.hidden=NO;
        if (_ExudateOdorCount>1) {
            self.ExudateOdorOtherTextField.text=@"";
        }
        
    }
    else
    {
        self.ExudateOdorOtherTextField.hidden=YES;
    
    NSLog(@"%@",selectedData);
    
    [self.ExudateOdorOutlet setTitle:selectedData forState:UIControlStateNormal];
    
    [self.oklessgastroPopOver dismissPopoverAnimated: YES];
    }
}

-(void)getExudateAmount:(NSString *)data
{
    
    
    
    
    
    
    NSString *selectedExudateAmount = [NSString stringWithFormat: @"%@",data];
    //    if ([selectedStomaLocation isEqualToString:@"Other"])
    //    {
    //        _StomaLocationCount++;
    //
    //        self.StomaLocationOtherTextField.hidden=NO;
    //        if (_StomaLocationCount>1) {
    //            self.StomaLocationOtherTextField.text=@"";
    //        }
    //
    //    }
    //    else
    //    {
    //        self.StomaLocationOtherTextField.hidden=YES;
    
    NSLog(@"%@",selectedExudateAmount);
    
    [self.ExudateAmountOutlet setTitle:selectedExudateAmount forState:UIControlStateNormal];
    
    [self.oklessgastroPopOver dismissPopoverAnimated: YES];
}


-(void)getDate1:(NSString *)date
{
    [self.dateButtonOutlet setTitle:date forState:UIControlStateNormal];
}



-(void)getGranulationTissue:(NSString *)data
{
    
    NSString *selectedData = [NSString stringWithFormat: @"%@",data];
    BOOL isTheObjectThere = [selectedData containsString:@"Other"];
    
    if(isTheObjectThere )
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
    
    NSLog(@"%@",selectedData);
    
    [self.GranulationTissueOutlet setTitle:selectedData forState:UIControlStateNormal];
            
            
            //[self.GranulationTissueOutlet setTitle:selectedData forState:UIControlStateNormal];
            
            
            
    
    [self.oklessgastroPopOver dismissPopoverAnimated: YES];
}
}

-(void)getEdema:(NSString *)data
{
    
    NSString *selectedEdema = [NSString stringWithFormat: @"%@",data];
    //    if ([selectedStomaLocation isEqualToString:@"Other"])
    //    {
    //        _StomaLocationCount++;
    //
    //        self.StomaLocationOtherTextField.hidden=NO;
    //        if (_StomaLocationCount>1) {
    //            self.StomaLocationOtherTextField.text=@"";
    //        }
    //
    //    }
    //    else
    //    {
    //        self.StomaLocationOtherTextField.hidden=YES;
    
    NSLog(@"%@",selectedEdema);
    
    [self.EdemaOutlet setTitle:selectedEdema forState:UIControlStateNormal];
    
    [self.oklessgastroPopOver dismissPopoverAnimated: YES];
}

-(void)getCondition:(NSString *)data
{
    
    
    
    NSString *selectedCondition = [NSString stringWithFormat: @"%@",data];
    //    if ([selectedStomaLocation isEqualToString:@"Other"])
    //    {
    //        _StomaLocationCount++;
    //
    //        self.StomaLocationOtherTextField.hidden=NO;
    //        if (_StomaLocationCount>1) {
    //            self.StomaLocationOtherTextField.text=@"";
    //        }
    //
    //    }
    //    else
    //    {
    //        self.StomaLocationOtherTextField.hidden=YES;
    
    NSLog(@"%@",selectedCondition);
    
    [self.ConditionOutlet setTitle:selectedCondition forState:UIControlStateNormal];
    
    [self.oklessgastroPopOver dismissPopoverAnimated: YES];
   
    
}













- (IBAction)selectButtonAction:(UIButton *)sender {
    
    
    
    switch (sender.tag) {
        case 0:
            
            self.GastrostomySitePopOver=[[UIPopoverController alloc]initWithContentViewController:_selectGastrostomySiteViewController];
            [self.GastrostomySitePopOver setPopoverContentSize:CGSizeMake(300, 300)];
            
           
            // [self.GastrostomySitePopOver presentPopoverFromRect:[sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
            
            
            
           
            
            
            _r = [sender frame];
            
            //trect gives coordinate of sender wrt view
            
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _selectGastrostomySiteViewController.selectedArray=_GastrostomySiteArray;
            _selectGastrostomySiteViewController.selectedString=@"Gastrostomy Site";
            
            _selectGastrostomySiteViewController.array= [NSMutableArray arrayWithArray:[sender.titleLabel.text componentsSeparatedByString:@","]];
            
            [self.GastrostomySitePopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            break;
            
        case 1:
            
            

          
            self.GastrostomySitePopOver=[[UIPopoverController alloc]initWithContentViewController:_selectGastrostomySiteViewController];
            [self.GastrostomySitePopOver setPopoverContentSize:CGSizeMake(300, 300)];
//            [self.GastrostomySitePopOver presentPopoverFromRect:[sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
            
            
            
            
            
            
            _r = [sender frame];
            
            //trect gives coordinate of sender wrt view
            
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _selectGastrostomySiteViewController.selectedArray=_GastrostomyTubeTypeArray;
            _selectGastrostomySiteViewController.selectedString=@"Gastrostomy Tube Type";
//            [self.GastrostomySitePopOver presentPopoverFromRect:[sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
            
            _selectGastrostomySiteViewController.array= [NSMutableArray arrayWithArray:[sender.titleLabel.text componentsSeparatedByString:@","]];
            
            [self.GastrostomySitePopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            break;
            
            
        case 3:
        {
           // UIStoryboard *storyBoard=[UIStoryboard storyboardWithName:@"Main" bundle:Nil];
            
       NumberEntryViewController1 *NumberViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"NumberEntryViewController1"];
            
            
            NumberViewController.delegate=self;

            self.NumberViewPopOver=[[UIPopoverController alloc]initWithContentViewController:NumberViewController];
            [self.NumberViewPopOver setPopoverContentSize:CGSizeMake(300, 300)];
            
            
            
            
            _r = [sender frame];
            
            //trect gives coordinate of sender wrt view
            
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;

            
            [self.NumberViewPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            break;

            
        }
        case 4:
        {
            // UIStoryboard *storyBoard=[UIStoryboard storyboardWithName:@"Main" bundle:Nil];
            
            self.widthViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"WidthNumberViewController"];
            
            
           self.widthViewController.delegate=self;
            
            self.popOver=[[UIPopoverController alloc]initWithContentViewController:self.widthViewController];
            [self.popOver setPopoverContentSize:CGSizeMake(300, 300)];
            
            
            
            
            _r = [sender frame];
            
            //trect gives coordinate of sender wrt view
            
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            
        
            [self.popOver presentPopoverFromRect:[sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            break;
            
            
        }

        case 5:
            
            self.GastrostomySitePopOver=[[UIPopoverController alloc]initWithContentViewController:_selectGastrostomySiteViewController];
            [self.GastrostomySitePopOver setPopoverContentSize:CGSizeMake(300, 300)];
         
            
            _r = [sender frame];
            
            //trect gives coordinate of sender wrt view
            
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _selectGastrostomySiteViewController.selectedArray=_CharacterArray;
            _selectGastrostomySiteViewController.selectedString=@"Character";
            

            _selectGastrostomySiteViewController.array= [NSMutableArray arrayWithArray:[sender.titleLabel.text componentsSeparatedByString:@","]];
            
            [self.GastrostomySitePopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            break;
            
        case 6:
            
            self.GastrostomySitePopOver=[[UIPopoverController alloc]initWithContentViewController:_selectGastrostomySiteViewController];
            [self.GastrostomySitePopOver setPopoverContentSize:CGSizeMake(300, 300)];
       _r = [sender frame];
            
            //trect gives coordinate of sender wrt view
            
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _selectGastrostomySiteViewController.selectedArray=_RetentionDiskArray;
            _selectGastrostomySiteViewController.selectedString=@"Retention Disk";
            
            _selectGastrostomySiteViewController.array= [NSMutableArray arrayWithArray:[sender.titleLabel.text componentsSeparatedByString:@","]];
            
            [self.GastrostomySitePopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            break;
            
        case 7:
            
            self.GastrostomySitePopOver=[[UIPopoverController alloc]initWithContentViewController:_selectGastrostomySiteViewController];
            [self.GastrostomySitePopOver setPopoverContentSize:CGSizeMake(300, 300)];
//            [self.GastrostomySitePopOver presentPopoverFromRect:[sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
            
            
            
            
            
            
            _r = [sender frame];
            
            //trect gives coordinate of sender wrt view
            
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _selectGastrostomySiteViewController.selectedArray=_PeristomalCharacterArray;
            _selectGastrostomySiteViewController.selectedString=@"Peristomal Skin Character";
            
            _selectGastrostomySiteViewController.array= [NSMutableArray arrayWithArray:[sender.titleLabel.text componentsSeparatedByString:@","]];
            
            [self.GastrostomySitePopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            break;
            
            
            
        case 15:
        {
            self.cmbtnoutlet.selected=YES;
            self.mmbtnoutlet.selected=NO;
            
            break;
            
            
        }
        case 16:
        {
            self.cmbtnoutlet.selected=NO;
            self.mmbtnoutlet.selected=YES;
            
            break;
            
            
        }
            
            
        case 14:
        {
            UIStoryboard *storyBoard=[UIStoryboard storyboardWithName:@"Main" bundle:Nil];
            _selectOnsetDateController=[storyBoard instantiateViewControllerWithIdentifier:@"datePicker1"];
            _selectOnsetDateController.dataDelegate=self;
            
            
            self.datePickerPopOver=[[UIPopoverController alloc]initWithContentViewController:_selectOnsetDateController];
            [self.datePickerPopOver setPopoverContentSize:CGSizeMake(300, 300)];
            
            _r = [sender frame];
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            
            [self.datePickerPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];
            break;
        }
            
            


            
        case 8:
            
            self.GastrostomySitePopOver=[[UIPopoverController alloc]initWithContentViewController:_selectGastrostomySiteViewController];
            [self.GastrostomySitePopOver setPopoverContentSize:CGSizeMake(300, 300)];
        
            
            
            
            
            
            _r = [sender frame];
            
            //trect gives coordinate of sender wrt view
            
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _selectGastrostomySiteViewController.selectedArray=_ExudateCharacterArray;
            _selectGastrostomySiteViewController.selectedString=@"Exudate Character";
            
     
            
            _selectGastrostomySiteViewController.array= [NSMutableArray arrayWithArray:[sender.titleLabel.text componentsSeparatedByString:@","]];
            
            [self.GastrostomySitePopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            break;




            
            
            
            
            
            
            
                    default:
            break;
    }
}


-(void)updateEntryNumber:(NSString *)entryNumber{
    [self.SizeLengthButton setTintColor:[UIColor blackColor]];
    [self.SizeLengthButton setAttributedTitle: [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",entryNumber]] forState:UIControlStateNormal];
}

-(void)updateEntryNumberW:(NSString *)entryNumberW{
    [self.SizeWidthButton setTintColor:[UIColor blackColor]];
    [self.SizeWidthButton setAttributedTitle: [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",entryNumberW]] forState:UIControlStateNormal];
}

-(void)OkClicked{
    NSLog(@"dismiss in addassignment popover ");
    [self.NumberViewPopOver dismissPopoverAnimated:YES];
}

-(void)OkClickedW{
    NSLog(@"dismiss in width popover ");
    [self.popOver dismissPopoverAnimated:YES];
}

- (IBAction)oklessgastroaction:(UIButton *)sender {
    
    
    
    switch (sender.tag)
    {
            
        case 9:
            
      
            self.oklessgastroPopOver=[[UIPopoverController alloc]initWithContentViewController:_oklessgastroViewController];
            [self.oklessgastroPopOver setPopoverContentSize:CGSizeMake(300, 200)];
            
            
            _r = [sender frame];
            
            //trect gives coordinate of sender wrt view
            
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _oklessgastroViewController.selectedCategory=@"Exudate Odor";
            _oklessgastroViewController.selectedArray=self.ExudateOdorArray;
            [self.oklessgastroPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            break;
            
            
            
        case 10:
            
            
            self.oklessgastroPopOver=[[UIPopoverController alloc]initWithContentViewController:_oklessgastroViewController];
            [self.oklessgastroPopOver setPopoverContentSize:CGSizeMake(300, 200)];
            
            
            _r = [sender frame];
            
            //trect gives coordinate of sender wrt view
            
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _oklessgastroViewController.selectedCategory=@"Exudate Amount";
            _oklessgastroViewController.selectedArray=self.ExudateAmountArray;
            [self.oklessgastroPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            break;
 
        case 11:
            
            
            self.oklessgastroPopOver=[[UIPopoverController alloc]initWithContentViewController:_oklessgastroViewController];
            [self.oklessgastroPopOver setPopoverContentSize:CGSizeMake(300, 200)];
            
            
            _r = [sender frame];
            
            //trect gives coordinate of sender wrt view
            
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _oklessgastroViewController.selectedCategory=@"Granulation Tissue";
            _oklessgastroViewController.selectedArray=self.GranulationTissueArray;
            [self.oklessgastroPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            break;
            
        case 12:
            
            
            self.oklessgastroPopOver=[[UIPopoverController alloc]initWithContentViewController:_oklessgastroViewController];
            [self.oklessgastroPopOver setPopoverContentSize:CGSizeMake(300, 200)];
            
            
            _r = [sender frame];
            
            //trect gives coordinate of sender wrt view
            
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _oklessgastroViewController.selectedCategory=@"Edema";
            _oklessgastroViewController.selectedArray=self.EdemaArray;
            [self.oklessgastroPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            break;
            
        case 13:
            
            
            self.oklessgastroPopOver=[[UIPopoverController alloc]initWithContentViewController:_oklessgastroViewController];
            [self.oklessgastroPopOver setPopoverContentSize:CGSizeMake(300, 200)];
            
            
            _r = [sender frame];
            
            //trect gives coordinate of sender wrt view
            
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _oklessgastroViewController.selectedCategory=@"Condition";
            _oklessgastroViewController.selectedArray=self.ConditionArray;
            [self.oklessgastroPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            break;



            
            
            
            
            
            
            
            
        default:
            
            break;
    }


}




@end
