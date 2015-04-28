//
//  PictureViewController.m
//  samplecameraapp
//
//  Created by Sangeetha on 26/03/15.
//  Copyright (c) 2015 CTS. All rights reserved.
//

#import "PictureViewController.h"
#import "CropImageViewController.h"
#import "CoreDataHelper.h"
#import "AssessmentViewController.h"

@interface PictureViewController ()
{
    CGPoint p;
}
@property (strong, nonatomic) IBOutlet UIButton *btnTakeImage;
@property (strong, nonatomic) UIImagePickerController *pickerController;
@property(strong,nonatomic)NSMutableArray *tableArray;
@property(nonatomic,strong)UIPopoverController *popOver;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property UITableView *tableView1;
@property UIImageView *imageView1;
@property UIImageView *imageView2;
- (IBAction)takePicture:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@property (weak, nonatomic) IBOutlet UIButton *btn4;
@property (weak, nonatomic) IBOutlet UIButton *btn5;
@property (weak, nonatomic) IBOutlet UIButton *btn6;
@property (weak, nonatomic) IBOutlet UIButton *btn7;
- (IBAction)checkboxClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *chkbx1;
@property (weak, nonatomic) IBOutlet UIButton *chkbx2;

@property (weak, nonatomic) IBOutlet UIButton *chkbx3;

@property (weak, nonatomic) IBOutlet UIButton *chkbx4;
@property (weak, nonatomic) IBOutlet UIButton *chkbx5;
@property (weak, nonatomic) IBOutlet UIButton *chkbx6;
@property (weak, nonatomic) IBOutlet UIButton *chkbx7;

@property (weak, nonatomic) IBOutlet UITextField *txtField1;
@property (weak, nonatomic) IBOutlet UITextField *txtField2;
@property (weak, nonatomic) IBOutlet UITextField *txtField3;
@property (weak, nonatomic) IBOutlet UITextField *txtField4;
@property (weak, nonatomic) IBOutlet UITextField *txtField5;
@property (weak, nonatomic) IBOutlet UITextField *txtField6;
@property (weak, nonatomic) IBOutlet UITextField *txtField7;
- (IBAction)textEditDone:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *assessment;

@end
int tagValue;
int flagvalue;
@implementation PictureViewController
int selectedbtn;
int woundImageCount = 0;
int imageCount = 0;
UIButton *btn;
- (void)viewDidLoad {
    [super viewDidLoad];
    CoreDataHelper *helper = [CoreDataHelper sharedInstance];
    self.txtField1.delegate = self;
    self.txtField2.delegate = self;
    self.txtField3.delegate = self;
    self.txtField4.delegate = self;
    self.txtField5.delegate = self;
    self.txtField6.delegate = self;
    self.txtField7.delegate = self;
    
    [self setGesturesForImageView:self.img1];
    [self setGesturesForImageView:self.img2];
    [self setGesturesForImageView:self.img3];
    [self setGesturesForImageView:self.img4];
    [self setGesturesForImageView:self.img5];
    [self setGesturesForImageView:self.img6];
    [self setGesturesForImageView:self.img7];
    
    if([helper.imageArr count] > 0 ){
        woundImageCount = [helper.imageArr count];
    }
    else{
        woundImageCount = 0;
    }
    NSLog(@"wound count %d",woundImageCount);
    if([helper.woundName count ] > 0 ){
        if([helper.woundName valueForKey:@"8"]){
            UIImage *image = [UIImage imageNamed:[helper.woundName valueForKey:@"8"]];
            [self.btn1 setImage:image forState:UIControlStateNormal];
        }
        if([helper.woundName valueForKey:@"9"]){
            UIImage *image = [UIImage imageNamed:[helper.woundName valueForKey:@"9"]];
            [self.btn2 setImage:image forState:UIControlStateNormal];
        }
        if([helper.woundName valueForKey:@"10"]){
            UIImage *image = [UIImage imageNamed:[helper.woundName valueForKey:@"10"]];
            [self.btn3 setImage:image forState:UIControlStateNormal];
        }
        if([helper.woundName valueForKey:@"11"]){
            UIImage *image = [UIImage imageNamed:[helper.woundName valueForKey:@"11"]];
            [self.btn4 setImage:image forState:UIControlStateNormal];
        }
        if([helper.woundName valueForKey:@"12"]){
            UIImage *image = [UIImage imageNamed:[helper.woundName valueForKey:@"12"]];
            [self.btn5 setImage:image forState:UIControlStateNormal];
        }
        if([helper.woundName valueForKey:@"13"]){
            UIImage *image = [UIImage imageNamed:[helper.woundName valueForKey:@"13"]];
            [self.btn6 setImage:image forState:UIControlStateNormal];
        }
        if([helper.woundName valueForKey:@"14"]){
            UIImage *image = [UIImage imageNamed:[helper.woundName valueForKey:@"14"]];
            [self.btn7 setImage:image forState:UIControlStateNormal];
        }
        
    }
    
    if([helper.imageText count ] > 0){
        if([helper.imageText valueForKey:@"15"]){
            [self.txtField1 setText:[helper.imageText valueForKey:@"15"]];
        }
        if([helper.imageText valueForKey:@"16"]){
            [self.txtField2 setText:[helper.imageText valueForKey:@"16"]];
        }
        if([helper.imageText valueForKey:@"17"]){
            [self.txtField3 setText:[helper.imageText valueForKey:@"17"] ];
        }
        if([helper.imageText valueForKey:@"18"]){
            [self.txtField4 setText:[helper.imageText valueForKey:@"18"]];
        }
        if([helper.imageText valueForKey:@"19"]){
            [self.txtField5 setText:[helper.imageText valueForKey:@"19"]];
        }
        if([helper.imageText valueForKey:@"20"]){
            [self.txtField6 setText:[helper.imageText valueForKey:@"20"] ];
        }
        if([helper.imageText valueForKey:@"21"]){
            [self.txtField7 setText:[helper.imageText valueForKey:@"21"] ];
        }
        
    }
    
    [self enableUserAccess];
}

