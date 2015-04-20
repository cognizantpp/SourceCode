//
//  CropImageViewController.m
//  WoundCare
//
//  Created by Sangeetha on 13/04/15.
//
//

#import "CropImageViewController.h"
#import "AssessmentViewController.h"

@interface CropImageViewController ()
@property (weak, nonatomic) IBOutlet UIView *sizeView;
@property (weak, nonatomic) IBOutlet UIView *tapView;
- (IBAction)okBeginCropTap:(id)sender;
- (IBAction)sizeValueClicked:(id)sender;
- (IBAction)btnCropClicked:(id)sender;

@end
BOOL canCrop = NO;
CGPoint point;
CGRect rect;
@implementation CropImageViewController
UIImage *finalImage;
- (void)viewDidLoad {
    [super viewDidLoad];
    dummyView = [[UIView alloc]init];
    [self.imageView setUserInteractionEnabled:YES];
    self.imageView.image = self.imageTocrop;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:nil];
    tap.numberOfTapsRequired = 1;
    tap.delegate = self;
    [self.imageView addGestureRecognizer:tap];
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(!canCrop)
    {
        [self.tapView setHidden:NO];
    }
    else{
        UITouch *touch = [touches anyObject];
        point=[touch locationInView:self.imageView];
        [self.sizeView setHidden:NO];
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)okBeginCropTap:(id)sender {
    [self.tapView setHidden:YES];
    canCrop = YES;
}

- (IBAction)sizeValueClicked:(id)sender {
    
    dummyView.layer.borderColor = [UIColor whiteColor].CGColor;
    dummyView.layer.borderWidth = 1.0f;
    [dummyView setBackgroundColor:[UIColor clearColor]];
    [self.imageView addSubview:dummyView];
    switch ([sender tag]) {
        case 1:
        {
            rect=CGRectMake(point.x-215, point.y-215,430,430);
            
            break;
        }
        case 2:
        {
            rect=CGRectMake(point.x-200, point.y-200,400,400);
            
            break;
        }
        case 3:
        {
            rect=CGRectMake(point.x-150, point.y-150,300,300);
            
            break;
            
        }
        case 4:
        {
            
        }
        case 5:
        {
            
        }
        default:
            break;
    }
    [self.sizeView setHidden:YES];
    [dummyView setFrame:rect];
    [self cropImage];
    
}

- (IBAction)btnCropClicked:(id)sender {
    AssessmentViewController *pictureView = [self.storyboard instantiateViewControllerWithIdentifier:@"AssessmentViewController"];
    pictureView.buttonClicked = 7;
    [self presentViewController:pictureView animated:YES completion:nil];
}

- (IBAction)btnCancelClicked:(id)sender {
    
}
-(void)cropImage
{
    UIGraphicsBeginImageContext(self.view.bounds.size);
    [self.imageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CGImageRef imageRef = CGImageCreateWithImageInRect([viewImage CGImage], rect);
    finalImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    [[CoreDataHelper sharedInstance].imageArr setValue:finalImage forKey:[CoreDataHelper sharedInstance].selectedImageTag];
    
}
@end
