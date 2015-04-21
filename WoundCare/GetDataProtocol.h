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
//ReviewOfSystems
-(void)getRiskFactorData:(NSArray *)data ;
-(void)getConsultsData:(NSArray *)data;
-(void)getTestsData:(NSArray *)data;
-(void)getROSMobilityString:(NSString *)data andScore:(NSInteger)painScore;
-(void)getROSActivityString:(NSString *)data andScore:(NSInteger)painScore;
-(void)getROSSensoryString:(NSString *)data andScore:(NSInteger)painScore;
-(void)getROSMoistureString:(NSString *)data andScore:(NSInteger)painScore;
-(void)getROSFrictionString:(NSString *)data andScore:(NSInteger)painScore;
-(void)getROSNutritionString:(NSString *)data andScore:(NSInteger)painScore;
-(void)getROSTissueString:(NSString *)data andScore:(NSInteger)painScore;
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
//dismisswoundIDpopOver
-(void)dismissWoundPopOver:(UIImage*) imageTag labelName:(NSString *)labelName;
//Ostomy
-(void)getOstomySiteData:(NSArray *)data;
-(void)getStomaLocationData:(NSString *)data;
-(void)getStomaColorData:(NSString *)data;
-(void)getStomaOutputColorData:(NSString *)data;
-(void)getStomaOutputCharacterData:(NSArray *)data;
-(void)getFistulaLocationData:(NSString *)data;
-(void)getFistulaColorData:(NSString *)data;
-(void)getPeristomalSkinCharacterData:(NSArray *)data;
-(void)getPeristomalSkinExudateCharacterData:(NSArray *)data;
-(void)getPeristomalSkinExudateOdourData:(NSString *)data;
-(void)getPeristomalSkinExudateAmountData:(NSString *)data;
-(void)getPeristomalSkinGranulationTissueData:(NSString *)data;
-(void)getPeristomalSkinEdemaData:(NSString *)data;
-(void)getPeristomalSkinConditionData:(NSString *)data;
-(void)getOnsetDate:(NSString *)date;
-(void)updateStomaLength:(NSString*)entryNumber;
-(void)updateStomaWidth:(NSString*)entryNumber;
-(void)updateStomaDepth:(NSString*)entryNumber;
-(void)updateFistulaLength:(NSString*)entryNumber;
-(void)updateFistulaWidth:(NSString*)entryNumber;
-(void)updateFistulaDepth:(NSString*)entryNumber;
-(void)OkSizeClicked;
//gastrostomy
-(void)getGastrostomySite:(NSArray *)data;
-(void)getGastrostomyTubeType:(NSArray *)data;
-(void)getCharacter:(NSArray *)data;
-(void)getRetentionDisk:(NSArray *)data;
-(void)getPeristomalSkinCharacter:(NSArray *)data;
-(void)getExudateCharacter:(NSArray *)data;


-(void)getExudateOdor:(NSString *)data;
-(void)getExudateAmount:(NSString *)data;
-(void)getGranulationTissue:(NSString *)data;
-(void)getEdema:(NSString *)data;
-(void)getCondition:(NSString *)data;
-(void)getDate1:(NSString *)date;



-(void)getAssignmentDate:(NSDate *)date;



@end
