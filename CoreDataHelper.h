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
#import "EducationSave.h"
#import "TreatmentSave.h"
#import "RecommendationsSave.h"
#import "Wound.h"
#import "Ostomy.h"
#import "OstomySave.h"
#import "ReviewAssessment.h"
#import "ReviewBase.h"
#import "ReviewSaveBase.h"
#import "ReviewAssessment.h"
#import "Ostomy.h"
#import "OstomySave.h"
#import "ReviewBase.h"
#import "ReviewAssessmentSave.h"
#import "GastrostomySave.h"
#import "WoundReason.h"
#import "WoundReasonSave.h"


@interface CoreDataHelper : NSObject

@property (nonatomic)long buttonClicked;

@property(weak,nonatomic)UIView *assessmentGlobalView;
@property(weak,nonatomic)UIViewController *assessmentglobalviewcontroller;
@property(weak,nonatomic)NSString *unit1;
@property(weak,nonatomic)NSString *unit2;
@property(weak,nonatomic)NSString *unit3;
@property(weak,nonatomic)NSString *unit4;
@property(weak,nonatomic)NSString *unit5;
@property(weak,nonatomic)NSString *unit6;
@property(weak,nonatomic)NSString *unit7;
+(instancetype)sharedInstance;
@property(strong,nonatomic)NSManagedObjectContext *managedObjectContext;
@property(strong,nonatomic)NSString *gblstaffName,*gblstaffId;
@property(strong,nonatomic)NSArray *paincategoryid;
@property(strong,nonatomic)NSArray *paincategory_name;
@property(strong,nonatomic)NSArray *painselected_value;

@property(strong,nonatomic)NSArray *reviewbasecategoryid;
@property(strong,nonatomic)NSArray *reviewbasecategory_name;
@property(strong,nonatomic)NSArray *reviewbaseselected_value;
@property(strong,nonatomic)NSArray *reviewbaseOthervalues;

@property(strong,nonatomic)NSArray *reviewassesscategoryid;
@property(strong,nonatomic)NSArray *reviewassesscategory_name;
@property(strong,nonatomic)NSArray *reviewassessselected_value;
@property(strong,nonatomic)NSArray *reviewassessOthervalues;
@property(strong,nonatomic)NSArray *reviewassessScorevalues;

@property(strong,nonatomic)NSArray *educationcategoryid;
@property(strong,nonatomic)NSArray *educationcategory_name;
@property(strong,nonatomic)NSArray *educationselected_value;
@property(strong,nonatomic)NSArray *educationOthervalues;

@property(strong,nonatomic)NSArray *treatmentcategoryid;
@property(strong,nonatomic)NSArray *treatmentcategory_name;
@property(strong,nonatomic)NSArray *treatmentselected_value;
@property(strong,nonatomic)NSArray *treatmentOthervalues;
//ImageCapture
@property (strong, nonatomic) NSString *selectedImageTag;
@property (strong, nonatomic)NSMutableDictionary *imageArr;
@property (strong,nonatomic)NSMutableDictionary *imageText;
@property (strong, nonatomic) NSMutableDictionary *woundIdDic;
@property (strong, nonatomic)NSMutableDictionary *woundName;
-(void)saveImages;
-(void)fetchImages;
-(void)deleteSelectedImages:(NSString*)imageIdToDelete;


//WoundCapture
@property (strong, nonatomic) NSMutableArray *woundCoordinates;
@property (strong, nonatomic) NSMutableArray *woundNumber;
@property (strong, nonatomic) NSMutableArray *woundImageName;
-(void)fetchWoundCoordinates;
-(void)saveWoundCoordinates;
-(void)deleteWoundCoordinates:(NSString *)woundnum;


@property(strong,nonatomic)NSMutableArray *recommendationcategoryid;
@property(strong,nonatomic)NSArray *recommendationcategory_name;
@property(strong,nonatomic)NSArray *recommendationselected_value;
@property(strong,nonatomic)NSArray *recommendationOthervalues;

