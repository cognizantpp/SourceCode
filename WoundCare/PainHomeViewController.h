//
//  PainHomeViewController.h
//  PainView
//
//  Created by Antony on 27/03/14.
//  Copyright (c) 2014 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectCharacterTableViewController.h"
#import "selectMethodTableViewController.h"
#import "SelectWongBackerFacesViewController.h"
#import "SelectFlaccViewController.h"

@interface PainHomeViewController : UIViewController<GetDataProtocol>

- (IBAction)selectButtonAction:(UIButton *)sender;


@property (weak, nonatomic) IBOutlet UIButton *methodButtonOutlet;

@property (weak, nonatomic) IBOutlet UIButton *characterButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *scoreButtonOutlet;



@property(nonatomic,strong)SelectCharacterTableViewController *selectCharacterViewController;
@property(nonatomic,strong)selectMethodTableViewController *selectMethodViewController;
@property(nonatomic,strong)SelectWongBackerFacesViewController *selectWongBackerViewController;
@property(nonatomic,strong)SelectFlaccViewController *selectFlaccViewController;



@end
