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
#import "NLViewController.h"

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
- (IBAction)checkboxClicked:(id)sender;
- (IBAction)textEditDone:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *assessment;

@end
int tagValue;
int flagvalue;
@implementation PictureViewController
int selectedbtn;
int woundImageCount = 0;
int imageCount = 0;
int selectedImageTag =0;
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
    [helper fetchAllImages];
    //    if([helper.pictureImgArr count] > 0 ){
    //        woundImageCount = (int)[helper.pictureImgArr count];
    //    }
    //    else{
    //        woundImageCount = 0;
    //    }
    //    NSLog(@"wound count %d",woundImageCount);
    UIImage *grayimage = [UIImage imageNamed:@"graycircle.png"];
    if([helper.pictureImgName count] > 0){
        UIImage *image1 = [UIImage imageNamed:[helper.pictureImgName objectAtIndex:0]];
        if(image1 == nil){
            [self.btn1 setImage:grayimage forState:UIControlStateNormal];
            [self.btn1 setAccessibilityValue:@"graycircle.png"];
        }
        else{
            [self.btn1 setImage:image1 forState:UIControlStateNormal];
            [self.btn1 setAccessibilityValue:[helper.pictureImgName objectAtIndex:0]];
            
        }
    }
    else{
        [self.btn1 setImage:grayimage forState:UIControlStateNormal];
        [self.btn1 setAccessibilityValue:@"graycircle.png"];
    }
    if([helper.pictureImgName count] > 1){
        UIImage *image2 = [UIImage imageNamed:[helper.pictureImgName objectAtIndex:1]];
        if(image2 == nil){
            [self.btn2 setImage:grayimage forState:UIControlStateNormal];
           [self.btn2 setAccessibilityValue:@"graycircle.png"];
        }
        else{
            [self.btn2 setImage:image2 forState:UIControlStateNormal];
             [self.btn2 setAccessibilityValue:[helper.pictureImgName objectAtIndex:1]];
            
        }
    }
    else{
        [self.btn2 setImage:grayimage forState:UIControlStateNormal];
        [self.btn2 setAccessibilityValue:@"graycircle.png"];
    }
    
    if([helper.pictureImgName count] > 2){
        UIImage *image3 = [UIImage imageNamed:[helper.pictureImgName objectAtIndex:2]];
        if(image3 == nil){
            [self.btn3 setImage:grayimage forState:UIControlStateNormal];
           [self.btn3 setAccessibilityValue:@"graycircle.png"];
        }
        else{
            [self.btn3 setImage:image3 forState:UIControlStateNormal];
             [self.btn3 setAccessibilityValue:[helper.pictureImgName objectAtIndex:2]];
            
        }
    }
    else{
        [self.btn3 setImage:grayimage forState:UIControlStateNormal];
        [self.btn3 setAccessibilityValue:@"graycircle.png"];
    }
    
    if([helper.pictureImgName count] > 3){
        UIImage *image4 = [UIImage imageNamed:[helper.pictureImgName objectAtIndex:3]];
        if(image4 == nil){
            [self.btn4 setImage:grayimage forState:UIControlStateNormal];
            [self.btn4 setAccessibilityValue:@"graycircle.png"];
        }
        
        else{
            [self.btn4 setImage:image4 forState:UIControlStateNormal];
            [self.btn4 setAccessibilityValue:[helper.pictureImgName objectAtIndex:3]];
            
        }
    }
    else{
        [self.btn4 setImage:grayimage forState:UIControlStateNormal];
        [self.btn4 setAccessibilityValue:@"graycircle.png"];
    }
    
    if([helper.pictureImgName count] > 4){
        UIImage *image5 = [UIImage imageNamed:[helper.pictureImgName objectAtIndex:4]];
        if(image5 == nil){
            [self.btn5 setImage:grayimage forState:UIControlStateNormal];
            [self.btn5 setAccessibilityValue:@"graycircle.png"];
        }
        else{
            [self.btn5 setImage:image5 forState:UIControlStateNormal];
            [self.btn5 setAccessibilityValue:[helper.pictureImgName objectAtIndex:4]];
            
        }
    }
    else{
        [self.btn5 setImage:grayimage forState:UIControlStateNormal];
        [self.btn5 setAccessibilityValue:@"graycircle.png"];
    }
    
    
    if([helper.pictureImgName count] > 5){
        UIImage *image6 = [UIImage imageNamed:[helper.pictureImgName objectAtIndex:5]];
        if(image6 == nil){
            [self.btn6 setImage:grayimage forState:UIControlStateNormal];
            [self.btn6 setAccessibilityValue:@"graycircle.png"];
        }
        else{
            [self.btn6 setImage:image6 forState:UIControlStateNormal];
            [self.btn6 setAccessibilityValue:[helper.pictureImgName objectAtIndex:5]];
           
        }
    }
    else{
        [self.btn6 setImage:grayimage forState:UIControlStateNormal];
        [self.btn6 setAccessibilityValue:@"graycircle.png"];
    }
    
    
    if([helper.pictureImgName count] > 6){
        UIImage *image7 = [UIImage imageNamed:[helper.pictureImgName objectAtIndex:6]];
        if(image7 == nil){
            [self.btn7 setImage:grayimage forState:UIControlStateNormal];
            [self.btn7 setAccessibilityValue:@"graycircle.png"];
        }
        else{
            [self.btn7 setImage:image7 forState:UIControlStateNormal];
            [self.btn7 setAccessibilityValue:[helper.pictureImgName objectAtIndex:6]];
        }
    }
    else{
        [self.btn7 setImage:grayimage forState:UIControlStateNormal];
        [self.btn7 setAccessibilityValue:@"graycircle.png"];
    }
    
    
    //    if([helper.woundName count ] > 0 ){
    //        UIImage *imageReal = [UIImage imageNamed:@"graycircle.png"];
    //        if([helper.woundName valueForKey:@"8"]){
    //            UIImage *image = [UIImage imageNamed:[helper.woundName valueForKey:@"8"]];
    //            if(image != nil)
    //                [self.btn1 setImage:image forState:UIControlStateNormal];
    //            else{
    //
    //                [self.btn1 setImage:imageReal forState:UIControlStateNormal];
    //            }
    //        }
    //
    //        if([helper.woundName valueForKey:@"9"]){
    //            UIImage *image = [UIImage imageNamed:[helper.woundName valueForKey:@"9"]];
    //            if (image!= nil) {
    //                [self.btn2 setImage:image forState:UIControlStateNormal];
    //            }
    //            else{
    //                [self.btn2 setImage:imageReal forState:UIControlStateNormal];
    //            }
    //        }
    //
    //        if([helper.woundName valueForKey:@"10"]){
    //            UIImage *image = [UIImage imageNamed:[helper.woundName valueForKey:@"10"]];
    //            if(image != nil)
    //                [self.btn3 setImage:image forState:UIControlStateNormal];
    //            else{
    //                [self.btn3 setImage:imageReal forState:UIControlStateNormal];
    //            }
    //        }
    //
    //        if([helper.woundName valueForKey:@"11"]){
    //            UIImage *image = [UIImage imageNamed:[helper.woundName valueForKey:@"11"]];
    //            if(image != nil)
    //                [self.btn4 setImage:image forState:UIControlStateNormal];
    //            else{
    //                [self.btn4 setImage:imageReal forState:UIControlStateNormal];
    //            }
    //        }
    //
    //        if([helper.woundName valueForKey:@"12"]){
    //            UIImage *image = [UIImage imageNamed:[helper.woundName valueForKey:@"12"]];
    //            if(image != nil)
    //                [self.btn5 setImage:image forState:UIControlStateNormal];
    //            else{
    //                [self.btn5 setImage:imageReal forState:UIControlStateNormal];
    //            }
    //        }
    //
    //        if([helper.woundName valueForKey:@"13"]){
    //            UIImage *image = [UIImage imageNamed:[helper.woundName valueForKey:@"13"]];
    //            if(image != nil)
    //                [self.btn6 setImage:image forState:UIControlStateNormal];
    //            else{
    //                [self.btn6 setImage:imageReal forState:UIControlStateNormal];
    //            }
    //        }
    //
    //        if([helper.woundName valueForKey:@"14"]){
    //            UIImage *image = [UIImage imageNamed:[helper.woundName valueForKey:@"14"]];
    //            if(image != nil)
    //                [self.btn7 setImage:image forState:UIControlStateNormal];
    //            else{
    //                [self.btn7 setImage:imageReal forState:UIControlStateNormal];
    //            }
    //        }
    //
    //
    //    }
    
    if([helper.pictureImgText count] > 0){
        [self.txtField1 setText:[helper.pictureImgText objectAtIndex:0]];
        if([helper.pictureImgName count] > 1)
            [self.txtField2 setText:[helper.pictureImgText objectAtIndex:1]];
        if([helper.pictureImgName count] > 2)
            [self.txtField3 setText:[helper.pictureImgText objectAtIndex:2]];
        if([helper.pictureImgName count] > 3)
            [self.txtField4 setText:[helper.pictureImgText objectAtIndex:3]];
        if([helper.pictureImgName count] > 4)
            [self.txtField5 setText:[helper.pictureImgText objectAtIndex:4]];
        if([helper.pictureImgName count] > 5)
            [self.txtField6 setText:[helper.pictureImgText objectAtIndex:5]];
        if([helper.pictureImgName count] > 6)
            [self.txtField7 setText:[helper.pictureImgText objectAtIndex:6]];
        
    }
    
    
    //    if([helper.imageText count ] > 0){
    //        if([helper.imageText valueForKey:@"15"]){
    //            [self.txtField1 setText:[helper.imageText valueForKey:@"15"]];
    //        }
    //        if([helper.imageText valueForKey:@"16"]){
    //            [self.txtField2 setText:[helper.imageText valueForKey:@"16"]];
    //        }
    //        if([helper.imageText valueForKey:@"17"]){
    //            [self.txtField3 setText:[helper.imageText valueForKey:@"17"] ];
    //        }
    //        if([helper.imageText valueForKey:@"18"]){
    //            [self.txtField4 setText:[helper.imageText valueForKey:@"18"]];
    //        }
    //        if([helper.imageText valueForKey:@"19"]){
    //            [self.txtField5 setText:[helper.imageText valueForKey:@"19"]];
    //        }
    //        if([helper.imageText valueForKey:@"20"]){
    //            [self.txtField6 setText:[helper.imageText valueForKey:@"20"] ];
    //        }
    //        if([helper.imageText valueForKey:@"21"]){
    //            [self.txtField7 setText:[helper.imageText valueForKey:@"21"] ];
    //        }
    //
    //    }
    
    
}

