//
//  firsttableviewcontroller.m
//  pic1
//
//  Created by Sujitha on 27/03/15.
//  Copyright (c) 2015 Cognizant. All rights reserved.
//

#import "SelectWoundTypeTableViewController.h"
@interface SelectWoundTypeTableViewController ()
@property(nonatomic,strong)UIPopoverController *popOver1;

@end


@implementation SelectWoundTypeTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
      //_popViewController.dataDelegate = self;

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    
    
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    _items=[[NSArray alloc]init];
    self.items = [NSArray arrayWithObjects:@"Wound", @"Gastrostomy", @"Ostomy", nil];
    
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    
    return [self.items count];
    
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];}
        cell.textLabel.text = [self.items objectAtIndex:indexPath.row];
        
        return cell;
    }


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    
//    UIStoryboard *storyBoard=[UIStoryboard storyboardWithName:@"Main" bundle:Nil];
//    
//    secondviewcontroller *popViewController1=[storyBoard instantiateViewControllerWithIdentifier:@"SecondViewController"];
//    
//
//
//    self.popOver1=[[UIPopoverController alloc]initWithContentViewController:popViewController1];
//    [self.popOver1 setPopoverContentSize:CGSizeMake(300, 150)];
//    [self.popOver1 presentPopoverFromRect:cell.frame inView:cell.contentView permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];

    self.itemsToBePassed=[_items objectAtIndex:indexPath.row];
    [self.dataDelegate getData:self.itemsToBePassed];
    
}




@end

