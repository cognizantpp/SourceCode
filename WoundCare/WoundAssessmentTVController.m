//
//  WoundAssessmentTVController.m
//  WoundCare
//
//  Created by keerthana on 27/04/15.
//
//

#import "WoundAssessmentTVController.h"

@interface WoundAssessmentTVController ()

@end
NSMutableArray *selectedArray;
NSArray *woundArray;
int count=0;
NSString *str=@"Wound";
@implementation WoundAssessmentTVController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"poppupsmall.png"]];
    [self.tableView setBackgroundView:imageView];
    
    selectedArray=[[NSMutableArray alloc]init];
       NSLog(@"%@",[CoreDataHelper sharedInstance].woundNumber);
    
    woundArray=[[CoreDataHelper sharedInstance] setWoundTable:entry_no];
    count=0;
    for(int i=0;i<woundArray.count;i++)
    {
        if([woundArray[i] containsString:@"w"]){
            count++;
             NSString *str1=[NSString stringWithFormat:@"%d",count];
             NSString *res=[NSString stringWithFormat:@"%@ %@",str,str1];
            NSLog(@"%@",str);
            [selectedArray addObject:res];
            
        }
        if([woundArray[i] containsString:@"g"]){
             [selectedArray addObject:@"Gastrostomy"];
        }
        if([woundArray[i] containsString:@"o"]){
            [selectedArray addObject:@"Ostomy"];
        }

        
    }
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    NSLog(@"%@",selectedArray);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return selectedArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   // UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    static NSString *CellIdentifier =@"myCell";
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];//[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"popup.png"]];

    cell.textLabel.text=[selectedArray objectAtIndex:indexPath.row];
    
    return cell;
    
    // Configure the cell...
    
    //return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
        NSString *str=[selectedArray objectAtIndex:indexPath.row];
    if ([str isEqualToString:@"Gastrostomy"])
    {
        [CoreDataHelper sharedInstance].buttonClicked=13;
        [self dismissViewControllerAnimated:NO completion:nil];
        NSLog(@"hey.......");
        
        _GVC1=[self.storyboard instantiateViewControllerWithIdentifier:@"gastro"];
        
        [[CoreDataHelper sharedInstance].assessmentGlobalView addSubview:_GVC1.view];
        
        [[CoreDataHelper sharedInstance].assessmentglobalviewcontroller addChildViewController:_GVC1];
    
        
        //[self presentViewController:_GVC animated:YES completion:nil];
        //  _GVC.dataDelegate=self;
        
    }
    
    
    else if ([str isEqualToString: @"Ostomy"])
    {
        
        [CoreDataHelper sharedInstance].buttonClicked=14;
        NSLog(@"hey.......");
        [self dismissViewControllerAnimated:NO completion:nil];
        _OVC1=[self.storyboard instantiateViewControllerWithIdentifier:@"OstomyViewController"];
        [[CoreDataHelper sharedInstance].assessmentGlobalView addSubview:_OVC1.view];
        [[CoreDataHelper sharedInstance].assessmentglobalviewcontroller addChildViewController:_OVC1];
        [CoreDataHelper sharedInstance].buttonClicked=13;
        //[self presentViewController:OVC animated:YES completion:nil];
        //  _GVC.dataDelegate=self;
    }
    
    else if ([str containsString : @"Wound"])
    {
        [CoreDataHelper sharedInstance].buttonClicked=12;

        NSLog(@"hey.......");
        [self dismissViewControllerAnimated:NO completion:nil];
        
        _WVC1=[self.storyboard instantiateViewControllerWithIdentifier:@"woundreason"];
        [[CoreDataHelper sharedInstance].assessmentGlobalView addSubview:_WVC1.view];
        [[CoreDataHelper sharedInstance].assessmentglobalviewcontroller addChildViewController:_WVC1];
        
        // [assessmentGlobal addChildViewController:_WVC];
        // [assessmentGlobal.childViewControllers[0] removeFromSuperview];
        
        
        
        
    }

}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
