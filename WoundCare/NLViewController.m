//
//  NLViewController.m
//  NLImageCropper
//
// Copyright © 2012, Mirza Bilal (bilal@mirzabilal.com)
// All rights reserved.
//  Permission is hereby granted, free of charge, to any person obtaining a copy
// Redistribution and use in source and binary forms, with or without modification,
// are permitted provided that the following conditions are met:
// 1.	Redistributions of source code must retain the above copyright notice,
//       this list of conditions and the following disclaimer.
// 2.	Redistributions in binary form must reproduce the above copyright notice,
//       this list of conditions and the following disclaimer in the documentation
//       and/or other materials provided with the distribution.
// 3.	Neither the name of Mirza Bilal nor the names of its contributors may be used
//       to endorse or promote products derived from this software without specific
//       prior written permission.
// THIS SOFTWARE IS PROVIDED BY MIRZA BILAL "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
// INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
// FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL MIRZA BILAL BE LIABLE FOR
// ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
// BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
// PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER
// IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
// ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#import "NLViewController.h"
#import "AssessmentViewController.h"
@interface NLViewController ()

@end

@implementation NLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _imageCropper = [[NLImageCropperView alloc] initWithFrame:CGRectMake(0, 0, 1024, 700)];
    [self.view addSubview:_imageCropper];
    //NSLog(<#NSString *format, ...#>) _imageTocrop.size.width;
    
    [_imageCropper setImage:_imageTocrop];
    [_imageCropper setCropRegionRect:CGRectMake(10, 50, 450, 380)];

    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillDisappear:(BOOL)animated{
    //[_imageCropper removeFromSuperview];
    [_imageCropper removeCropView];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)cropClicked:(UIButton *)sender {
    
    UIImage *cropimage = [_imageCropper getCroppedImage];
    [CoreDataHelper sharedInstance].gblCroppedImage = cropimage;
    [CoreDataHelper sharedInstance].isCropDone = YES;
    [_imageCropper removeFromSuperview];
    AssessmentViewController *pictureView = [self.storyboard instantiateViewControllerWithIdentifier:@"AssessmentViewController"];
    [CoreDataHelper sharedInstance].buttonClicked = 7;
    [self presentViewController:pictureView animated:YES completion:nil];
}

@end
