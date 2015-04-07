//
//  GetDataProtocol.h
//  PainView
//
//  Created by Antony on 27/03/14.
//  Copyright (c) 2014 Cognizant. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GetDataProtocol <NSObject>

@optional
//Pain
-(void)getCharacterData:(NSArray *)data;
-(void)getMethodData:(NSString *)data;
-(void)getPainScore:(NSInteger )data;
-(void)dismissFlaccPopOver;
-(void)getFaceString:(NSString *)data andScore:(NSInteger)painScore;
-(void)getLegString:(NSString *)data andScore:(NSInteger)painScore;
-(void)getActivityString:(NSString *)data andScore:(NSInteger)painScore;
-(void)getCryString:(NSString *)data andScore:(NSInteger)painScore;
-(void)getConsolabilityString:(NSString *)data andScore:(NSInteger)painScore;
-(void)getFlaccPainScore:(NSInteger)data;
//Education
-(void)getDiscussedData:(NSArray *)data;
-(void)getMethodEducationData:(NSArray *)data;
-(void)getHandOutData:(NSArray *)data;
-(void)getPersonTaughtData:(NSArray *)data;
-(void)getComprehensionData:(NSArray *)data;
-(void)getTeachingAssessmentData:(NSArray *)data;
//Recommendations
-(void)getMobilityData:(NSArray *)data;
-(void)getActivityData:(NSArray *)data;
-(void)getSensoryPerceptionData:(NSArray *)data;
-(void)getMoistureData:(NSArray *)data;
-(void)getFrictionData:(NSArray *)data;
-(void)getTissueData:(NSArray *)data;
-(void)getFollowUpData:(NSString *)data;
-(void)getDate:(NSString *)date;
//Treatment
-(void)getData:(NSArray *)data;
-(void)getDressingData:(NSArray *)data;
-(void)getNegativePressureWoundData:(NSArray *)data;
-(void)getSkinCareData:(NSArray *)data;
//Number Entry
-(void)OkClicked;
-(void)updateEntryNumber:(NSString*)entryNumber;
//EducationNumber Entry
-(void)OkEducationClicked;
-(void)updateEducationEntryNumber:(NSString*)entryNumber;
//RecommendationsNumberEntry
-(void)OkRecommendationsClicked;
-(void)updateRecommendationsEntryNumber:(NSString*)entryNumber;
//PatientInfo
-(void)patientInfoOKClicked;

@end
