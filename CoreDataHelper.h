//
//  CoreDataHelper.h
//  SampleDB
//
//  Created by Sangeetha on 16/03/15.
//  Copyright (c) 2015 Sangeetha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PatientDetails.h"


@interface CoreDataHelper : NSObject

+(instancetype)sharedInstance;
@property(strong,nonatomic)NSManagedObjectContext *managedObjectContext;
@property(strong,nonatomic)NSString *gblstaffName,*gblstaffId;

-(void)insertIntoContextForEntity:(NSString *)login withUsername:(NSString *)username andPassword:(NSString *)password;
-(void)insertNewPatients:(NSDictionary*)newPatient;
-(BOOL)validateEntryNumber:(NSString *)entryNo;
-(BOOL)validateUserId:(NSString *)userid andpassword:(NSString *)password;
-(PatientDetails *) getAssignmentsList:(NSString *)staffId;
@end