- (void)setGesturesForImageView:(UIImageView *)imageVieww{
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageTapGesture:)];
    tapGesture.numberOfTapsRequired = 1;
    [tapGesture setDelegate:self];
    [imageVieww addGestureRecognizer:tapGesture];
}
-(void) viewDidAppear:(BOOL)animated{
    [self loadSavedImages];
    [self enableUserAccess];
    NSLog(@"loaded");
}
-(void)loadSavedImages{
    CoreDataHelper *coredataHelper = [CoreDataHelper sharedInstance];
    // NSArray *keysArr = [coredataHelper.imageArr allKeys];
    int noimagesCount = 0;
    if([coredataHelper.pictureImgArr count] > 0)
    {
        for(int i=0;i<[coredataHelper.pictureImgArr count];i++){
            UIImage *imgFinal = [coredataHelper.pictureImgArr objectAtIndex:i];
            if(imgFinal == nil){
                imgFinal = [UIImage imageNamed:@"noimage.png"];
            }
            if(![UIImagePNGRepresentation(imgFinal) isEqual:UIImagePNGRepresentation([UIImage imageNamed:@"noimage.png"])])
            {
                noimagesCount ++;
            }
            int tagTo = i+1;//[keysArr[i] intValue]; //[[CoreDataHelper sharedInstance].selectedImageTag intValue];
            UIImageView *originalView = (UIImageView*)[self.view viewWithTag:tagTo];
            originalView.image = imgFinal;
        }
        if([coredataHelper.pictureImgArr count] <7)
        {
            int i =[coredataHelper.pictureImgArr count];
            for(int j=i;j<=7;j++){
                UIImage *imgFinal = [UIImage imageNamed:@"noimage.png"];
                UIImageView *originalView = (UIImageView*)[self.view viewWithTag:j];
                originalView.image = imgFinal;
            }
            
        }
        woundImageCount = noimagesCount;
    }
    else{
        woundImageCount = 0;
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
        
//        CropImageViewController *cropImageView = [self.storyboard instantiateViewControllerWithIdentifier:@"CropImageViewController"];
//        cropImageView.imageTocrop = imageto;
//        [self presentViewController:cropImageView animated:YES completion:nil];
        
        NLViewController *nlViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"NLViewController"];
        nlViewController.imageTocrop = imageto;
        [self presentViewController:nlViewController animated:NO completion:nil];
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
        [_pickerController.view setFrame:CGRectMake(0, 0, 1024, 768)];
        _pickerController.delegate = self;
        _pickerController.allowsEditing = YES;
        _pickerController.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;//UIImagePickerControllerSourceTypeSavedPhotosAlbum;// UIImagePickerControllerSourceTypeCamera;//
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
            // [[CoreDataHelper sharedInstance].imageArr setValue:self.img1.image forKey:[NSString stringWithFormat:@"%d",woundImageCount]];
            
            break;
        case 2:
            self.img2.image = imageCaptured;
            //[[CoreDataHelper sharedInstance].imageArr setValue:self.img2.image forKey:[NSString stringWithFormat:@"%d",woundImageCount]];
            break;
        case 3:
            self.img3.image = imageCaptured;
            //  [[CoreDataHelper sharedInstance].imageArr setValue:self.img3.image forKey:[NSString stringWithFormat:@"%d",woundImageCount]];
            break;
        case 4:
            self.img4.image = imageCaptured;
            //  [[CoreDataHelper sharedInstance].imageArr setValue:self.img4.image forKey:[NSString stringWithFormat:@"%d",woundImageCount]];
            break;
        case 5:
            self.img5.image = imageCaptured;
            // [[CoreDataHelper sharedInstance].imageArr setValue:self.img5.image forKey:[NSString stringWithFormat:@"%d",woundImageCount]];
            break;
        case 6:
            self.img6.image = imageCaptured;
            //    [[CoreDataHelper sharedInstance].imageArr setValue:self.img6.image forKey:[NSString stringWithFormat:@"%d",woundImageCount]];
            break;
        case 7:
            self.img7.image = imageCaptured;
            //   [[CoreDataHelper sharedInstance].imageArr setValue:self.img7.image forKey:[NSString stringWithFormat:@"%d",woundImageCount]];
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
    [leftViewPanel setHidden:NO];
    [topViewPanel setHidden:NO];
    [_pickerController.view removeFromSuperview];
    
}

