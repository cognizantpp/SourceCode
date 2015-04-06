//
//  DismissPopOver.h
//  WoundCare
//
//  Created by Sangeetha on 24/03/15.
//
//

#import <Foundation/Foundation.h>

@protocol DismissPopOver <NSObject>

@optional
-(void)OkClicked;
-(void)updateEntryNumber:(NSString*)entryNumber;


@end
