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
#import "Pain.h"
#import "Education.h"
#import "Treatment.h"
#import "Recommendations.h"


@interface CoreDataHelper : NSObject

+(instancetype)sharedInstance;
@property(strong,nonatomic)NSManagedObjectContext *managedObjectContext;
@property(strong,nonatomic)NSString *gblstaffName,*gblstaffId;

-(void)insertIntoContextForEntity:(NSString *)login withUsername:(NSString *)username andPassword:(NSString *)password;
-(void)insertNewPatients:(NSDictionary*)newPatient;
-(BOOL)validateEntryNumber:(NSString *)entryNo;
-(BOOL)validateUserId:(NSString *)userid andpassword:(NSString *)password;

-(BOOL)CheckUserId:(NSString *)userid;
-(PatientDetails *) getAssignmentsList:(NSString *)staffId;
-(void)getOldAssignments;
-(NSArray *)fetchTheFlaccFields:(NSString *)categoryId;
-(NSArray *)fetchTheFlaccScore:(NSString *)categoryId;

-(NSArray *)fetchTheEducationFields:(NSString *)categoryId;
-(NSArray *)fetchTheTreatmentFields:(NSString *)categoryId;
-(NSArray *)fetchTheRecommendationsFields:(NSString *)categoryId;

@end