- (IBAction)showWoundIds:(id)sender {
    btn = sender;
    selectedbtn = (int)[sender tag];
    _woundIdPopupViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"WoundIdPopupViewController"];
    self.woundIdPopupViewController.delegate = self;
    self.popOver = [[UIPopoverController alloc]initWithContentViewController:_woundIdPopupViewController];
    [self.popOver setPopoverContentSize:CGSizeMake(250, 200)];
    [self.popOver presentPopoverFromRect:[sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];
    
}

-(void)dismissWoundPopOver:(UIImage *)imageTag labelName:(NSString *)labelName{
    //[[CoreDataHelper sharedInstance].woundIdDic setValue:imageTag forKey:[NSString stringWithFormat:@"%d",(int)[btn tag]]];
    [[CoreDataHelper sharedInstance].woundName setValue:labelName forKey:[NSString stringWithFormat:@"%d",(int)[btn tag]]];
    [self.popOver dismissPopoverAnimated:YES];
    [btn setImage:imageTag forState:UIControlStateNormal];
    [btn setAccessibilityValue:labelName];
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
        // selectedImageTag = (int)[sender tag];
        int tagValue = (int)[sender tag];
        switch (tagValue) {
            case 22:
                selectedImageTag = 1;
                break;
            case 23:
                selectedImageTag = 2;
                break;
            case 24:
                selectedImageTag = 3;
                break;
            case 25:
                selectedImageTag = 4;
                break;
            case 26:
                selectedImageTag = 5;
                break;
            case 27:
                selectedImageTag = 6;
                break;
            case 28:
                selectedImageTag = 7;
                break;
            default:
                break;
        }
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
    // [[CoreDataHelper sharedInstance].imageText setValue:[txtFild text] forKey:[NSString stringWithFormat:@"%d",(int)[txtFild tag]]];
}

