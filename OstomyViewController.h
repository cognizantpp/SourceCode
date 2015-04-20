//
//  OstomyViewController.h
//  Ostomy
//
//  Created by keerthana on 07/04/15.
//  Copyright (c) 2015 keerthana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectOstomySiteTVController.h"
#import "StomaLocationTVController.h"
#import "SelectOnsetDate.h"
#import "SizeEntryViewController.h"


@interface OstomyViewController : UIViewController<UIScrollViewDelegate,GetDataProtocol,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

//@property (weak, nonatomic) IBOutlet UITextField *OstomySiteOtherTextField;

@property (strong, nonatomic) IBOutlet UIButton *OstomySiteButton;
@property (strong, nonatomic) IBOutlet UIButton *StomaOutputCharacterButton;
@property (strong, nonatomic) IBOutlet UIButton *PeristomalSkinButton;
@property (strong, nonatomic) IBOutlet UIButton *ExudateCharacterButton;




@property (strong, nonatomic) IBOutlet UIButton *StomaLocationButton;
@property (strong, nonatomic) IBOutlet UIButton *StomaColorButton;
@property (strong, nonatomic) IBOutlet UIButton *StomaOutputColorButton;
@property (strong, nonatomic) IBOutlet UIButton *FistulaLocationButton;
@property (strong, nonatomic) IBOutlet UIButton *FistulaColorButton;
@property (strong, nonatomic) IBOutlet UIButton *ExudateOdourButton;
@property (strong, nonatomic) IBOutlet UIButton *ExudateAmountButton;
@property (strong, nonatomic) IBOutlet UIButton *GranulationTissueButton;
@property (strong, nonatomic) IBOutlet UIButton *EdemaButton;
@property (strong, nonatomic) IBOutlet UIButton *PeristomalSkinConditionButton;

@property (weak, nonatomic) IBOutlet UIButton *dateButtonOutlet;

@property (strong, nonatomic) IBOutlet UITextField *StomaOutputCharacterOtherTextField;
@property (strong, nonatomic) IBOutlet UITextField *CharacterOtherTextField;
@property (strong, nonatomic) IBOutlet UITextField *ExudateCharacterOtherTextField;


@property (weak, nonatomic) IBOutlet UITextField *StomaLocationOtherTextField;
@property (strong, nonatomic) IBOutlet UITextField *StomaColorOtherTextField;
@property (strong, nonatomic) IBOutlet UITextField *StomaOutputColorOtherTextField;
@property (strong, nonatomic) IBOutlet UITextField *FistulaLocationOtherTextField;
@property (strong, nonatomic) IBOutlet UITextField *FistulaColorOtherTextField;
@property (strong, nonatomic) IBOutlet UITextField *ExudateOdourOtherTextField;
@property (strong, nonatomic) IBOutlet UITextField *GranulationTissueOtherTextField;


@property (strong, nonatomic) IBOutlet UIButton *StomaLengthButton;
@property (strong, nonatomic) IBOutlet UIButton *StomaWidthButton;
@property (strong, nonatomic) IBOutlet UIButton *StomaDepthButton;

@property (strong, nonatomic) IBOutlet UIButton *FistulaLengthButton;
@property (strong, nonatomic) IBOutlet UIButton *FistulaWidthButton;
@property (strong, nonatomic) IBOutlet UIButton *FistulaDepthButton;

@property (strong, nonatomic) IBOutlet UIButton *StomaSizemmButton;
@property (strong, nonatomic) IBOutlet UIButton *StomaSizecmButton;
@property (strong, nonatomic) IBOutlet UIButton *FistulaSizemmButton;
@property (strong, nonatomic) IBOutlet UIButton *FistulaSizecmButton;




@property (nonatomic, strong)NSMutableString *entryData;
@property (nonatomic, strong)NSMutableString *entryDataW;


@property (weak, nonatomic) IBOutlet UIView *subVView;


@property(nonatomic,strong) SelectOstomySiteTVController *SelectOstomySiteController;
@property(nonatomic,strong) StomaLocationTVController *SelectStomaLocationController;
@property(nonatomic,strong)SelectOnsetDate *selectOnsetDateController;
@property(nonatomic,strong)SizeEntryViewController *SizeViewController;


@property(nonatomic)int StomaOutputCharacterCount;
@property(nonatomic)int PeristomalSkinCharacterCount;
@property(nonatomic)int ExudateCharacterCount;



@property(nonatomic)int StomaLocationCount;
@property(nonatomic)int StomaColorCount;
@property(nonatomic)int StomaOutputColorCount;
@property(nonatomic)int FistulaLocationCount;
@property(nonatomic)int FistulaColorCount;
@property(nonatomic)int ExudateOdourCount;
@property(nonatomic)int GranulationTissueCount;



@end
