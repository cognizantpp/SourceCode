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
NSArray *selectedArray;
@implementation WoundAssessmentTVController

- (void)viewDidLoad {
    [super viewDidLoad];
    selectedArray=[[NSArray alloc]init];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"poppupsmall.png"]];
    [self.tableView setBackgroundView:imageView];
    for(int i=0;i<[CoreDataHelper sharedInstance].woundNumber.count;i++)
    {
        if([[CoreDataHelper sharedInstance].woundNumber[i] containsString:@"w"]){
            selectedArray =[NSArray arrayWithObject:@"Wound"];
        }
        if([[CoreDataHelper sharedInstance].woundNumber[i] containsString:@"g"]){
            selectedArray =[NSArray arrayWithObject:@"Gastrostomy"];
        }
        if([[CoreDataHelper sharedInstance].woundNumber[i] containsString:@"o"]){
            selectedArray =[NSArray arrayWithObject:@"Ostomy"];
        }


            
    }
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return self.selectedArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   // UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    static NSString *CellIdentifier =@"myCell";
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text=[self.selectedArray objectAtIndex:indexPath.row];
    
    return cell;
//    static NSString *simpleTableIdentifier = @"myCell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
//    
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
//        cell.accessoryType = UITableViewCellAccessoryNone;
//    }
//    else
//        _selectedArray=[CoreDataHelper sharedInstance].woundNumber;

    
    // Configure the cell...
    
    //return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