//ostomy
@property(strong,nonatomic)NSArray *ostomycategoryid;
@property(strong,nonatomic)NSArray *ostomycategory_name;
@property(strong,nonatomic)NSArray *ostomyselected_value;
@property(strong,nonatomic)NSArray *ostomyOthervalues;




-(void)insertIntoContextForEntity:(NSString *)login withUsername:(NSString *)username andPassword:(NSString *)password;
-(void)insertNewPatients:(NSDictionary*)newPatient;
-(BOOL)validateEntryNumber:(NSString *)entryNo;
-(BOOL)validateUserId:(NSString *)userid andpassword:(NSString *)password;

-(BOOL)CheckUserId:(NSString *)userid;
-(PatientDetails *) getAssignmentsList:(NSString *)staffId;
-(void)getOldAssignments;
-(NSMutableArray *)fetchTheFlaccFields:(NSString *)categoryId;
-(NSMutableArray *)fetchTheFlaccScore:(NSString *)categoryId;

-(NSMutableArray *)fetchTheEducationFields:(NSString *)categoryId;
-(NSMutableArray *)fetchTheTreatmentFields:(NSString *)categoryId;
-(NSMutableArray *)fetchTheRecommendationsFields:(NSString *)categoryId;
-(NSMutableArray *)fetchTheOstomyFields:(NSString *)categoryId;
-(NSMutableArray *)fetchTheReviewBaseFields:(NSString *)categoryId;
-(NSMutableArray *)fetchTheReviewAssessmentFields:(NSString *)categoryId;
-(NSMutableArray *)fetchTheReviewAssessmentSubFields:(NSString *)categoryId;
-(NSMutableArray *)fetchTheReviewScoreFields:(NSString *)categoryId;
-(NSMutableArray *)fetchTheWoundReasonFields:(NSString *)categoryId;



-(void)savePain:(NSString *)entryNo ;
-(NSArray *)setPainFields:(NSString *)entryNo;

-(void)saveEducation:(NSString *)entryNo ;
-(NSArray *)setEducationFields:(NSString *)entryNo ;

-(void)saveTreatment:(NSString *)entryNo ;
-(NSArray *)setTreatmentFields:(NSString *)entryNo ;

-(void)saveRecommendation:(NSString *)entryNo ;
-(NSArray *)setRecommendationFields:(NSString *)entryNo ;

-(void)saveReviewbase:(NSString *)entryNo;
-(NSArray *)setReviewbaseFields:(NSString *)entryNo;
-(void)saveReviewAssess:(NSString *)entryNo;
-(NSArray *)setReviewassessFields:(NSString *)entryNo;

-(void)saveOstomy:(NSString *)entryNo;
-(NSArray *)setOstomyFields:(NSString *)entryNo;
-( void)fetchOstomySaved;

-(void)fetchRecommendationsSaved;

//GastrostomyReason

@property(strong,nonatomic)NSArray *gastrostomycategoryid;
@property(strong,nonatomic)NSArray *gastrostomycategory_name;
@property(strong,nonatomic)NSArray *gastrostomyselected_value;
@property(strong,nonatomic)NSArray *gastrostomyOthervalues;
-(void)saveGastrostomy:(NSString *)entryNo andCategoryid:(NSArray *)category_id andCategoryname:(NSArray *)Category_name andSelectedvalue:(NSArray *)Selected_value andOther:(NSArray *)other;
-( void)fetchGastrostomySaved;
-(NSArray *)setGastroFields:(NSString *)entryNo;
-(void)changeStatus:(NSString *)entryNo;

//wound reason
@property(strong,nonatomic)NSArray *woundreasoncategoryid;
@property(strong,nonatomic)NSArray *woundreasoncategory_name;
@property(strong,nonatomic)NSArray *woundreasonselected_value;
@property(strong,nonatomic)NSArray *woundreasonOthervalues;
-(void)saveWoundReason:(NSString *)entryNo andCategoryid:(NSArray *)category_id andCategoryname:(NSArray *)Category_name andSelectedvalue:(NSArray *)Selected_value andOther:(NSArray *)other;
-(NSArray *)setWoundReasonFields:(NSString *)entryNo;
@end
