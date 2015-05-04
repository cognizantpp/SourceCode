//
//  WoundViewHomeViewController.m
//  WoundView
//
//  Created by Antony on 10/04/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import "WoundViewHomeViewController.h"
#import "LengthNumberEntryViewController.h"
#import "AssignmentsViewController.h"
@interface WoundViewHomeViewController()
{
    CGPoint p;
}

@property(nonatomic,strong)UIPopoverController *radioPopOver;
@property(nonatomic,strong)UIPopoverController *multipleSeectionPopOver;
@property(nonatomic,strong)UIPopoverController *singleSelectionPopOver;
@property(nonatomic,strong)UIPopoverController *woundBedPopOver;
@property(nonatomic,strong)UIPopoverController *datePickerPopOver;

@property(nonatomic)CGRect r;
@property(nonatomic)CGRect tRect;

@property(nonatomic,strong)NSMutableArray *otherArray;
@property(nonatomic,strong)NSMutableArray *woundBedColorArray;
@property(nonatomic,strong)NSMutableArray *woundBedArray;
@property(nonatomic,strong)NSMutableArray *periWoundArray;
@property(nonatomic,strong)NSMutableArray *exudateCharacterArray;
@property (strong, nonatomic) UIPopoverController *popOver;

- (IBAction)lengthButtonClicked:(UIButton*)sender;
//@property (weak, nonatomic) IBOutlet UIButton *btnLength;
//@property (weak, nonatomic) IBOutlet UIButton *btnWidth;
//@property (weak, nonatomic) IBOutlet UIButton *btnDepth;
//@property (weak, nonatomic) IBOutlet UIButton *btnUnderminingcm;
//@property (weak, nonatomic) IBOutlet UIButton *btnUnderminingClock;
//@property (weak, nonatomic) IBOutlet UIButton *btnTunnelingcm;
//@property (weak, nonatomic) IBOutlet UIButton *btnTunnelingClock;
//@property (weak, nonatomic) IBOutlet UIButton *btnWoundBedCharacter;

