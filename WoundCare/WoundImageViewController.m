//
//  ViewController.m
//  pic1
//
//  Created by Sujitha on 25/03/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import "WoundImageViewController.h"
#import "CoreDataHelper.h"
@interface WoundImageViewController ()

@property(nonatomic,strong)UIPopoverController *popOver1;
@property(nonatomic,strong)UIPopoverController *popOver2;
@property(nonatomic,strong)UIPopoverController *popOver3;
@property(nonatomic,strong)UIPopoverController *popOver4;
@property(nonatomic,strong)UIPopoverController *popOver5;



@property(nonatomic,strong)UIPopoverController *popOver;
@property(nonatomic,strong)NSString *woundtype;


@property(nonatomic)int wc;
@property(nonatomic)int oc;
@property(nonatomic)int gc;
@property(nonatomic)int locx;
@property(nonatomic)int locy;

//@property(nonatomic,strong) UIScrollView *scrollV;
@end


@implementation WoundImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _popViewController = [[SelectWoundTypeTableViewController alloc] init];
    _popViewController.dataDelegate = self;
    self.wc=0;
    self.oc=0;
    self.gc=0;
    self.locx=0;
    self.locy=0;
    self.WoundCordinateArray = [[NSMutableArray alloc] init];
    self.GastroCordinateArray = [[NSMutableArray alloc] init];
    self.OstoCordinateArray = [[NSMutableArray alloc] init];
 //   self.captureImage=[[WouldyouliketousecameraVC alloc]init];

    // Do any additional setup after loading the view, typically from a nib.
    
    
    
//    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected:)];
//    tapGesture.numberOfTapsRequired = 1;
//    tapGesture.numberOfTouchesRequired = 1;
//    
    //_imageV=[[UIImageView alloc]init];
//    UIImage *mapImage = [UIImage imageNamed:@"humanbodywithimg.png"];
//    _imageV = [[UIImageView alloc] initWithImage:mapImage];
   // _scrollV.contentSize = CGSizeMake(_imageV.frame.size.width, _imageV.frame.size.height);
   // _scrollV.backgroundColor=[UIColor blueColor];
    
    
     //_imageV.delegate = self;
   // [_imageV addGestureRecognizer:tapGesture];
    
    [self setSelectedCoordinates];
}


