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
#import "PainSave.h"


@interface CoreDataHelper : NSObject

+(instancetype)sharedInstance;
@property(strong,nonatomic)NSManagedObjectContext *managedObjectContext;
@property(strong,nonatomic)NSString *gblstaffName,*gblstaffId;
@property(strong,nonatomic)NSArray *paincategoryid;
@property(strong,nonatomic)NSArray *paincategory_name;
@property(strong,nonatomic)NSArray *painselected_value;

@property(strong,nonatomic)NSArray *educationcategoryid;
@property(strong,nonatomic)NSArray *educationcategory_name;
@property(strong,nonatomic)NSArray *educationselected_value;
@property(strong,nonatomic)NSArray *educationOthervalues;

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
-(void)savePain:(NSString *)entryNo andCategoryid:(NSArray *)category_id andCategoryname:(NSArray *)Category_name andSelectedvalue:(NSArray *)Selected_value;
-(NSArray *)setPainFields:(NSString *)entryNo;
@end