- (void)setGesturesForImageView:(UIImageView *)imageVieww{
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageTapGesture:)];
    tapGesture.numberOfTapsRequired = 1;
    [tapGesture setDelegate:self];
    [imageVieww addGestureRecognizer:tapGesture];
}
-(void) viewDidAppear:(BOOL)animated{
    [self loadSavedImages];
}
-(void)loadSavedImages{
    CoreDataHelper *coredataHelper = [CoreDataHelper sharedInstance];
    NSArray *keysArr = [coredataHelper.imageArr allKeys];
    if([coredataHelper.imageArr count] > 0)
    {
        for(int i=0;i<keysArr.count;i++){
            UIImage *imgFinal = [coredataHelper.imageArr valueForKey:keysArr[i]];
            int tagTo = [keysArr[i] intValue]; //[[CoreDataHelper sharedInstance].selectedImageTag intValue];
            UIImageView *originalView = (UIImageView*)[self.view viewWithTag:tagTo];
            originalView.image = imgFinal;
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)imageTapGesture:(UITapGestureRecognizer *)sender
{
    if(sender.state == UIGestureRecognizerStateEnded){
        [CoreDataHelper sharedInstance].selectedImageTag = [NSString stringWithFormat:@"%ld" ,(long)[sender.view tag]];
        UIImageView *imageViewClicked = (UIImageView*)[self.view viewWithTag:[sender.view tag]];
        UIImage *imageto = imageViewClicked.image;
        
        CropImageViewController *cropImageView = [self.storyboard instantiateViewControllerWithIdentifier:@"CropImageViewController"];
        cropImageView.imageTocrop = imageto;
        [self presentViewController:cropImageView animated:YES completion:nil];
    }
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)takePicture:(id)sender {
    if(woundImageCount <7){
        _pickerController = [[UIImagePickerController alloc]init];
        [_pickerController.view setFrame:CGRectMake(0, 0, 950, 725)];
        _pickerController.delegate = self;
        _pickerController.allowsEditing = YES;
        _pickerController.sourceType =UIImagePickerControllerSourceTypeSavedPhotosAlbum;// UIImagePickerControllerSourceTypeCamera;//
        [leftViewPanel setHidden:YES];
        [topViewPanel setHidden:YES];
        [self.view addSubview:_pickerController.view];
        
    }
    else{
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Wound Image" message:@"Count reached maximum" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
}


-(BOOL)shouldAutorotate{
    return NO;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    int offsetValue = 100;
    if (textField.tag >18)
        offsetValue = 395;
    p= self.scrollView.contentOffset;
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x, offsetValue)];
    return YES;
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
     self.scrollView.contentOffset =p;
    return YES;
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    NSLog(@"didFinishPickingMediaWithInfo");
    UIImage *imageCaptured = [info objectForKey:UIImagePickerControllerEditedImage];
    woundImageCount++;
    switch (woundImageCount) {
        case 1:
            self.img1.image = imageCaptured;
            [[CoreDataHelper sharedInstance].imageArr setValue:self.img1.image forKey:[NSString stringWithFormat:@"%d",woundImageCount]];
            break;
        case 2:
            self.img2.image = imageCaptured;
            [[CoreDataHelper sharedInstance].imageArr setValue:self.img2.image forKey:[NSString stringWithFormat:@"%d",woundImageCount]];
            break;
        case 3:
            self.img3.image = imageCaptured;
            [[CoreDataHelper sharedInstance].imageArr setValue:self.img3.image forKey:[NSString stringWithFormat:@"%d",woundImageCount]];
            break;
        case 4:
            self.img4.image = imageCaptured;
            [[CoreDataHelper sharedInstance].imageArr setValue:self.img4.image forKey:[NSString stringWithFormat:@"%d",woundImageCount]];
            break;
        case 5:
            self.img5.image = imageCaptured;
            [[CoreDataHelper sharedInstance].imageArr setValue:self.img5.image forKey:[NSString stringWithFormat:@"%d",woundImageCount]];
            break;
        case 6:
            self.img6.image = imageCaptured;
            [[CoreDataHelper sharedInstance].imageArr setValue:self.img6.image forKey:[NSString stringWithFormat:@"%d",woundImageCount]];
            break;
        case 7:
            self.img7.image = imageCaptured;
            [[CoreDataHelper sharedInstance].imageArr setValue:self.img7.image forKey:[NSString stringWithFormat:@"%d",woundImageCount]];
            break;
            
        default:
            break;
    }
    [self enableUserAccess];
    
    [_pickerController.view removeFromSuperview];
    [leftViewPanel setHidden:NO];
    [topViewPanel setHidden:NO];
   // [le setHidden:NO];
   // [assessmentViewControllerGlobal.topView setHidden:NO];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"imagePickerControllerDidCancel");
    [_pickerController.view removeFromSuperview];
    
}

- (IBAction)showWoundIds:(id)sender {
    btn = sender;
    selectedbtn = [sender tag];
    _woundIdPopupViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"WoundIdPopupViewController"];
    self.woundIdPopupViewController.delegate = self;
    self.popOver = [[UIPopoverController alloc]initWithContentViewController:_woundIdPopupViewController];
    [self.popOver setPopoverContentSize:CGSizeMake(250, 200)];
    [self.popOver presentPopoverFromRect:[sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];
    
}

-(void)dismissWoundPopOver:(UIImage *)imageTag labelName:(NSString *)labelName{
    [[CoreDataHelper sharedInstance].woundIdDic setValue:imageTag forKey:[NSString stringWithFormat:@"%d",[btn tag]]];
    [[CoreDataHelper sharedInstance].woundName setValue:labelName forKey:[NSString stringWithFormat:@"%d",[btn tag]]];
    [self.popOver dismissPopoverAnimated:YES];
    [btn setImage:imageTag forState:UIControlStateNormal];
}
-(void)enableUserAccess{
    int tempCount = 0;
    while (tempCount != woundImageCount) {
        [self enableFirstImage:tempCount];
        tempCount ++;
    }
    
}
- (IBAction)checkboxClicked:(id)sender {
    UIButton *chckbtn =(UIButton*)sender;
    if([chckbtn.currentImage isEqual:[UIImage imageNamed:@"checkboxmark.png"]]){
        if(flagvalue>0){
        flagvalue--;
        }
        [chckbtn setImage:[UIImage imageNamed:@"checkboxun.png"] forState:UIControlStateNormal];
    }
    else{
        flagvalue++;
        [chckbtn setImage:[UIImage imageNamed:@"checkboxmark.png"] forState:UIControlStateNormal];
    }
}
-(void)enableFirstImage:(int)tempCount{
    if(tempCount == 0){
        [self.img1 setUserInteractionEnabled:YES];
        [self.btn1 setUserInteractionEnabled:YES];
        [self.chkbx1 setUserInteractionEnabled:YES];
        [self.txtField1 setUserInteractionEnabled:YES];
    }
    else if(tempCount == 1){
        [self.img2 setUserInteractionEnabled:YES];
        [self.btn2 setUserInteractionEnabled:YES];
        [self.chkbx2 setUserInteractionEnabled:YES];
        [self.txtField2 setUserInteractionEnabled:YES];
    }
    else if(tempCount == 2){
        [self.img3 setUserInteractionEnabled:YES];
        [self.btn3 setUserInteractionEnabled:YES];
        [self.chkbx3 setUserInteractionEnabled:YES];
        [self.txtField3 setUserInteractionEnabled:YES];
    }
    else if(tempCount == 3){
        [self.img4 setUserInteractionEnabled:YES];
        [self.btn4 setUserInteractionEnabled:YES];
        [self.chkbx4 setUserInteractionEnabled:YES];
        [self.txtField4 setUserInteractionEnabled:YES];
    }
    else if(tempCount == 4){
        [self.img5 setUserInteractionEnabled:YES];
        [self.btn5 setUserInteractionEnabled:YES];
        [self.chkbx5 setUserInteractionEnabled:YES];
        [self.txtField5 setUserInteractionEnabled:YES];
    }
    else if(tempCount == 5){
        [self.img6 setUserInteractionEnabled:YES];
        [self.btn6 setUserInteractionEnabled:YES];
        [self.chkbx6 setUserInteractionEnabled:YES];
        [self.txtField6 setUserInteractionEnabled:YES];
    }
    else if(tempCount == 6){
        [self.img7 setUserInteractionEnabled:YES];
        [self.btn7 setUserInteractionEnabled:YES];
        [self.chkbx7 setUserInteractionEnabled:YES];
        [self.txtField7 setUserInteractionEnabled:YES];
    }
}
- (IBAction)textEditDone:(id)sender {
    UITextField *txtFild = sender;
    [[CoreDataHelper sharedInstance].imageText setValue:[txtFild text] forKey:[NSString stringWithFormat:@"%d",[txtFild tag]]];
}

- (IBAction)assessClick:(id)sender {
    if(flagvalue>0){
       _woundvc =[self.storyboard instantiateViewControllerWithIdentifier:@"woundreason"];
        [assessmentGlobalView addSubview:_woundvc.view];
        [assessmentglobalviewcontroller addChildViewController:_woundvc];
        

    }
}

    


@end
