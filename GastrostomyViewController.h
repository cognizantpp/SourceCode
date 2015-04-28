//
//  ViewController.h
//  GastrostomyVC
//
//  Created by Sujitha on 07/04/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectGastrostomySiteTableViewController.h"
#import "OklessGastroTableViewController.h"
#import "NumberEntryViewController1.h"
#import "WidthNumberViewController.h"
#import "WidthViewController.h"
#import "DismissPopOver.h"
#import "SelectOnsetDate1.h"
#import "CoreDataHelper.h"
@interface GastrostomyViewController : UIViewController<UIScrollViewDelegate,GetDataProtocol,DismissPopOver>
@property (nonatomic, strong)id<DismissPopOver> delegate;
//@property (nonatomic, strong)id<DismissPopOver> ddelegate;
@property (nonatomic, strong)NSMutableString *entryData;
@property (nonatomic, strong)NSMutableString *entryDataW;
@property (strong, nonatomic) WidthNumberViewController *widthViewController;
@property (strong, nonatomic)WidthNumberViewController *widthController;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIButton *GastrostomySiteOutlet;

@property (weak, nonatomic) IBOutlet UIButton *GastrostomyTubeTypeOutlet;

//@property (strong, nonatomic) IBOutlet UIButton *AtypicalOutlet;
@property (strong, nonatomic) IBOutlet UIButton *SizeLengthOutlet;
@property (strong, nonatomic) IBOutlet UIButton *SizeWidthOutlet;
@property (strong, nonatomic) IBOutlet UIButton *CharacterOutlet;
@property (strong, nonatomic) IBOutlet UIButton *RetentionDiskOutlet;
@property (strong, nonatomic) IBOutlet UIButton *PeristomalSkinCharacterOutlet;
@property (strong, nonatomic) IBOutlet UIButton *ExudateCharacterOutlet;
@property (strong, nonatomic) IBOutlet UIButton *ExudateOdorOutlet;
@property (strong, nonatomic) IBOutlet UIButton *ExudateAmountOutlet;
@property (strong, nonatomic) IBOutlet UIButton *GranulationTissueOutlet;
@property (strong, nonatomic) IBOutlet UIButton *EdemaOutlet;

@property (strong, nonatomic) IBOutlet UIButton *ConditionOutlet;
@property (strong, nonatomic) IBOutlet UIButton *CommentsOutlet;
- (IBAction)selectButtonAction:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UIButton *dateButtonOutlet;

- (IBAction)oklessgastroaction:(UIButton *)sender;

@property(nonatomic,strong) SelectOnsetDate1 *selectOnsetDateController;
@property (strong, nonatomic) IBOutlet UITextField *CharacterOtherTextField;
@property (strong, nonatomic) IBOutlet UITextField *RetentionDiskOtherTextField;
@property (strong, nonatomic) IBOutlet UITextField *PeristomalSkinCharacterOtherTextField;
@property (strong, nonatomic) IBOutlet UITextField *ExudateOdorOtherTextField;
@property (strong, nonatomic) IBOutlet UITextField *ExudateCharacterOtherTextField;
@property (strong, nonatomic) IBOutlet UITextField *GranulationTissueOtherTextField;
@property (strong, nonatomic) IBOutlet UITextView *atypicaltextview;
@property (strong, nonatomic) IBOutlet UITextView *commentstextview;

@property(nonatomic,strong)SelectGastrostomySiteTableViewController *selectGastrostomySiteViewController;
@property(nonatomic,strong)OklessGastroTableViewController *oklessgastroViewController;
//@property(nonatomic,strong)NumberEntryViewController1 *NumberViewController;
@property(nonatomic,strong)WidthNumberViewController *WidthNumberViewController;

@property(nonatomic)int GastrostomySiteCount;
@property(nonatomic)int GastrostomyTubeTypeCount;
//@property(nonatomic)int AtypicalCount;
@property(nonatomic)int SizeLengthCount;
@property(nonatomic)int SizeWidthCount;
@property(nonatomic)int CharacterCount;
@property(nonatomic)int RetentionDiskCount;
@property(nonatomic)int PeristomalSkinCharacterCount;
@property(nonatomic)int ExudateCharacterCount;
@property(nonatomic)int ExudateOdorCount;
@property(nonatomic)int ExudateAmountCount;
@property(nonatomic)int GranulationTissueCount;
@property(nonatomic)int EdemaCount;
@property(nonatomic)int ConditionCount;
//@property(nonatomic)int CommentsCount;

@property (strong, nonatomic) IBOutlet UIButton *cmbtnoutlet;

@property (strong, nonatomic) IBOutlet UIButton *mmbtnoutlet;

-(void)OkClicked;
-(void)OkClickedW;
-(void)updateEntryNumber:(NSString *)entryNumber;
//- (IBAction)numberClicked:(UIButton*)sender;

-(void)updateEntryNumberW:(NSString *)entryNumberW;



//- (IBAction)btnGoClicked:(id)sender;





@end