@end
NSArray *woundarr;
@implementation WoundViewHomeViewController
NSInteger selectedEntryButton;
-(void)viewDidLoad
{
    
    [super viewDidLoad];
    CoreDataHelper *helper = [CoreDataHelper sharedInstance];
    helper.unit1 = @"";
    helper.unit2 = @"";
    helper.unit3 = @"";
    helper.unit4 = @"";
    helper.unit5 = @"";
    helper.unit6 = @"";
    helper.unit7 = @"";
    
    [_atypicalTextViewOutlet.layer setBackgroundColor: [[UIColor whiteColor] CGColor]];
    [_atypicalTextViewOutlet.layer setBorderColor: [[UIColor grayColor] CGColor]];
    [_atypicalTextViewOutlet.layer setBorderWidth: 1.0];
    [_atypicalTextViewOutlet.layer setCornerRadius:8.0f];
    [_atypicalTextViewOutlet.layer setMasksToBounds:YES];
    
    [_commentsTextViewOutlet.layer setBackgroundColor: [[UIColor whiteColor] CGColor]];
    [_commentsTextViewOutlet.layer setBorderColor: [[UIColor grayColor] CGColor]];
    [_commentsTextViewOutlet.layer setBorderWidth: 1.0];
    [_commentsTextViewOutlet.layer setCornerRadius:8.0f];
    [_commentsTextViewOutlet.layer setMasksToBounds:YES];
    
    
    
//    [self.yesButtonOutlet setSelected:NO];
//    [self.noButtonOutlet setSelected:NO];
//    [self.pediatricYesButtonOutlet setSelected:NO];
//
//    [self.pediatricNoButtonOutlet setSelected:NO];
//
//    [self.phlebitisYesButtonOutlet setSelected:NO];
//
//    [self.ulcerYesButtonOutlet setSelected:NO];
//    [self.phlebitisNoButtonOutlet setSelected:NO];
//    [self.ulcerNobuttonOutlet setSelected:NO];
//

    
    
    _scrollView.delegate=self;
    [_scrollView setContentSize:CGSizeMake(1024, 1550)];
    
    _multipleSelectionViewController=[[MultipleSelectionTableViewController alloc]init];
    _multipleSelectionViewController.dataDelegate=self;
    
    
    CoreDataHelper *cdh=[CoreDataHelper sharedInstance];
    self.otherArray=[cdh fetchTheWoundReasonFields:@"1"];
    self.woundBedColorArray=[cdh fetchTheWoundReasonFields:@"3"];
    self.woundBedArray=[cdh fetchTheWoundReasonFields:@"4"];
    self.periWoundArray=[cdh fetchTheWoundReasonFields:@"6"];
    self.exudateCharacterArray=[cdh fetchTheWoundReasonFields:@"7"];

    
    _singleSelectionViewController=[[SingleSelectionTableViewController alloc]init];
    _singleSelectionViewController.dataDelegate=self;
    
    
    _woundBedCount=0;
    _woundBedColorCount=0;
    _periWoundCount=0;
    _exudateCharacterCount=0;
    _exudateOdorCount=0;
    
    self.woundBedColorOtherTextField.hidden=YES;
    self.woundBedOtherTextField.hidden=YES;
    self.periwoundOtherTextField.hidden=YES;
    self.exudateCharacterOtherTextField.hidden=YES;
    self.OtherWoundsTextField.hidden=YES;
    self.exudateOdorOtherTextField.hidden=YES;
    self.mlLabelOutlet.hidden=YES;
    self.amountButtonOutlet.hidden=YES;
    
    
    self.woundBedColorOtherTextField.delegate = self;
    self.woundBedOtherTextField.delegate=self;
    self.periwoundOtherTextField.delegate=self;
    self.exudateCharacterOtherTextField.delegate=self;
    self.exudateOdorOtherTextField.delegate=self;
    self.OtherWoundsTextField.delegate=self;
    
    self.woundBedColorOtherTextField.layer.cornerRadius=15.0f;
    self.woundBedOtherTextField.layer.cornerRadius=15.0f;
    self.periwoundOtherTextField.layer.cornerRadius=15.0f;
    self.exudateCharacterOtherTextField.layer.cornerRadius=15.0f;
    self.exudateOdorOtherTextField.layer.cornerRadius=15.0f;

    self.atypicalTextViewOutlet.delegate=self;
    self.commentsTextViewOutlet.delegate=self;
    
    
    
    
    
    
    
    //CoreDataHelper *cdh=[CoreDataHelper sharedInstance];
        woundarr=[cdh setWoundReasonFields:entry_no];
    //NSLog(@"gastro array is...%@",gastroarr);
    if(woundarr.count>0){
        [self.otherButtonOutlet setTitle:[woundarr objectAtIndex:0] forState:UIControlStateNormal];
        [self.woundThicknessButtonOutlet setTitle:[woundarr objectAtIndex:1] forState:UIControlStateNormal];
//        NSString *atypicalStr=[gastroarr objectAtIndex:2];
//        [self.atypicaltextview setText:atypicalStr];
        [self.woundBedColorButtonOutlet setTitle:[woundarr objectAtIndex:2] forState:UIControlStateNormal];
        [self.woundBedButtonOutlet setTitle:[woundarr objectAtIndex:3] forState:UIControlStateNormal];
        [self.btnWoundBedCharacter setTitle:[woundarr objectAtIndex:4] forState:UIControlStateNormal];
        [self.periWoundButtonOutlet setTitle:[woundarr objectAtIndex:5] forState:UIControlStateNormal];
        [self.exudateCharacterButtonOutlet setTitle:[woundarr objectAtIndex:6] forState:UIControlStateNormal];
        [self.exudateOdorButtonOutlet setTitle:[woundarr objectAtIndex:7] forState:UIControlStateNormal];
        [self.amountButtonOutlet setTitle:[woundarr objectAtIndex:8] forState:UIControlStateNormal];
        [self.edemaButtonOutlet setTitle:[woundarr objectAtIndex:9] forState:UIControlStateNormal];
        [self.conditionButtonOutlet setTitle:[woundarr objectAtIndex:10] forState:UIControlStateNormal];
        [self.otherWoundsButtonOutlet setTitle:[woundarr objectAtIndex:11] forState:UIControlStateNormal];
        [self.onsetButtonOutlet setTitle:[woundarr objectAtIndex:12] forState:UIControlStateNormal];
        [self.btnLength setTitle:[woundarr objectAtIndex:13] forState:UIControlStateNormal];
        [self.btnWidth setTitle:[woundarr objectAtIndex:14] forState:UIControlStateNormal];
        [self.btnDepth setTitle:[woundarr objectAtIndex:15] forState:UIControlStateNormal];
        [self.btnUnderminingcm setTitle:[woundarr objectAtIndex:16] forState:UIControlStateNormal];
        [self.btnUnderminingClock setTitle:[woundarr objectAtIndex:17] forState:UIControlStateNormal];
        [self.btnTunnelingcm setTitle:[woundarr objectAtIndex:18] forState:UIControlStateNormal];
        [self.btnTunnelingClock setTitle:[woundarr objectAtIndex:19] forState:UIControlStateNormal];
        NSString *NewBornStr=[woundarr objectAtIndex:20];
        [self.newbornTextFieldOutlet setText:NewBornStr];
        NSString *PediatricStr=[woundarr objectAtIndex:21];
        [self.pediatricTextFieldOutlet setText:PediatricStr];
        NSString *PhlebitisStr=[woundarr objectAtIndex:22];
        [self.phlebitisTextFieldOutlet setText:PhlebitisStr];
        NSString *UlcerStr=[woundarr objectAtIndex:23];
        [self.ulcerTextFieldOutlet setText:UlcerStr];
        NSString *AtypicalStr=[woundarr objectAtIndex:24];
        [self.atypicalTextViewOutlet setText:AtypicalStr];
        NSString *CommentsStr=[woundarr objectAtIndex:25];
        [self.commentsTextViewOutlet setText:CommentsStr];

        
        
        
        
        
        if([[woundarr objectAtIndex:2]containsString:@"Other"]){
            self.woundBedColorOtherTextField.hidden=NO;
            NSString *woundbedcolorothertext=[woundarr objectAtIndex:28] ;
            [self.woundBedColorOtherTextField setText:woundbedcolorothertext];
        }
        if([[woundarr objectAtIndex:3]containsString:@"Other"]){
            self.woundBedOtherTextField.hidden=NO;
            NSString *woundbedothertext=[woundarr objectAtIndex:29] ;
            [self.woundBedOtherTextField setText:woundbedothertext];
        }
        if([[woundarr objectAtIndex:5]containsString:@"Other"]){
            self.periwoundOtherTextField.hidden=NO;
            NSString *periwoundothertext=[woundarr objectAtIndex:31] ;
            [self.periwoundOtherTextField setText:periwoundothertext];
        }
        if([[woundarr objectAtIndex:6]containsString:@"Other"]){
            self.exudateCharacterOtherTextField.hidden=NO;
            NSString *exudatecharacterothertext=[woundarr objectAtIndex:32] ;
            [self.exudateCharacterOtherTextField setText:exudatecharacterothertext];
        }
        if([[woundarr objectAtIndex:7]containsString:@"Other"]){
            self.exudateOdorOtherTextField.hidden=NO;
            NSString *exudateodorothertext=[woundarr objectAtIndex:33] ;
            [self.exudateOdorOtherTextField setText:exudateodorothertext];
        }
        
        if([[woundarr objectAtIndex:8]containsString:@"Estimated Amount"] || [[woundarr objectAtIndex:8]containsString:@"Canister Amount"]){
            self.amountButtonOutlet.hidden=NO;
           // NSString *exudateamountothertext=[woundarr objectAtIndex:34];
            [self.amountButtonOutlet setTitle:[woundarr objectAtIndex:34] forState:UIControlStateNormal];
                    }
//
//        if([gastroarr objectAtIndex:16]){
//            // self.minButtonOutlet.hidden=NO;
//            // self.cmbtnoutlet.hidden=YES;
//            NSString *othertextunit=[gastroarr objectAtIndex:16] ;
//            if([othertextunit isEqualToString:@"cm"])
//                [self.cmbtnoutlet setSelected:YES];
//            //[self.minButtonOutlet setSelected:YES];
//            else if([othertextunit isEqualToString:@"mm"])
//                [self.mmbtnoutlet setSelected:YES];
//        }
////
        
        
        
//                if([woundarr objectAtIndex:20]){
//                    
//                    [self.yesButtonOutlet setSelected:YES];
//                }
//        
//                else {
//                    [self.noButtonOutlet setSelected:NO];
//                }
//        if([woundarr objectAtIndex:21]){
//            
//            [self.pediatricYesButtonOutlet setSelected:YES];
//        }
//
//        if([woundarr objectAtIndex:22]){
//            
//            [self.phlebitisYesButtonOutlet setSelected:YES];
//        }
//        
//
//        if([woundarr objectAtIndex:23]){
//            
//            [self.ulcerYesButtonOutlet setSelected:YES];
//        }
        

    
        
                if([woundarr objectAtIndex:26]){
                    // self.minButtonOutlet.hidden=NO;
                    // self.cmbtnoutlet.hidden=YES;
                    NSString *othertextunit1=[woundarr objectAtIndex:26] ;
                    if([othertextunit1 isEqualToString:@"No"])
                        [self.noButtonOutlet setSelected:YES];
                    //[self.minButtonOutlet setSelected:YES];
                    else if([othertextunit1 isEqualToString:@"Yes"])
                        [self.yesButtonOutlet setSelected:YES];
                }
        if([woundarr objectAtIndex:27]){
            // self.minButtonOutlet.hidden=NO;
            // self.cmbtnoutlet.hidden=YES;
            NSString *othertextunit2=[woundarr objectAtIndex:27] ;
            if([othertextunit2 isEqualToString:@"No"])
                [self.pediatricNoButtonOutlet setSelected:YES];
            //[self.minButtonOutlet setSelected:YES];
            else if([othertextunit2 isEqualToString:@"Yes"])
                [self.pediatricYesButtonOutlet setSelected:YES];
        }
        if([woundarr objectAtIndex:35]){
            // self.minButtonOutlet.hidden=NO;
            // self.cmbtnoutlet.hidden=YES;
            NSString *othertextunit3=[woundarr objectAtIndex:35] ;
            if([othertextunit3 isEqualToString:@"No"])
                [self.phlebitisNoButtonOutlet setSelected:YES];
            //[self.minButtonOutlet setSelected:YES];
            else if([othertextunit3 isEqualToString:@"Yes"])
                [self.phlebitisYesButtonOutlet setSelected:YES];
        }
        
        if([woundarr objectAtIndex:36]){
            // self.minButtonOutlet.hidden=NO;
            // self.cmbtnoutlet.hidden=YES;
            NSString *othertextunit4=[woundarr objectAtIndex:36] ;
            if([othertextunit4 isEqualToString:@"No"])
                [self.ulcerNobuttonOutlet setSelected:YES];
            //[self.minButtonOutlet setSelected:YES];
            else if([othertextunit4 isEqualToString:@"Yes"])
                [self.ulcerYesButtonOutlet setSelected:YES];
        }
        
        if([woundarr objectAtIndex:37]){
            // self.minButtonOutlet.hidden=NO;
            // self.cmbtnoutlet.hidden=YES;
            NSString *othertextunit5=[woundarr objectAtIndex:37] ;
            if([othertextunit5 isEqualToString:@"Cm"])
                [self.underminingCmButtonOutlet setSelected:YES];
            //[self.minButtonOutlet setSelected:YES];
            else if([othertextunit5 isEqualToString:@"Mm"])
                [self.underminingMmButtonOutlet setSelected:YES];
        }
        
        if([woundarr objectAtIndex:38]){
            // self.minButtonOutlet.hidden=NO;
            // self.cmbtnoutlet.hidden=YES;
            NSString *othertextunit6=[woundarr objectAtIndex:38] ;
            if([othertextunit6 isEqualToString:@"Cm"])
                [self.tunnelingCmbuttonOutlet setSelected:YES];
            //[self.minButtonOutlet setSelected:YES];
            else if([othertextunit6 isEqualToString:@"Mm"])
                [self.tunnelingMmButtonOutlet setSelected:YES];
        }

        
        if([woundarr objectAtIndex:39]){
            // self.minButtonOutlet.hidden=NO;
            // self.cmbtnoutlet.hidden=YES;
            NSString *othertextunit7=[woundarr objectAtIndex:39] ;
            if([othertextunit7 isEqualToString:@"Cm"])
                [self.unit7cm setSelected:YES];
            //[self.minButtonOutlet setSelected:YES];
            else if([othertextunit7 isEqualToString:@"Mm"])
                [self.unit7mm setSelected:YES];
        }
        
//        if([woundarr objectAtIndex:40]){
//            // self.minButtonOutlet.hidden=NO;
//            // self.cmbtnoutlet.hidden=YES;
//            NSString *othertextunit7=[woundarr objectAtIndex:39] ;
//            if([othertextunit7 isEqualToString:@"Cm"])
//                [self.unit7cm setSelected:YES];
//            //[self.minButtonOutlet setSelected:YES];
//            else if([othertextunit7 isEqualToString:@"Mm"])
//                [self.unit7mm setSelected:YES];
//        }
//
        





        
        

    
    
    
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


- (IBAction)radioButtonAction:(UIButton *)sender {
    
    switch (sender.tag)
    {
            
        case 0:
        {
            [self.noButtonOutlet setSelected:YES];
            [self.yesButtonOutlet setSelected:NO];
            [CoreDataHelper sharedInstance].unit1=@"No";
        }
            break;
            
        case 1:
        {
            
            [self.noButtonOutlet setSelected:NO];
            [self.yesButtonOutlet setSelected:YES];
            
            
            [CoreDataHelper sharedInstance].unit1=@"Yes";
            
            _r = [sender frame];
            
                //trect gives coordinate of sender wrt view
            
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            
                // _selectRiskFactorViewController.array= [NSMutableArray arrayWithArray:[sender.titleLabel.text componentsSeparatedByString:@","]];
            UIStoryboard *storyBoard=[UIStoryboard storyboardWithName:@"Main" bundle:Nil];
            _radioViewController=[storyBoard instantiateViewControllerWithIdentifier:@"Wound"];
            _radioViewController.dataDelegate=self;
            
            _radioViewController.selectedString=@"Newborn";
            
            self.radioPopOver=[[UIPopoverController alloc]initWithContentViewController:_radioViewController];
            [self.radioPopOver setPopoverContentSize:CGSizeMake(600,400)];
            [self.radioPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
        }
            break;
            
            
            
            
        case 2:
        {
            [self.pediatricNoButtonOutlet setSelected:YES];
            [self.pediatricYesButtonOutlet setSelected:NO];
            [CoreDataHelper sharedInstance].unit2=@"No";
        }
            break;
            
        case 3:
        {
            [self.pediatricNoButtonOutlet setSelected:NO];
            [self.pediatricYesButtonOutlet setSelected:YES];
            
            [CoreDataHelper sharedInstance].unit2=@"Yes";
            
            
            _r = [sender frame];
            
                //trect gives coordinate of sender wrt view
            
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            
                // _selectRiskFactorViewController.array= [NSMutableArray arrayWithArray:[sender.titleLabel.text componentsSeparatedByString:@","]];
            UIStoryboard *storyBoard=[UIStoryboard storyboardWithName:@"Main" bundle:Nil];
            _radioViewController=[storyBoard instantiateViewControllerWithIdentifier:@"Wound"];
            _radioViewController.dataDelegate=self;
            _radioViewController.selectedString=@"Pediatric";

            self.radioPopOver=[[UIPopoverController alloc]initWithContentViewController:_radioViewController];
            [self.radioPopOver setPopoverContentSize:CGSizeMake(600,400)];
            [self.radioPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
        }
            break;
            

            
        case 4:
        {
            [self.phlebitisNoButtonOutlet setSelected:YES];
            [self.phlebitisYesButtonOutlet setSelected:NO];
            [CoreDataHelper sharedInstance].unit3=@"No";
        }
            break;
            
        case 5:
        {
            [self.phlebitisNoButtonOutlet setSelected:NO];
            [self.phlebitisYesButtonOutlet setSelected:YES];
            
            
            [CoreDataHelper sharedInstance].unit3=@"Yes";
            
            _r = [sender frame];
            
                //trect gives coordinate of sender wrt view
            
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            
                // _selectRiskFactorViewController.array= [NSMutableArray arrayWithArray:[sender.titleLabel.text componentsSeparatedByString:@","]];
            UIStoryboard *storyBoard=[UIStoryboard storyboardWithName:@"Main" bundle:Nil];
            _radioViewController=[storyBoard instantiateViewControllerWithIdentifier:@"Wound"];
            _radioViewController.dataDelegate=self;
            _radioViewController.selectedString=@"Phlebitis";
            
            self.radioPopOver=[[UIPopoverController alloc]initWithContentViewController:_radioViewController];
            [self.radioPopOver setPopoverContentSize:CGSizeMake(600,330)];
            [self.radioPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
        }
            break;
            

            
        case 6:
        {
            [self.ulcerNobuttonOutlet setSelected:YES];
            [self.ulcerYesButtonOutlet setSelected:NO];
            [CoreDataHelper sharedInstance].unit4=@"No";
        }
            break;
            
        case 7:
        {
            [self.ulcerNobuttonOutlet setSelected:NO];
            [self.ulcerYesButtonOutlet setSelected:YES];
            
            
            [CoreDataHelper sharedInstance].unit4=@"Yes";
            
            _r = [sender frame];
            
                //trect gives coordinate of sender wrt view
            
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            
                // _selectRiskFactorViewController.array= [NSMutableArray arrayWithArray:[sender.titleLabel.text componentsSeparatedByString:@","]];
            UIStoryboard *storyBoard=[UIStoryboard storyboardWithName:@"Main" bundle:Nil];
            _radioViewController=[storyBoard instantiateViewControllerWithIdentifier:@"Wound"];
            _radioViewController.dataDelegate=self;
            _radioViewController.selectedString=@"Ulcer";
            
            self.radioPopOver=[[UIPopoverController alloc]initWithContentViewController:_radioViewController];
            [self.radioPopOver setPopoverContentSize:CGSizeMake(600,350)];
            [self.radioPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
        }
            break;
            

            case 8:
            
            [self.underminingCmButtonOutlet setSelected:YES];
            [self.underminingMmButtonOutlet setSelected:NO];
               [CoreDataHelper sharedInstance].unit5=@"Cm";
           
            break;
            case 9:
            
            [self.underminingCmButtonOutlet setSelected:NO];
            [self.underminingMmButtonOutlet setSelected:YES];
            [CoreDataHelper sharedInstance].unit5=@"Mm";
            break;
            
        case 10:
            
            [self.tunnelingCmbuttonOutlet setSelected:YES];
            [self.tunnelingMmButtonOutlet setSelected:NO];
            [CoreDataHelper sharedInstance].unit6=@"Cm";

            break;
        case 11:
            
            [self.tunnelingCmbuttonOutlet setSelected:NO];
            [self.tunnelingMmButtonOutlet setSelected:YES];
            [CoreDataHelper sharedInstance].unit6=@"Mm";
            break;
        case 12:
            
            [self.unit7cm setSelected:YES];
            [self.unit7mm setSelected:NO];
            [CoreDataHelper sharedInstance].unit7=@"Cm";
            break;
        case 13:
            
            [self.unit7cm setSelected:NO];
            [self.unit7mm setSelected:YES];
            [CoreDataHelper sharedInstance].unit7=@"Mm";
            break;


            
        default:
            
            break;
    }

}

-(void)getInfiltrateNewbornData:(NSString *)data
{
    
    self.newbornTextFieldOutlet.text=data;
    
    [self.radioPopOver dismissPopoverAnimated:YES];
    

    
    
}
-(void)getInfiltratePediatricData:(NSString *)data
{
    self.pediatricTextFieldOutlet.text=data;
    [self.radioPopOver dismissPopoverAnimated:YES];
}

-(void)getPhlebitisData:(NSString *)data
{
    self.phlebitisTextFieldOutlet.text=data;
    [self.radioPopOver dismissPopoverAnimated:YES];
}
-(void)getUlcerData:(NSString *)data
{
    
    self.ulcerTextFieldOutlet.text=data;
    [self.radioPopOver dismissPopoverAnimated:YES];
    
}

-(void)getOtherData:(NSArray *)data
{
    NSString *selectedData=[data componentsJoinedByString:@","];
   
   
    
    
    if ( [data count] == 0) {
        
        [self.otherButtonOutlet setTitle:@"Select" forState:UIControlStateNormal];
        
    }
    else
    {
        _otherButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
        [self.otherButtonOutlet setTitle:selectedData forState:UIControlStateNormal];
        
        
    }
    
    
    
    
    
    [self.multipleSeectionPopOver dismissPopoverAnimated: YES];
    
    
    
    
}

-(void)getWoundThicknessData:(NSString *)data
{
    self.woundThicknessButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
    
    [self.woundThicknessButtonOutlet setTitle:data forState:UIControlStateNormal];
    [self.singleSelectionPopOver dismissPopoverAnimated:YES];

    
}

-(void)getWoundBedColorData:(NSArray *)data
{
    
    NSString *selectedData=[data componentsJoinedByString:@","];
    BOOL isTheObjectThere = [selectedData containsString:@"Other"];
    if(isTheObjectThere )
    {
        _woundBedColorCount++;
        
        self.woundBedColorOtherTextField.hidden=NO;
        if (_woundBedColorCount>1) {
            self.woundBedColorOtherTextField.text=@"";
        }
        
    }
    else
    {
        self.woundBedColorOtherTextField.hidden=YES;
    }
    if ( [data count] == 0) {
        [self.woundBedColorButtonOutlet setTitle:@"Select" forState:UIControlStateNormal];
        
        
    }
    else
    { _woundBedColorButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
        [self.woundBedColorButtonOutlet setTitle:selectedData forState:UIControlStateNormal];
        
        
        
        
    }
    
    
    
    [self.multipleSeectionPopOver dismissPopoverAnimated: YES];
}






-(void)getWoundBedData:(NSArray *)data
{
    
    NSString *selectedData=[data componentsJoinedByString:@","];
    BOOL isTheObjectThere = [selectedData containsString:@"Other"];
    if(isTheObjectThere )
    {
        _woundBedCount++;
        
        self.woundBedOtherTextField.hidden=NO;
        if (_woundBedCount>1) {
            self.woundBedOtherTextField.text=@"";
        }
        
    }
    else
    {
        self.woundBedOtherTextField.hidden=YES;
    }
    if ( [data count] == 0) {
        [self.woundBedButtonOutlet setTitle:@"Select" forState:UIControlStateNormal];
        
        
    }
    else
    { _woundBedButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
        [self.woundBedButtonOutlet setTitle:selectedData forState:UIControlStateNormal];
        
        
        
        
    }
    
    
    
    [self.multipleSeectionPopOver dismissPopoverAnimated: YES];
}


-(void)getPeriWoundData:(NSArray *)data

{
    NSString *selectedData=[data componentsJoinedByString:@","];
    BOOL isTheObjectThere = [selectedData containsString:@"Other"];
    if(isTheObjectThere )
    {
        _periWoundCount++;
        
        self.periwoundOtherTextField.hidden=NO;
        if (_periWoundCount>1) {
            self.periwoundOtherTextField.text=@"";
        }
        
    }
    else
    {
        self.periwoundOtherTextField.hidden=YES;
    }
    if ( [data count] == 0) {
        [self.periWoundButtonOutlet setTitle:@"Select" forState:UIControlStateNormal];
        
        
    }
    else
    { _periWoundButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
        [self.periWoundButtonOutlet setTitle:selectedData forState:UIControlStateNormal];
        
        
        
        
    }
    
    
    
    [self.multipleSeectionPopOver dismissPopoverAnimated: YES];
    
}
-(void)getExudateCharacterData:(NSArray *)data

{
    NSString *selectedData=[data componentsJoinedByString:@","];
    BOOL isTheObjectThere = [selectedData containsString:@"Other"];
    if(isTheObjectThere )
    {
        _exudateCharacterCount++;
        
        self.exudateCharacterOtherTextField.hidden=NO;
        if (_exudateCharacterCount>1) {
            self.exudateCharacterOtherTextField.text=@"";
        }
        
    }
    else
    {
        self.exudateCharacterOtherTextField.hidden=YES;
    }
    if ( [data count] == 0) {
        [self.exudateCharacterButtonOutlet setTitle:@"Select" forState:UIControlStateNormal];
        
        
    }
    else
    { _exudateCharacterButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
        [self.exudateCharacterButtonOutlet setTitle:selectedData forState:UIControlStateNormal];
        
        
        
        
    }
    
    
    
    [self.multipleSeectionPopOver dismissPopoverAnimated: YES];
    
}




-(void)getExudateOdorData:(NSString *)data
{
    BOOL isTheObjectThere = [data isEqualToString:@"Other"];
    if(isTheObjectThere )
    {
        _exudateOdorCount++;
        
        self.exudateOdorOtherTextField.hidden=NO;
        if (_exudateOdorCount>1) {
            self.exudateOdorOtherTextField.text=@"";
        }
        
    }
    else
    {
        self.exudateOdorOtherTextField.hidden=YES;
    }

    self.exudateOdorButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
    
    [self.exudateOdorButtonOutlet setTitle:data forState:UIControlStateNormal];
    [self.singleSelectionPopOver dismissPopoverAnimated:YES];
    
    
}
-(void)getExudateAmountData:(NSString *)data
{
    BOOL isTheObjectThere = [data isEqualToString:@"Estimated Amount"];
    BOOL isObjectThere=[data isEqualToString:@"Canister Amount"];
    
    if(isTheObjectThere || isObjectThere)
    {
        NSAttributedString *attrStr = [[NSAttributedString alloc]initWithString:@""];
        [self.amountButtonOutlet setAttributedTitle:attrStr forState:UIControlStateNormal];

        _exudateAmountCount++;
        
        self.amountButtonOutlet.hidden=NO;

        
    }
    else
    {
        self.amountButtonOutlet.hidden=YES;
    }


    self.exudateAmountButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
    
    [self.exudateAmountButtonOutlet setTitle:data forState:UIControlStateNormal];
    [self.singleSelectionPopOver dismissPopoverAnimated:YES];
    
    
}

-(void)getEdemaData:(NSString *)data
{
    self.edemaButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
    
    [self.edemaButtonOutlet setTitle:data forState:UIControlStateNormal];
    [self.singleSelectionPopOver dismissPopoverAnimated:YES];
}
-(void)getConditionData:(NSString *)data
{
    self.conditionButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
    
    [self.conditionButtonOutlet setTitle:data forState:UIControlStateNormal];
    [self.singleSelectionPopOver dismissPopoverAnimated:YES];
    
}
-(void)getOtherWoundsData:(NSString *)data
{
    if ([data isEqualToString:@"0"]) {
        self.OtherWoundsTextField.hidden=YES;
        
    }
    else
    {
        self.OtherWoundsTextField.hidden=NO;
    }
    self.otherWoundsButtonOutlet.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
    
    [self.otherWoundsButtonOutlet setTitle:data forState:UIControlStateNormal];
    [self.singleSelectionPopOver dismissPopoverAnimated:YES];
    
}

- (IBAction)multipleSelectButtonAction:(UIButton *)sender {
    
    switch (sender.tag)
    {
            
        case 0:
            
            self.multipleSeectionPopOver=[[UIPopoverController alloc]initWithContentViewController:_multipleSelectionViewController];
            [self.multipleSeectionPopOver setPopoverContentSize:CGSizeMake(300, 300)];
            
            
            _r = [sender frame];
            
                //trect gives coordinate of sender wrt view
            
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _multipleSelectionViewController.selectedArray=_otherArray;
            _multipleSelectionViewController.selectedString=@"Other";
            
            _multipleSelectionViewController.array= [NSMutableArray arrayWithArray:[sender.titleLabel.text componentsSeparatedByString:@","]];
            
            [self.multipleSeectionPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            
            break;
            
        case 2:
            
            self.multipleSeectionPopOver=[[UIPopoverController alloc]initWithContentViewController:_multipleSelectionViewController];
            [self.multipleSeectionPopOver setPopoverContentSize:CGSizeMake(300, 300)];
            
            
            _r = [sender frame];
            
                //trect gives coordinate of sender wrt view
            
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _multipleSelectionViewController.selectedArray=_woundBedColorArray;
            _multipleSelectionViewController.selectedString=@"WoundBedColor";
            
            _multipleSelectionViewController.array= [NSMutableArray arrayWithArray:[sender.titleLabel.text componentsSeparatedByString:@","]];
            
            [self.multipleSeectionPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            
            break;
            
        case 3:
            
            self.multipleSeectionPopOver=[[UIPopoverController alloc]initWithContentViewController:_multipleSelectionViewController];
            [self.multipleSeectionPopOver setPopoverContentSize:CGSizeMake(300, 300)];
            
            
            _r = [sender frame];
            
                //trect gives coordinate of sender wrt view
            
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _multipleSelectionViewController.selectedArray=_woundBedArray;
            _multipleSelectionViewController.selectedString=@"WoundBed";
            
            _multipleSelectionViewController.array= [NSMutableArray arrayWithArray:[sender.titleLabel.text componentsSeparatedByString:@","]];
            
            [self.multipleSeectionPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            
            break;
        case 5:
            
            self.multipleSeectionPopOver=[[UIPopoverController alloc]initWithContentViewController:_multipleSelectionViewController];
            [self.multipleSeectionPopOver setPopoverContentSize:CGSizeMake(300, 300)];
            
            
            _r = [sender frame];
            
                //trect gives coordinate of sender wrt view
            
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _multipleSelectionViewController.selectedArray=_periWoundArray;
            _multipleSelectionViewController.selectedString=@"PeriWound";
            
            _multipleSelectionViewController.array= [NSMutableArray arrayWithArray:[sender.titleLabel.text componentsSeparatedByString:@","]];
            
            [self.multipleSeectionPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            
            break;
        case 6:
            
            self.multipleSeectionPopOver=[[UIPopoverController alloc]initWithContentViewController:_multipleSelectionViewController];
            [self.multipleSeectionPopOver setPopoverContentSize:CGSizeMake(300, 300)];
            
            
            _r = [sender frame];
            
                //trect gives coordinate of sender wrt view
            
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _multipleSelectionViewController.selectedArray=_exudateCharacterArray;
            _multipleSelectionViewController.selectedString=@"ExudateCharacter";
            
            _multipleSelectionViewController.array= [NSMutableArray arrayWithArray:[sender.titleLabel.text componentsSeparatedByString:@","]];
            
            [self.multipleSeectionPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            
            break;

            



        default:
            
            
            break;
            

    }
    
}

- (IBAction)singleSelectButtonAction:(UIButton *)sender {
    
    
    
    switch (sender.tag)
    {
            
        case 1:
            
            self.singleSelectionPopOver=[[UIPopoverController alloc]initWithContentViewController:_singleSelectionViewController];
            [self.singleSelectionPopOver setPopoverContentSize:CGSizeMake(300, 150)];
            
            
            _r = [sender frame];
            
                //trect gives coordinate of sender wrt view
            
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _singleSelectionViewController.selectedCategory=@"WoundThickness";
            
            [self.singleSelectionPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            
            
            
            break;
            
            case 4:
        {
            selectedEntryButton = [sender tag];
            LengthNumberEntryViewController *lengthNumberEntryViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PercentageNumberEntryViewController"];
            self.woundBedPopOver = [[UIPopoverController alloc]initWithContentViewController:lengthNumberEntryViewController];
            lengthNumberEntryViewController.delegate = self;
            _r = [sender frame];
            [self.woundBedPopOver setPopoverContentSize:CGSizeMake(300, 250)];

            //trect gives coordinate of sender wrt view
            
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            [self.woundBedPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            break;
        }
            
          
        case 7:
            
            self.singleSelectionPopOver=[[UIPopoverController alloc]initWithContentViewController:_singleSelectionViewController];
            [self.singleSelectionPopOver setPopoverContentSize:CGSizeMake(300, 150)];
            
            
            _r = [sender frame];
            
                //trect gives coordinate of sender wrt view
            
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _singleSelectionViewController.selectedCategory=@"ExudateOdor";
            
            [self.singleSelectionPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            
            
            
            break;
            
        case 8:
            
            self.singleSelectionPopOver=[[UIPopoverController alloc]initWithContentViewController:_singleSelectionViewController];
            [self.singleSelectionPopOver setPopoverContentSize:CGSizeMake(300, 200)];
            
            
            _r = [sender frame];
            
                //trect gives coordinate of sender wrt view
            
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _singleSelectionViewController.selectedCategory=@"ExudateAmount";
            
            [self.singleSelectionPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            
            
            
            break;
            
 
            
        case 9:
            
            self.singleSelectionPopOver=[[UIPopoverController alloc]initWithContentViewController:_singleSelectionViewController];
            [self.singleSelectionPopOver setPopoverContentSize:CGSizeMake(300, 200)];
            
            
            _r = [sender frame];
            
                //trect gives coordinate of sender wrt view
            
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _singleSelectionViewController.selectedCategory=@"Edema";
            
            [self.singleSelectionPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            
            
            
            break;
            
            
            
        case 10:
            
            self.singleSelectionPopOver=[[UIPopoverController alloc]initWithContentViewController:_singleSelectionViewController];
            [self.singleSelectionPopOver setPopoverContentSize:CGSizeMake(300, 150)];
            
            
            _r = [sender frame];
            
                //trect gives coordinate of sender wrt view
            
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _singleSelectionViewController.selectedCategory=@"Condition";
            
            [self.singleSelectionPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            
            
            
            break;
            
        case 11:
            
            self.singleSelectionPopOver=[[UIPopoverController alloc]initWithContentViewController:_singleSelectionViewController];
            [self.singleSelectionPopOver setPopoverContentSize:CGSizeMake(300, 400)];
            
            
            _r = [sender frame];
            
                //trect gives coordinate of sender wrt view
            
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            _singleSelectionViewController.selectedCategory=@"OtherWounds";
            
            [self.singleSelectionPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
            
            
            
            break;
            case 12:
        {
            UIStoryboard *storyBoard=[UIStoryboard storyboardWithName:@"Main" bundle:Nil];
            
            _selectDateViewController=[storyBoard instantiateViewControllerWithIdentifier:@"datePicker"];
            _selectDateViewController.dataDelegate=self;
            _selectDateViewController.selectedString=@"WoundReason";
            
            
            self.datePickerPopOver=[[UIPopoverController alloc]initWithContentViewController:_selectDateViewController];
            [self.datePickerPopOver setPopoverContentSize:CGSizeMake(300, 300)];
            
            _r = [sender frame];
            _tRect = [sender convertRect:sender.bounds toView:self.view];
            _tRect.origin.x=_r.origin.x;
            
            [self.datePickerPopOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];
            
            
            break;
            

        }
            
            
            default:
            break;
    }
    

    
}
- (IBAction)lengthButtonClicked:(UIButton*)sender {
    selectedEntryButton = [sender tag];
    LengthNumberEntryViewController *lengthNumberEntryViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LengthNumberEntryViewController"];
    self.popOver = [[UIPopoverController alloc]initWithContentViewController:lengthNumberEntryViewController];
    lengthNumberEntryViewController.delegate = self;
    _r = [sender frame];
    
    //trect gives coordinate of sender wrt view
    
    _tRect = [sender convertRect:sender.bounds toView:self.view];
    _tRect.origin.x=_r.origin.x;
    [self.popOver presentPopoverFromRect:_tRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];
    
}
-(void)updateLengthEntryNumber:(NSString *)data{
    NSAttributedString *datString = [[NSAttributedString alloc]initWithString:data];
    if(selectedEntryButton == 21){
        [self.btnLength setAttributedTitle:datString forState:UIControlStateNormal];
    }
    else if(selectedEntryButton == 22){
        [self.btnWidth setAttributedTitle:datString forState:UIControlStateNormal];
    }
    else if(selectedEntryButton == 23){
        [self.btnDepth setAttributedTitle:datString forState:UIControlStateNormal];
    }
    else if(selectedEntryButton == 24){
        [self.btnUnderminingcm setAttributedTitle:datString forState:UIControlStateNormal];
    }
    else if(selectedEntryButton == 25){
        [self.btnUnderminingClock setAttributedTitle:datString forState:UIControlStateNormal];
    }
    else if(selectedEntryButton == 26){
        [self.btnTunnelingcm setAttributedTitle:datString forState:UIControlStateNormal];
    }
    else if(selectedEntryButton == 27){
        [self.btnTunnelingClock setAttributedTitle:datString forState:UIControlStateNormal];
    }
    else if(selectedEntryButton == 28){
        [self.amountButtonOutlet setAttributedTitle:datString forState:UIControlStateNormal];
    }
}
-(void)OkLengthClicked{
    
    [self.popOver dismissPopoverAnimated:YES];
}
-(void)updateWoundBed:(NSString *)granulationStr andEpithel:(NSString *)epithel andEschar:(NSString *)eschar andSlough:(NSString *)slough{
    if(granulationStr == nil){
        granulationStr = @"0";
    }
    if(epithel == nil){
        epithel = @"0";
    }
    if(eschar == nil){
        eschar = @"0";
    }
    if(slough == nil){
        slough = @"0";
    }
    
    NSString *woundBedStr = [[[[[[[granulationStr stringByAppendingString:@"%, "] stringByAppendingString:epithel] stringByAppendingString:@"%, "] stringByAppendingString:eschar] stringByAppendingString:@"%, "]stringByAppendingString:slough]stringByAppendingString:@"%"];
    [self.btnWoundBedCharacter setTitle:woundBedStr forState:UIControlStateNormal];
    [self.woundBedPopOver dismissPopoverAnimated:YES];
}


-(void)getWoundReasonDate:(NSString *)date
{
    [self.onsetButtonOutlet setTitle:date forState:UIControlStateNormal];

}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if (textField==_woundBedColorOtherTextField) {
        p= self.scrollView.contentOffset;
        
        [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x, 500)];
    }
    else if (textField==_woundBedOtherTextField)
    {
        p= self.scrollView.contentOffset;
        
        [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x, 550)];

    }
    else if (textField==_periwoundOtherTextField)
    {
        p= self.scrollView.contentOffset;
        
        [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x, 650)];
        
    }
    else if (textField==_exudateCharacterOtherTextField)
    {
        p= self.scrollView.contentOffset;
        
        [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x, 800)];
        
    }
    else if (textField==_exudateOdorOtherTextField)
    {
        p= self.scrollView.contentOffset;
        
        [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x, 850)];
        
    }
    
    else if (textField==_OtherWoundsTextField)
    {
        p= self.scrollView.contentOffset;
        
        [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x, 1200)];
        
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
    if (textView==_atypicalTextViewOutlet) {
        p= self.scrollView.contentOffset;
        
        [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x, 150)];

    }
    else if (textView==_commentsTextViewOutlet)
    {
        p= self.scrollView.contentOffset;
        
        [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x, 1100)];

    }
    
   }
-(void)textViewDidEndEditing:(UITextView *)textView{
    self.scrollView.contentOffset =p;

}

@end