-(void)setSelectedCoordinates{
    CoreDataHelper *helper = [CoreDataHelper sharedInstance];
    [helper fetchWoundCoordinates];
    for(int i=0;i<[helper.woundCoordinates count]; i++){
        NSString *loc = [helper.woundCoordinates objectAtIndex:i];
        NSArray *location = [loc componentsSeparatedByString:@" "];
        UIImageView *dot =[[UIImageView alloc] initWithFrame:CGRectMake([location[0] intValue]-75,[location[1] intValue]-85,20,20)];
        dot.image=[UIImage imageNamed:[helper.woundImageName objectAtIndex:i]];
        [self.view addSubview:dot];
        
        if([[helper.woundNumber objectAtIndex:i]containsString:@"w"]){
            self.wc ++;
        }
        else if([[helper.woundNumber objectAtIndex:i]containsString:@"g"]){
            self.gc ++;
        }
        else if([[helper.woundNumber objectAtIndex:i]containsString:@"o"]){
            self.oc ++;
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:_imageV];
    
    NSLog(@"x:-%f,y:-%f",location.x,location.y);
    if((location.x >=150 && location.x <=375 && location.y >=115 && location.y <=645)||
       (location.x >=460 && location.x <=685 && location.y >=115 && location.y <=640)||
       (location.x >=840 && location.x <=1000 && location.y >=180 && location.y <=345)||
       (location.x >=805 && location.x <=1025 && location.y >=390 && location.y <=550))
        
    {
        _locx=location.x;
        _locy=location.y;
        CGRect rect=[_imageV frame];
        
        NSLog(@"%@",NSStringFromCGRect(rect));
        
        rect.origin.x=521;
        rect.origin.y=221;
        NSLog(@"%@",NSStringFromCGRect(rect));
        
        self.popOver=[[UIPopoverController alloc]initWithContentViewController:_popViewController];
        [self.popOver setPopoverContentSize:CGSizeMake(300,150)];
        [self.popOver presentPopoverFromRect:rect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];}
}


-(void)getData:(NSString *)data
{
    self.woundtype=data;
    
    //_captureImage.selectedString=data;
    //NSLog(@"self.....%@",self.woundtypetoebepassed);
    
    
    CGRect rect=[_imageV frame];
    
    
    
    
    rect.origin.x=521;
    rect.origin.y=221;

    
  
    //[self.myButtonOutlet setTitle:selectedData forState:UIControlStateNormal];
    [self.popOver dismissPopoverAnimated: YES];
    
    if ([self.woundtype  isEqualToString:@"Wound"]  ){
        
        if(self.wc <7)
        {UIStoryboard *storyBoard=[UIStoryboard storyboardWithName:@"Main" bundle:Nil];
            
            WouldyouliketomarkVC *popViewController1=[storyBoard instantiateViewControllerWithIdentifier:@"SecondViewController"];
            
            
            popViewController1.dataDelegate=self;
            self.popOver1=[[UIPopoverController alloc]initWithContentViewController:popViewController1];
            [self.popOver1 setPopoverContentSize:CGSizeMake(300, 150)];
            [self.popOver1 presentPopoverFromRect:rect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
        }
        
        if(self.wc >=7)
        {
            UIStoryboard *storyBoard=[UIStoryboard storyboardWithName:@"Main" bundle:Nil];
            
            WoundlimitreachedVC *popViewController3=[storyBoard instantiateViewControllerWithIdentifier:@"fourthviewcontroller"];
            
            
            popViewController3.dataDelegate=self;
            self.popOver3=[[UIPopoverController alloc]initWithContentViewController:popViewController3];
            [self.popOver3 setPopoverContentSize:CGSizeMake(300, 150)];
            [self.popOver3 presentPopoverFromRect:rect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
        }
        
    }
    
    //gstro
    if ([self.woundtype  isEqualToString:@"Gastrostomy"]  ){
        if(self.gc <1)
        {UIStoryboard *storyBoard=[UIStoryboard storyboardWithName:@"Main" bundle:Nil];
            
            WouldyouliketomarkVC *popViewController1=[storyBoard instantiateViewControllerWithIdentifier:@"SecondViewController"];
            popViewController1.dataDelegate=self;
            self.popOver1=[[UIPopoverController alloc]initWithContentViewController:popViewController1];
            [self.popOver1 setPopoverContentSize:CGSizeMake(300, 150)];
            [self.popOver1 presentPopoverFromRect:rect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
        }
        if(self.gc >=1)
        {
            
            UIStoryboard *storyBoard=[UIStoryboard storyboardWithName:@"Main" bundle:Nil];
            
            GastrocountreachedVC *popViewController4=[storyBoard instantiateViewControllerWithIdentifier:@"fifthviewcontroller"];
            popViewController4.dataDelegate=self;
            self.popOver4=[[UIPopoverController alloc]initWithContentViewController:popViewController4];
            [self.popOver4 setPopoverContentSize:CGSizeMake(300, 150)];
            [self.popOver4 presentPopoverFromRect:rect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
        }
        
    }
    
    
    
    //ostro
    
    if ([self.woundtype  isEqualToString:@"Ostomy"]  ){
        
        if(self.oc <1)
        {UIStoryboard *storyBoard=[UIStoryboard storyboardWithName:@"Main" bundle:Nil];
            
            WouldyouliketomarkVC *popViewController1=[storyBoard instantiateViewControllerWithIdentifier:@"SecondViewController"];
            popViewController1.dataDelegate=self;
            self.popOver1=[[UIPopoverController alloc]initWithContentViewController:popViewController1];
            [self.popOver1 setPopoverContentSize:CGSizeMake(300, 150)];
            [self.popOver1 presentPopoverFromRect:rect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
        }
        if(self.oc >=1)
        {
            UIStoryboard *storyBoard=[UIStoryboard storyboardWithName:@"Main" bundle:Nil];
            
            GastrocountreachedVC *popViewController5=[storyBoard instantiateViewControllerWithIdentifier:@"sixthviewcontroller"];
            popViewController5.dataDelegate=self;
            self.popOver5=[[UIPopoverController alloc]initWithContentViewController:popViewController5];
            [self.popOver5 setPopoverContentSize:CGSizeMake(300, 150)];
            [self.popOver5 presentPopoverFromRect:rect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
        }
        
    }
    
}

-(void)getTagId2:(NSInteger *)data
{
    //NSLog(@"data is %d",data);
    [self.popOver3 dismissPopoverAnimated: YES];
}

-(void)getTagId3:(NSInteger *)data
{
    //NSLog(@"data is %d",data);
    [self.popOver4 dismissPopoverAnimated: YES];
}
-(void)getTagId4:(NSInteger *)data
{
    //NSLog(@"data is %d",data);
    [self.popOver5 dismissPopoverAnimated: YES];
}

-(void)getTagId:(NSInteger *)data
{
    CoreDataHelper *helper = [CoreDataHelper sharedInstance];
    CGRect rect=[_imageV frame];
    rect.origin.x=521;
    rect.origin.y=221;
    [self.popOver1 dismissPopoverAnimated: YES];
    int a=(int)data;
    NSLog(@"value is %d",a);
    NSLog(@"cordinates:%d %d",_locx,_locy);
    switch(a)
    {
        case 1:
        {
            
            if(self.wc < 7)
            {   //NSLog(@"wc=%d",self.wc);
                UIStoryboard *storyBoard=[UIStoryboard storyboardWithName:@"Main" bundle:Nil];
            
            WouldyouliketousecameraVC *popViewController2=[storyBoard instantiateViewControllerWithIdentifier:@"thirdviewcontroller"];
                popViewController2.selectedString = self.woundtype;
        
            
            self.popOver2=[[UIPopoverController alloc]initWithContentViewController:popViewController2];
            [self.popOver2 setPopoverContentSize:CGSizeMake(300, 150)];
                [self.popOver2 presentPopoverFromRect:rect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];}
            
            if ([self.woundtype  isEqualToString:@"Wound"]  ) {
                
                
                NSString *myString = [NSString stringWithFormat:@"%d",_locx];
                [_WoundCordinateArray addObject:myString];
                NSString *myString1 = [NSString stringWithFormat:@"%d",_locy];
                [_WoundCordinateArray addObject:myString1];
                
                NSLog(@"array is %@",_WoundCordinateArray);
                
                NSString *locationString = [[myString stringByAppendingString:@" "] stringByAppendingString:myString1];
                
                [helper.woundCoordinates addObject:locationString];
                
                NSString *imageName;
                if(self.wc == 0)
                {
                    UIImageView *dot =[[UIImageView alloc] initWithFrame:CGRectMake(_locx-75,_locy-85,20,20)];
                    dot.image=[UIImage imageNamed:@"w1.png"];
                    [self.view addSubview:dot];
                    imageName = @"w1.png";
                    
                }
                
                if(self.wc == 1)
                {
                    UIImageView *dot1 =[[UIImageView alloc] initWithFrame:CGRectMake(_locx-75,_locy-85,20,20)];
                    dot1.image=[UIImage imageNamed:@"w2.png"];
                    [self.view addSubview:dot1];
                    imageName = @"w2.png";
                }
                
                if(self.wc == 2)
                {
                    UIImageView *dot2 =[[UIImageView alloc] initWithFrame:CGRectMake(_locx-75,_locy-85,20,20)];
                    dot2.image=[UIImage imageNamed:@"w3.png"];
                    [self.view addSubview:dot2];
                    imageName = @"w3.png";
                }
                
                if(self.wc == 3)
                {
                    UIImageView *dot3 =[[UIImageView alloc] initWithFrame:CGRectMake(_locx-75,_locy-85,20,20)];
                    dot3.image=[UIImage imageNamed:@"w4.png"];
                    [self.view addSubview:dot3];
                    imageName = @"w4.png";
                }
                
                if(self.wc == 4)
                {
                    UIImageView *dot4 =[[UIImageView alloc] initWithFrame:CGRectMake(_locx-75,_locy-85,20,20)];
                    dot4.image=[UIImage imageNamed:@"w5.png"];
                    [self.view addSubview:dot4];
                    imageName = @"w5.png";
                }
                
                if(self.wc == 5)
                {
                    UIImageView *dot5 =[[UIImageView alloc] initWithFrame:CGRectMake(_locx-75,_locy-85,20,20)];
                    dot5.image=[UIImage imageNamed:@"w6.png"];
                    [self.view addSubview:dot5];
                    imageName = @"w6.png";
                }
                
                if(self.wc == 6)
                {
                    UIImageView *dot6 =[[UIImageView alloc] initWithFrame:CGRectMake(_locx-75,_locy-85,20,20)];
                    dot6.image=[UIImage imageNamed:@"w7.png"];
                    [self.view addSubview:dot6];
                    imageName = @"w7.png";
                    
                }
                [helper.woundImageName addObject:imageName];
                self.wc++;
                [helper.woundNumber addObject:[@"w" stringByAppendingString:[NSString stringWithFormat:@"%d",self.wc]]];
                
            }
            
            //GASTRO
            
            
            if(self.gc < 1)
            {
                UIStoryboard *storyBoard=[UIStoryboard storyboardWithName:@"Main" bundle:Nil];
                
                WouldyouliketousecameraVC *popViewController2=[storyBoard instantiateViewControllerWithIdentifier:@"thirdviewcontroller"];
                
                self.popOver2=[[UIPopoverController alloc]initWithContentViewController:popViewController2];
                [self.popOver2 setPopoverContentSize:CGSizeMake(300, 150)];
                [self.popOver2 presentPopoverFromRect:rect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];}
            
            if ([self.woundtype  isEqualToString:@"Gastrostomy"]  ) {
                
                NSString *myString2 = [NSString stringWithFormat:@"%d",_locx];
                [_GastroCordinateArray addObject:myString2];
                NSString *myString3 = [NSString stringWithFormat:@"%d",_locy];
                [_GastroCordinateArray addObject:myString3];
                
                NSLog(@"array is %@",_GastroCordinateArray);
                
                NSString *locString = [[myString2 stringByAppendingString:@" "] stringByAppendingString:myString3];
                
                [helper.woundCoordinates addObject:locString];
                
                
                if(self.gc == 0)
                {
                    UIImageView *dot7 =[[UIImageView alloc] initWithFrame:CGRectMake(_locx-75,_locy-85,20,20)];
                    dot7.image=[UIImage imageNamed:@"g1.png"];
                    [self.view addSubview:dot7];
                    [helper.woundImageName addObject:@"g1.png"];
                }
                self.gc++;
                [helper.woundNumber addObject:[@"g" stringByAppendingString:[NSString stringWithFormat:@"%d",self.gc]]];
            }
            
            
            //ostro
            
            if(self.oc < 1)
            {
                UIStoryboard *storyBoard=[UIStoryboard storyboardWithName:@"Main" bundle:Nil];
                
                WouldyouliketousecameraVC *popViewController2=[storyBoard instantiateViewControllerWithIdentifier:@"thirdviewcontroller"];
                
                
                
                self.popOver2=[[UIPopoverController alloc]initWithContentViewController:popViewController2];
                [self.popOver2 setPopoverContentSize:CGSizeMake(300, 150)];
                [self.popOver2 presentPopoverFromRect:rect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];}
            
            if ([self.woundtype  isEqualToString:@"Ostomy"]  ) {
                
                
                NSString *myString4 = [NSString stringWithFormat:@"%d",_locx];
                [_OstoCordinateArray addObject:myString4];
                NSString *myString5 = [NSString stringWithFormat:@"%d",_locy];
                [_OstoCordinateArray addObject:myString5];
                NSLog(@"array is %@",_OstoCordinateArray);
                NSString *loctnString = [[myString4 stringByAppendingString:@" "] stringByAppendingString:myString5];
                
                [helper.woundCoordinates addObject:loctnString];
                
                if(self.oc == 0)
                {
                    UIImageView *dot8 =[[UIImageView alloc] initWithFrame:CGRectMake(_locx-75,_locy-85,20,20)];
                    dot8.image=[UIImage imageNamed:@"o1.png"];
                    [self.view addSubview:dot8];
                    [helper.woundImageName addObject:@"o1.png"];
                    
                }
                self.oc++;
                [helper.woundNumber addObject:[@"o" stringByAppendingString:[NSString stringWithFormat:@"%d",self.oc]]];
            }
            break;
        }
            
        default:
            break;
    }
    
}
@end