- (IBAction)assessClick:(id)sender {
    if(flagvalue>0){
        [CoreDataHelper sharedInstance].buttonClicked=12;
        
        _woundvc =[self.storyboard instantiateViewControllerWithIdentifier:@"woundreason"];
        [[CoreDataHelper sharedInstance].assessmentGlobalView addSubview:_woundvc.view];
        [[CoreDataHelper sharedInstance].assessmentglobalviewcontroller addChildViewController:_woundvc];
        
        
    }
}
- (IBAction)deleteSelectedImage:(UIButton *)sender {
    if(flagvalue>0){
        AssessmentViewController *assessmentViewControllerNow = [[AssessmentViewController alloc]init];
        [assessmentViewControllerNow getPictureViewData];
        [[CoreDataHelper sharedInstance]saveAllImages];
        NSMutableArray *tobeDeleted = [[NSMutableArray alloc]init];
        if( [self.chkbx1.imageView.image isEqual:[UIImage imageNamed:@"checkboxmark.png"]] ){
            [tobeDeleted addObject:@"1"];
        }
        if( [self.chkbx2.imageView.image isEqual:[UIImage imageNamed:@"checkboxmark.png"]] ){
            [tobeDeleted addObject:@"2"];
        }
        if( [self.chkbx3.imageView.image isEqual:[UIImage imageNamed:@"checkboxmark.png"]] ){
            [tobeDeleted addObject:@"3"];
        }
        if( [self.chkbx4.imageView.image isEqual:[UIImage imageNamed:@"checkboxmark.png"]] ){
            [tobeDeleted addObject:@"4"];
        }
        if( [self.chkbx5.imageView.image isEqual:[UIImage imageNamed:@"checkboxmark.png"]] ){
            [tobeDeleted addObject:@"5"];
        }
        if( [self.chkbx6.imageView.image isEqual:[UIImage imageNamed:@"checkboxmark.png"]] ){
            [tobeDeleted addObject:@"6"];
        }
        if( [self.chkbx7.imageView.image isEqual:[UIImage imageNamed:@"checkboxmark.png"]] ){
            [tobeDeleted addObject:@"7"];
        }
        for (int i=0; i< [tobeDeleted count]; i++) {
            [[CoreDataHelper sharedInstance] deleteSelectedImages:tobeDeleted[i]];
        }
        
      //  [[CoreDataHelper sharedInstance] deleteSelectedImages:[NSString stringWithFormat:@"%d",selectedImageTag]];
        // [[CoreDataHelper sharedInstance] fetchAllImages];
       UIViewController *assess =  [self parentViewController];
       // AssessmentViewController *pictureView = [self.storyboard instantiateViewControllerWithIdentifier:@"AssessmentViewController"];
        [CoreDataHelper sharedInstance].buttonClicked = 7;
        [CoreDataHelper sharedInstance].isDeletePhotoClicked = YES;
        //[self presentViewController:pictureView animated:NO completion:nil];
        [assess viewDidLoad];
    }
}




@end
