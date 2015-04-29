//
//  CoreDataHelper.m
//  SampleDB
//
//  Created by Sangeetha on 16/03/15.
//  Copyright (c) 2015 Sangeetha. All rights reserved.
//try to pushdf

#import "CoreDataHelper.h"
#import "Login.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>
#import "AssignmentsViewController.h"
#import "WoundSelection.h"
@interface CoreDataHelper ()


@end

@implementation CoreDataHelper
@synthesize gblstaffId,gblstaffName;

+(instancetype)sharedInstance{
    static CoreDataHelper *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
    
}

-(void)insertIntoContextForEntity:(NSString *)login withUsername:(NSString *)username andPassword:(NSString *)password
{
    //NSEntityDescription *entity = [NSEntityDescription entityForName:@"Login" inManagedObjectContext:[self managedObject]];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Login" inManagedObjectContext:self.managedObjectContext];
    
    Login *loginEntity = [[Login alloc]initWithEntity:entity insertIntoManagedObjectContext:self.managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"Login"];
    // Specify criteria for filtering which objects to fetch
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"userName BEGINSWITH[cd] ", username];
    [fetchRequest setPredicate:predicate];
    // Specify how the fetched objects should be sorted
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"userName"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"Error");
    }
    loginEntity = (Login *)[fetchedObjects firstObject];
    
    
}
-(BOOL)validateUserId:(NSString *)userid andpassword:(NSString *)password{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Login" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    // Specify criteria for filtering which objects to fetch
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K like %@", @"userName",userid];
    [fetchRequest setPredicate:predicate];
    // Specify how the fetched objects should be sorted
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"userName"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"can't fetch");
    }
    else{
        for (Login *theUser in fetchedObjects) {
            if([theUser.userName isEqualToString:userid]){
                if([theUser.password isEqualToString:password]){
                    self.gblstaffName = theUser.staffName;
                    self.gblstaffId = theUser.userName;
                    return YES;
                }
            }
        }
    }
    return NO;
}


-(BOOL)CheckUserId:(NSString *)userid{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Login" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    // Specify criteria for filtering which objects to fetch
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K like %@", @"userName",userid];
    [fetchRequest setPredicate:predicate];
    // Specify how the fetched objects should be sorted
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"userName"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"can't fetch");
    }
    else{
        for (Login *theUser in fetchedObjects) {
            NSLog(@"user %@",theUser.userName);
            if([theUser.userName isEqualToString:userid]){
                
                return YES;
                
            }
        }
    }
    return NO;
}


-(BOOL)validateEntryNumber:(NSString *)entryNo{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"NewPatient" inManagedObjectContext:self.managedObjectContext];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K like %@",@"entry_number",entryNo];
    [fetchRequest setEntity:entity];
    [fetchRequest setPredicate:predicate];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]initWithKey:@"entry_number" ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil || [fetchedObjects count] == 0) {
        return YES;
    }
    else{
        return NO;
    }
    
}

-(void)insertNewPatients:(NSDictionary*)newPatient{
    CoreDataHelper *coreDataHelper = [CoreDataHelper sharedInstance];
    NSManagedObject *insertObject = [NSEntityDescription insertNewObjectForEntityForName:@"NewPatient" inManagedObjectContext:self.managedObjectContext];
    [insertObject setValue:[newPatient valueForKey:@"entry_number"] forKey:@"entry_number"];
    [insertObject setValue:[newPatient valueForKey:@"patient_name"] forKey:@"patient_name"];
    [insertObject setValue:[newPatient valueForKey:@"consult_type"] forKey:@"consult_type"];
    [insertObject setValue:[newPatient valueForKey:@"room_number"] forKey:@"room_number"];
    [insertObject setValue:@"fresh" forKey:@"chart_status"];
    [insertObject setValue:[newPatient valueForKey:@"admit_dt"] forKey:@"admit_dt"];
    [insertObject setValue:[newPatient valueForKey:@"facility_name"] forKey:@"facility_name"];
    [insertObject setValue:[newPatient valueForKey:@"age"] forKey:@"age"];
    [insertObject setValue:[newPatient valueForKey:@"dob"] forKey:@"dob"];
    [insertObject setValue:coreDataHelper.gblstaffId forKey:@"staff_userid"];//coreDataHelper.gblstaffId
    [insertObject setValue:coreDataHelper.gblstaffName forKey:@"staff_name"];//coreDataHelper.gblstaffName
    
    
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Error in saving new Patient : %@",[error localizedDescription]);
    }
}


-(PatientDetails*) getAssignmentsList:(NSString *)staffId{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"NewPatient" inManagedObjectContext:self.managedObjectContext];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K like %@",@"staff_userid",staffId];
    [fetchRequest setEntity:entity];
    [fetchRequest setPredicate:predicate];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]initWithKey:@"patient_name" ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    PatientDetails *patients;
    if (fetchedObjects == nil) {
        NSLog(@"can't fetch patient details");
        return nil;
    }
    else{
        patients = (PatientDetails*)fetchedObjects;
        return patients;
    }
}


-(void) getOldAssignments{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"PatientDetails" inManagedObjectContext:self.managedObjectContext];
    // NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K like %@",@"staff_userid",staffId];
    [fetchRequest setEntity:entity];
    // [fetchRequest setPredicate:predicate];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]initWithKey:@"patient_name" ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"can't fetch old patient details");
        
    }
    else{
        
        
        for (PatientDetails *patients in fetchedObjects) {
            NSManagedObject *insertObject = [NSEntityDescription insertNewObjectForEntityForName:@"NewPatient" inManagedObjectContext:self.managedObjectContext];
            [insertObject setValue:patients.entry_number forKey:@"entry_number"];
            [insertObject setValue:patients.patient_name forKey:@"patient_name"];
            [insertObject setValue:patients.consult_type forKey:@"consult_type"];
            [insertObject setValue:patients.room_number forKey:@"room_number"];
            [insertObject setValue:patients.chart_status forKey:@"chart_status"];
            [insertObject setValue:patients.admit_dt forKey:@"admit_dt"];
            [insertObject setValue:patients.facility_name forKey:@"facility_name"];
            [insertObject setValue:patients.staff_userid forKey:@"staff_userid"];
            [insertObject setValue:patients.staff_name forKey:@"staff_name"];
            [insertObject setValue:patients.admit_md forKey:@"admit_md"];
            [insertObject setValue:patients.dob forKey:@"dob"];
            [insertObject setValue:patients.age forKey:@"age"];
            [insertObject setValue:patients.submit_dt forKey:@"submit_dt"];
            [insertObject setValue:patients.mmi forKey:@"mmi"];
            [insertObject setValue:patients.mrn forKey:@"mrn"];
            [insertObject setValue:patients.sex forKey:@"sex"];
            
            NSError *error;
            if (![self.managedObjectContext save:&error]) {
                NSLog(@"Error in saving new Patient : %@",[error localizedDescription]);
            }
            
        }
    }
    
}


-(NSMutableArray *)fetchTheFlaccFields:(NSString *)categoryId{
    NSMutableArray *categoryFields=[[NSMutableArray alloc]init];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Pain" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Specify criteria for filtering which objects to fetch
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K like %@", @"category_id",categoryId];
    [fetchRequest setPredicate:predicate];
    
    // Specify how the fetched objects should be sorted
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"category_id"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"There was an error in fetching");
    }else{
        
        for (Pain *thePain in fetchedObjects) {
            
            NSLog(@"Pain ID: %@ Name: %@ Fields:%@ Score:%@",thePain.category_id,thePain.category_name,thePain.category_fields,thePain.category_score);
            [categoryFields addObject:thePain.category_fields];
        }
    }
    return  categoryFields;
}




-(NSArray *)fetchTheFlaccScore:(NSString *)categoryId{
    NSMutableArray *categoryScore=[[NSMutableArray alloc]init];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Pain" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Specify criteria for filtering which objects to fetch
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K like %@", @"category_id",categoryId];
    [fetchRequest setPredicate:predicate];
    
    // Specify how the fetched objects should be sorted
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"category_id"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"There was an error in fetching");
    }else{
        
        for (Pain *thePain in fetchedObjects) {
            
            NSLog(@"Pain ID: %@ Name: %@ Fields:%@ Score:%@",thePain.category_id,thePain.category_name,thePain.category_fields,thePain.category_score);
            [categoryScore addObject:thePain.category_score];
        }
    }
    return  categoryScore;
}

-(NSMutableArray *)fetchTheEducationFields:(NSString *)categoryId{
    NSMutableArray *categoryFields=[[NSMutableArray alloc]init];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Education" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Specify criteria for filtering which objects to fetch
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K like %@", @"category_id",categoryId];
    [fetchRequest setPredicate:predicate];
    
    // Specify how the fetched objects should be sorted
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"category_id"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"There was an error in fetching");
    }else{
        
        for (Education *theEdu in fetchedObjects) {
            
            //NSLog(@"Pain ID: %@ Name: %@ Fields:%@ Score:%@",theEdu.category_id,theEdu.category_name,theEdu.category_fields);
            [categoryFields addObject:theEdu.category_fields];
        }
    }
    return  categoryFields;
}

-(NSMutableArray *)fetchTheTreatmentFields:(NSString *)categoryId{
    NSMutableArray *categoryFields=[[NSMutableArray alloc]init];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Treatment" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Specify criteria for filtering which objects to fetch
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K like %@", @"category_id",categoryId];
    [fetchRequest setPredicate:predicate];
    
    // Specify how the fetched objects should be sorted
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"category_id"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"There was an error in fetching");
    }else{
        
        for (Treatment *theTreatment in fetchedObjects) {
            
            //NSLog(@"Pain ID: %@ Name: %@ Fields:%@ Score:%@",theEdu.category_id,theEdu.category_name,theEdu.category_fields);
            [categoryFields addObject:theTreatment.category_fields];
        }
    }
    return  categoryFields;
}

-(NSMutableArray *)fetchTheRecommendationsFields:(NSString *)categoryId{
    NSMutableArray *categoryFields=[[NSMutableArray alloc]init];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Recommendations" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Specify criteria for filtering which objects to fetch
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K like %@", @"category_id",categoryId];
    [fetchRequest setPredicate:predicate];
    
    // Specify how the fetched objects should be sorted
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"category_id"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"There was an error in fetching");
    }else{
        
        for (Recommendations *theRecommendations in fetchedObjects) {
            
            //NSLog(@"Ostomy ID: %@ Name: %@ Fields:%@ Score:%@",theEdu.category_id,theEdu.category_name,theEdu.category_fields);
            [categoryFields addObject:theRecommendations.category_fields];
        }
    }
    return  categoryFields;
}

-(NSMutableArray *)fetchTheOstomyFields:(NSString *)categoryId{
    NSMutableArray *categoryFields=[[NSMutableArray alloc]init];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Ostomy" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Specify criteria for filtering which objects to fetch
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K like %@", @"category_id",categoryId];
    [fetchRequest setPredicate:predicate];
    
    // Specify how the fetched objects should be sorted
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"category_id"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"There was an error in fetching");
    }else{
        
        for (Ostomy *theOstomy in fetchedObjects) {
            
            //            NSLog(@"Ostomy ID: %@ Name: %@ Fields:%@ Score:%@",theOstomy.category_id,theOstomy.category_name,theOstomy.category_fields);
            [categoryFields addObject:theOstomy.category_fields];
        }
    }
    return  categoryFields;
}

-(NSMutableArray *)fetchTheReviewBaseFields:(NSString *)categoryId{
    NSMutableArray *categoryFields=[[NSMutableArray alloc]init];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"ReviewBase" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Specify criteria for filtering which objects to fetch
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K like %@", @"category_id",categoryId];
    [fetchRequest setPredicate:predicate];
    
    // Specify how the fetched objects should be sorted
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"category_id"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"There was an error in fetching");
    }else{
        
        for (ReviewBase *theReviewBase in fetchedObjects) {
            
            //            NSLog(@"Ostomy ID: %@ Name: %@ Fields:%@ Score:%@",theOstomy.category_id,theOstomy.category_name,theOstomy.category_fields);
            [categoryFields addObject:theReviewBase.category_fields];
        }
    }
    return  categoryFields;
}


-(NSMutableArray *)fetchTheReviewAssessmentFields:(NSString *)categoryId{
    NSMutableArray *categoryFields=[[NSMutableArray alloc]init];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"ReviewAssessment" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Specify criteria for filtering which objects to fetch
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K like %@", @"category_id",categoryId];
    [fetchRequest setPredicate:predicate];
    
    // Specify how the fetched objects should be sorted
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"category_id"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"There was an error in fetching");
    }else{
        
        for (ReviewAssessment *theReviewAssesssment in fetchedObjects) {
            
            //            NSLog(@"Ostomy ID: %@ Name: %@ Fields:%@ Score:%@",theOstomy.category_id,theOstomy.category_name,theOstomy.category_fields);
            [categoryFields addObject:theReviewAssesssment.category_fields];
            
        }
    }
    return  categoryFields;
    
}


-(NSMutableArray *)fetchTheReviewScoreFields:(NSString *)categoryId{
    NSMutableArray *categoryFields=[[NSMutableArray alloc]init];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"ReviewAssessment" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Specify criteria for filtering which objects to fetch
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K like %@", @"category_id",categoryId];
    [fetchRequest setPredicate:predicate];
    
    // Specify how the fetched objects should be sorted
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"category_id"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"There was an error in fetching");
    }else{
        
        for (ReviewAssessment *theReviewAssesssment in fetchedObjects) {
            
            //            NSLog(@"Ostomy ID: %@ Name: %@ Fields:%@ Score:%@",theOstomy.category_id,theOstomy.category_name,theOstomy.category_fields);
            [categoryFields addObject:theReviewAssesssment.category_score];
            
        }
    }
    return  categoryFields;
    
}


-(NSMutableArray *)fetchTheReviewAssessmentSubFields:(NSString *)categoryId{
    
    NSMutableArray *categorySubFields=[[NSMutableArray alloc]init];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"ReviewAssessment" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Specify criteria for filtering which objects to fetch
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K like %@", @"category_id",categoryId];
    [fetchRequest setPredicate:predicate];
    
    // Specify how the fetched objects should be sorted
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"category_id"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"There was an error in fetching");
    }else{
        
        for (ReviewAssessment *theReviewAssesssment in fetchedObjects) {
            
            //            NSLog(@"Ostomy ID: %@ Name: %@ Fields:%@ Score:%@",theOstomy.category_id,theOstomy.category_name,theOstomy.category_fields);
            [categorySubFields addObject:theReviewAssesssment.category_subfield];
            
        }
    }
    return  categorySubFields;
    
}

-(NSMutableArray *)fetchTheWoundReasonFields:(NSString *)categoryId{
    NSMutableArray *categoryFields=[[NSMutableArray alloc]init];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"WoundReason" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Specify criteria for filtering which objects to fetch
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K like %@", @"category_id",categoryId];
    [fetchRequest setPredicate:predicate];
    
    // Specify how the fetched objects should be sorted
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"category_id"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"There was an error in fetching");
    }else{
        
        for (WoundReason *theWoundReason in fetchedObjects) {
            
            //            NSLog(@"Ostomy ID: %@ Name: %@ Fields:%@ Score:%@",theOstomy.category_id,theOstomy.category_name,theOstomy.category_fields);
            [categoryFields addObject:theWoundReason.category_fields];  
            
        }
    }
    return  categoryFields;
}


-(void)savePain:(NSString *)entryNo{
    
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"PainSave" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K like %@", @"entry_number",entryNo];
    [fetchRequest setPredicate:predicate];
    
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"category_id"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSManagedObject *matches = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"There was an error in fetching");
    }else{
        
        for (PainSave *thePain in fetchedObjects) {
            matches = thePain;
            [self.managedObjectContext deleteObject:matches];
            [self saveContext];
        }
    }
    for (int i=0;i<self.paincategoryid.count;i++) {
        NSManagedObject *insertObject = [NSEntityDescription insertNewObjectForEntityForName:@"PainSave" inManagedObjectContext:self.managedObjectContext];
        [insertObject setValue:entryNo forKey:@"entry_number"];
        [insertObject setValue:self.paincategoryid[i] forKey:@"category_id"];
        [insertObject setValue:self.paincategory_name[i] forKey:@"category_name"];
        [insertObject setValue:self.painselected_value[i] forKey:@"selected_value"];
        
        [self saveContext];
        
    }
    
    [self fetchPainSaved];
    
}
-(NSArray *)setPainFields:(NSString *)entryNo {
    NSMutableArray *painArr=[[NSMutableArray alloc]init];;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"PainSave" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K like %@", @"entry_number",entryNo];
    [fetchRequest setPredicate:predicate];
    
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"category_id"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"There was an error in fetching");
    }else{
        
        for (PainSave *thePain in fetchedObjects) {
            [painArr addObject:thePain.selected_value];
        }
    }
    return painArr;
}
-( void)fetchPainSaved{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"PainSave" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"category_id"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"There was an error in fetching");
    }else{
        
        for (PainSave *thePain in fetchedObjects) {
            
            NSLog(@"category ID: %@ Name: %@ entry_no:%@ selected_value:%@",thePain.category_id,thePain.category_name,thePain.entry_number,thePain.selected_value);
        }
    }
}

-(void)saveReviewbase:(NSString *)entryNo{
    
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"ReviewSaveBase" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K like %@", @"entry_number",entryNo];
    [fetchRequest setPredicate:predicate];
    
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"category_id"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSManagedObject *matches = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"There was an error in fetching");
    }else{
        
        for (ReviewSaveBase *theReview in fetchedObjects) {
            matches = theReview;
            [self.managedObjectContext deleteObject:matches];
            [self saveContext];
        }
    }
    for (int i=0;i<self.reviewbasecategoryid.count;i++) {
        NSManagedObject *insertObject = [NSEntityDescription insertNewObjectForEntityForName:@"ReviewSaveBase" inManagedObjectContext:self.managedObjectContext];
        [insertObject setValue:entryNo forKey:@"entry_number"];
        [insertObject setValue:self.reviewbasecategoryid[i] forKey:@"category_id"];
        [insertObject setValue:self.reviewbasecategory_name[i] forKey:@"category_name"];
        [insertObject setValue:self.reviewbaseselected_value[i] forKey:@"selected_value"];
        [insertObject setValue:self.reviewbaseOthervalues[i] forKey:@"other_value"];
        [self saveContext];
        
    }
    
    [self fetchReviewbaseSaved];
    
}

-(NSArray *)setReviewbaseFields:(NSString *)entryNo {
    NSMutableArray *reviewArr=[[NSMutableArray alloc]init];
    //NSMutableArray *eduotherArr=[[NSMutableArray alloc]init];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"ReviewSaveBase" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K like %@", @"entry_number",entryNo];
    [fetchRequest setPredicate:predicate];
    
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"category_id"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"There was an error in fetching");
    }else{
        
        for (ReviewSaveBase *theReview in fetchedObjects) {
            [reviewArr addObject:theReview.selected_value];
        }
        for (ReviewSaveBase *theReview in fetchedObjects) {
            [reviewArr addObject:theReview.other_value];
        }
        
    }
    NSLog(@"%@",reviewArr);
    return reviewArr;
}
-( void)fetchReviewbaseSaved{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"ReviewSaveBase" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"category_id"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"There was an error in fetching");
    }else{
        
        for (ReviewSaveBase *theReview in fetchedObjects) {
            
            NSLog(@"category ID: %@ Name: %@ entry_no:%@ selected_value:%@ other:%@",theReview.category_id,theReview.category_name,theReview.entry_number,theReview.selected_value,theReview.other_value);
        }
    }
}

-(void)saveReviewAssess:(NSString *)entryNo{
    
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"ReviewAssessmentSave" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K like %@", @"entry_number",entryNo];
    [fetchRequest setPredicate:predicate];
    
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"category_id"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSManagedObject *matches = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"There was an error in fetching");
    }else{
        
        for (ReviewAssessmentSave *theReview in fetchedObjects) {
            matches = theReview;
            [self.managedObjectContext deleteObject:matches];
            [self saveContext];
        }
    }
    for (int i=0;i<self.reviewassesscategoryid.count;i++) {
        NSManagedObject *insertObject = [NSEntityDescription insertNewObjectForEntityForName:@"ReviewAssessmentSave" inManagedObjectContext:self.managedObjectContext];
        [insertObject setValue:entryNo forKey:@"entry_number"];
        [insertObject setValue:self.reviewassesscategoryid[i] forKey:@"category_id"];
        [insertObject setValue:self.reviewassesscategory_name[i] forKey:@"category_name"];
        [insertObject setValue:self.reviewassessselected_value[i] forKey:@"selected_value"];
        [insertObject setValue:self.reviewassessOthervalues[i] forKey:@"other_value"];
        [insertObject setValue:self.reviewassessScorevalues[i] forKey:@"score"];
        
        [self saveContext];
        
    }
    
    [self fetchReviewassessSaved];
    
}

-(NSArray *)setReviewassessFields:(NSString *)entryNo {
    NSMutableArray *reviewArr=[[NSMutableArray alloc]init];
    //NSMutableArray *eduotherArr=[[NSMutableArray alloc]init];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"ReviewAssessmentSave" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K like %@", @"entry_number",entryNo];
    [fetchRequest setPredicate:predicate];
    
    
//    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"category_id"
//                                                                   ascending:YES];
//    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
//    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"There was an error in fetching");
    }else{
        
        for (ReviewAssessmentSave *theReview in fetchedObjects) {
            [reviewArr addObject:theReview.selected_value];
            [reviewArr addObject:theReview.other_value];
            [reviewArr addObject:theReview.score];
        }
//        for (ReviewAssessmentSave *theReview in fetchedObjects) {
//            
//        }
//        for (ReviewAssessmentSave *theReview in fetchedObjects) {
//            
//        }
    }
    NSLog(@"%@",reviewArr);
    return reviewArr;
}
-( void)fetchReviewassessSaved{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"ReviewAssessmentSave" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"category_id"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"There was an error in fetching");
    }else{
        
        for (ReviewAssessmentSave *theReview in fetchedObjects) {
            
            NSLog(@"category ID: %@ Name: %@ entry_no:%@ selected_value:%@ other:%@",theReview.category_id,theReview.category_name,theReview.entry_number,theReview.selected_value,theReview.other_value);
        }
    }
}


-(void)saveEducation:(NSString *)entryNo{
    
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"EducationSave" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K like %@", @"entry_number",entryNo];
    [fetchRequest setPredicate:predicate];
    
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"category_id"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSManagedObject *matches = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"There was an error in fetching");
    }else{
        
        for (EducationSave *theEdu in fetchedObjects) {
            matches = theEdu;
            [self.managedObjectContext deleteObject:matches];
            [self saveContext];
        }
    }
    for (int i=0;i<self.educationcategoryid.count;i++) {
        NSManagedObject *insertObject = [NSEntityDescription insertNewObjectForEntityForName:@"EducationSave" inManagedObjectContext:self.managedObjectContext];
        [insertObject setValue:entryNo forKey:@"entry_number"];
        [insertObject setValue:self.educationcategoryid[i] forKey:@"category_id"];
        [insertObject setValue:self.educationcategory_name[i] forKey:@"category_name"];
        [insertObject setValue:self.educationselected_value[i] forKey:@"selected_value"];
        [insertObject setValue:self.educationOthervalues[i] forKey:@"other_value"];
        [self saveContext];
        
    }
    
    [self fetchEducationSaved];
    
}

-(NSArray *)setEducationFields:(NSString *)entryNo {
    NSMutableArray *eduArr=[[NSMutableArray alloc]init];
    //NSMutableArray *eduotherArr=[[NSMutableArray alloc]init];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"EducationSave" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K like %@", @"entry_number",entryNo];
    [fetchRequest setPredicate:predicate];
    
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"category_id"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"There was an error in fetching");
    }else{
        
        for (EducationSave *theEdu in fetchedObjects) {
            [eduArr addObject:theEdu.selected_value];
        }
        for (EducationSave *theEdu in fetchedObjects) {
            [eduArr addObject:theEdu.other_value];
        }
        
    }
    NSLog(@"%@",eduArr);
    return eduArr;
}
-( void)fetchEducationSaved{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"EducationSave" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"category_id"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"There was an error in fetching");
    }else{
        
        for (EducationSave *theEdu in fetchedObjects) {
            
            NSLog(@"category ID: %@ Name: %@ entry_no:%@ selected_value:%@ other:%@",theEdu.category_id,theEdu.category_name,theEdu.entry_number,theEdu.selected_value,theEdu.other_value);
        }
    }
}


-(void)saveTreatment:(NSString *)entryNo {
    
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"TreatmentSave" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K like %@", @"entry_number",entryNo];
    [fetchRequest setPredicate:predicate];
    
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"category_id"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSManagedObject *matches = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"There was an error in fetching");
    }else{
        
        for (TreatmentSave *thetreatment in fetchedObjects) {
            matches =thetreatment;
            [self.managedObjectContext deleteObject:matches];
            [self saveContext];
        }
    }
    for (int i=0;i<self.treatmentcategoryid.count;i++) {
        NSManagedObject *insertObject = [NSEntityDescription insertNewObjectForEntityForName:@"TreatmentSave" inManagedObjectContext:self.managedObjectContext];
        [insertObject setValue:entryNo forKey:@"entry_number"];
        [insertObject setValue:self.treatmentcategoryid[i] forKey:@"category_id"];
        [insertObject setValue:self.treatmentcategory_name[i] forKey:@"category_name"];
        [insertObject setValue:self.treatmentselected_value[i] forKey:@"selected_value"];
        [insertObject setValue:self.treatmentOthervalues[i] forKey:@"other_value"];
        [self saveContext];
        
    }
    
    [self fetchEducationSaved];
    
}

-(NSArray *)setTreatmentFields:(NSString *)entryNo {
    NSMutableArray *eduArr=[[NSMutableArray alloc]init];
    //NSMutableArray *eduotherArr=[[NSMutableArray alloc]init];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"TreatmentSave" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K like %@", @"entry_number",entryNo];
    [fetchRequest setPredicate:predicate];
    
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"category_id"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"There was an error in fetching");
    }else{
        
        for (TreatmentSave *treatment in fetchedObjects) {
            [eduArr addObject:treatment.selected_value];
        }
        for (TreatmentSave *treatment in fetchedObjects) {
            [eduArr addObject:treatment.other_value];
        }
        
    }
    NSLog(@"%@",eduArr);
    return eduArr;
}
-( void)fetchTreatmentSaved{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"TreatmentSave" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"category_id"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"There was an error in fetching");
    }else{
        
        for (TreatmentSave *theTreatment in fetchedObjects) {
            
            NSLog(@"category ID: %@ Name: %@ entry_no:%@ selected_value:%@ other:%@",theTreatment.category_id,theTreatment.category_name,theTreatment.entry_number,theTreatment.selected_value,theTreatment.other_value);
        }
    }
}

-(void)saveRecommendation:(NSString *)entryNo {
    
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"RecommendationsSave" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K like %@", @"entry_number",entryNo];
    [fetchRequest setPredicate:predicate];
    
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"category_id"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSManagedObject *matches = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"There was an error in fetching");
    }else{
        
        for (RecommendationsSave *theRecommend in fetchedObjects) {
            matches =theRecommend;
            [self.managedObjectContext deleteObject:matches];
            [self saveContext];
        }
    }
    for (int i=0;i<self.recommendationcategoryid.count;i++) {
        NSManagedObject *insertObject = [NSEntityDescription insertNewObjectForEntityForName:@"RecommendationsSave" inManagedObjectContext:self.managedObjectContext];
               [insertObject setValue:entryNo forKey:@"entry_number"];
        [insertObject setValue:self.recommendationcategoryid[i] forKey:@"category_id"];
        
        [insertObject setValue:self.recommendationcategory_name[i] forKey:@"category_name"];
        
        
        [insertObject setValue:self.recommendationselected_value[i] forKey:@"selected_value"];
        
        [insertObject setValue:self.recommendationOthervalues[i] forKey:@"other_value"];
        [self saveContext];
        
    }
    
    [self fetchRecommendationsSaved];
    
}

-(NSArray *)setRecommendationFields:(NSString *)entryNo{
    NSMutableArray *recommendarr=[[NSMutableArray alloc]init];
    //NSMutableArray *eduotherArr=[[NSMutableArray alloc]init];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"RecommendationsSave" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K like %@", @"entry_number",entryNo];
    [fetchRequest setPredicate:predicate];
    
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"category_id"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"There was an error in fetching");
    }else{
        
        for (RecommendationsSave *recommend in fetchedObjects) {
            [recommendarr addObject:recommend.selected_value];
        }
        for (RecommendationsSave *recommend in fetchedObjects) {
            [recommendarr addObject:recommend.other_value];
        }
        
    }
    NSLog(@"%@",recommendarr);
    return recommendarr;
}
-( void)fetchRecommendationsSaved{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"RecommendationsSave" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"category_id"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"There was an error in fetching");
    }else{
        
        for (RecommendationsSave *theRecommend in fetchedObjects) {
            
            NSLog(@"category ID: %@ Name: %@ entry_no:%@ selected_value:%@ other:%@",theRecommend.category_id,theRecommend.category_name,theRecommend.entry_number,theRecommend.selected_value,theRecommend.other_value);
        }
    }
}



-(void)saveOstomy:(NSString *)entryNo{
    
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"OstomySave" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K like %@", @"entry_number",entryNo];
    [fetchRequest setPredicate:predicate];
    
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"category_id"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSManagedObject *matches = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"There was an error in fetching");
    }else{
        
        for (OstomySave *theOstomySave in fetchedObjects) {
            matches = theOstomySave;
            [self.managedObjectContext deleteObject:matches];
            [self saveContext];
        }
    }
    for (int i=0;i<self.ostomycategoryid.count;i++) {
        NSManagedObject *insertObject = [NSEntityDescription insertNewObjectForEntityForName:@"OstomySave" inManagedObjectContext:self.managedObjectContext];
        [insertObject setValue:entryNo forKey:@"entry_number"];
        [insertObject setValue:self.ostomycategoryid[i] forKey:@"category_id"];
        [insertObject setValue:self.ostomycategory_name[i] forKey:@"category_name"];
        [insertObject setValue:self.ostomyselected_value[i] forKey:@"selected_value"];
        [insertObject setValue:self.ostomyOthervalues[i] forKey:@"other_value"];
        [self saveContext];
        
    }
    
    [self fetchOstomySaved];
    
}

-(NSArray *)setOstomyFields:(NSString *)entryNo {
    NSMutableArray *ostomyArr=[[NSMutableArray alloc]init];
    //NSMutableArray *eduotherArr=[[NSMutableArray alloc]init];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"OstomySave" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K like %@", @"entry_number",entryNo];
    [fetchRequest setPredicate:predicate];
    
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"category_id"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"There was an error in fetching");
    }else{
        
        for (OstomySave *theOstomySave in fetchedObjects) {
            [ostomyArr addObject:theOstomySave.selected_value];
        }
        for (OstomySave *theOstomySave in fetchedObjects) {
            [ostomyArr addObject:theOstomySave.other_value];
        }
        
    }
    NSLog(@"%@",ostomyArr);
    return ostomyArr;
}
-( void)fetchOstomySaved{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"OstomySave" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"category_id"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"There was an error in fetching");
    }else{
        
        for (OstomySave *theOstomySave in fetchedObjects) {
            
            NSLog(@"category ID: %@ Name: %@ entry_no:%@ selected_value:%@ other:%@",theOstomySave.category_id,theOstomySave.category_name,theOstomySave.entry_number,theOstomySave.selected_value,theOstomySave.other_value);
        }
    }
}



- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}


/*+(NSManagedObjectContext *)managedObject
 {
 AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
 return appDelegate.managedObjectContext;
 
 }*/

//Image Capture
-(void)saveImages{
    NSArray *imageKeys = [self.imageArr allKeys];
    NSArray *imageTextKeys = [self.imageText allKeys];
    NSArray *imageWoundKeys = [self.woundName allKeys];
    NSString *currentTextKey;
    NSString *currentWoundName;
    imageKeys = [imageKeys sortedArrayUsingDescriptors:
                 @[[NSSortDescriptor sortDescriptorWithKey:@"doubleValue"
                                                 ascending:YES]]];
    
    imageTextKeys = [imageTextKeys sortedArrayUsingDescriptors:
                     @[[NSSortDescriptor sortDescriptorWithKey:@"doubleValue"
                                                     ascending:YES]]];
    
    imageWoundKeys = [imageWoundKeys sortedArrayUsingDescriptors:
                      @[[NSSortDescriptor sortDescriptorWithKey:@"doubleValue"
                                                      ascending:YES]]];
    [self deleteImages];
    for(int i=0;i<[imageKeys count];i++){
        switch ([imageKeys[i] intValue]) {
            case 1:
                currentTextKey = @"15";
                currentWoundName = @"8";
                break;
            case 2:
                currentTextKey = @"16";
                currentWoundName = @"9";
                break;
            case 3:
                currentTextKey = @"17";
                currentWoundName = @"10";
                break;
            case 4:
                currentTextKey = @"18";
                currentWoundName = @"11";
                break;
            case 5:
                currentTextKey = @"19";
                currentWoundName = @"12";
                break;
            case 6:
                currentTextKey = @"20";
                currentWoundName = @"13";
                break;
            case 7:
                currentTextKey = @"21";
                currentWoundName = @"14";
                break;
            default:
                break;
        }
        NSLog(@"saving image id %@",imageKeys[i]);
        NSManagedObject *insertObject = [NSEntityDescription insertNewObjectForEntityForName:@"Wound" inManagedObjectContext:self.managedObjectContext];
        UIImage *img  = [self.imageArr valueForKey:imageKeys[i]];
        NSData *imageData = UIImagePNGRepresentation(img);
        [insertObject setValue:imageData forKey:@"wound_image"];
        if(currentWoundName){
            
            [insertObject setValue:[self.woundName valueForKey:currentWoundName] forKey:@"wound_name"];
        }
        else{
            [insertObject setValue:@"" forKey:@"wound_name"];
        }
        [insertObject setValue:imageKeys[i] forKey:@"wound_id"];
        if(currentTextKey)
        {
            [insertObject setValue:[self.imageText valueForKey:currentTextKey] forKey:@"wound_text"];
            
        }
        else{
            [insertObject setValue:@"" forKey:@"wound_text"];
        }
        [insertObject setValue:[[patientsDetails valueForKey:@"entry_number"]objectAtIndex:selectedPatientIndex] forKey:@"entry_number"];
        NSError *error;
        if (![self.managedObjectContext save:&error]) {
            NSLog(@"Error in saving new Patient : %@",[error localizedDescription]);
        }
    }
}

-(void)deleteImages{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Wound" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K like %@", @"entry_number",entry_no];
    [fetchRequest setPredicate:predicate];
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil || [fetchedObjects count]==0) {
        // NSLog(@"There was an error in fetching");
    }
    else{
        NSLog(@"deleting iamge id %@",entry_no);
        for(int i=0;i<[fetchedObjects count];i++){
            NSManagedObject *managedObject = fetchedObjects[i];
            [self.managedObjectContext deleteObject:managedObject];
        }
    }
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Error in saving new Patient : %@",[error localizedDescription]);
    }
}

-(void)fetchImages{
    Wound *theWound;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Wound" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Specify criteria for filtering which objects to fetch
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K like %@", @"entry_number",[[patientsDetails valueForKey:@"entry_number"]objectAtIndex:selectedPatientIndex]];
    [fetchRequest setPredicate:predicate];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil || [fetchedObjects count]==0) {
        // NSLog(@"There was an error in fetching");
    }else{
        theWound = (Wound*)fetchedObjects;
        for (Wound *wounds in fetchedObjects) {
            int id = [wounds.wound_id intValue];
            UIImage *image = [UIImage imageWithData:wounds.wound_image];
            NSLog(@"setting image id %d",id);
            switch (id) {
                    
                case 1:
                {
                    [self.imageArr setValue:image forKey:@"1"];
                    [self.imageText setValue:wounds.wound_text forKey:@"15"];
                    [self.woundName setValue:wounds.wound_name forKey:@"8"];
                    break;
                }
                case 2:
                    [self.imageArr setValue:image forKey:@"2"];
                    [self.imageText setValue:wounds.wound_text forKey:@"16"];
                    [self.woundName setValue:wounds.wound_name forKey:@"9"];
                    break;
                case 3:
                    [self.imageArr setValue:image forKey:@"3"];
                    [self.imageText setValue:wounds.wound_text forKey:@"17"];
                    [self.woundName setValue:wounds.wound_name forKey:@"10"];
                    break;
                case 4:
                    [self.imageArr setValue:image forKey:@"4"];
                    [self.imageText setValue:wounds.wound_text forKey:@"18"];
                    [self.woundName setValue:wounds.wound_name forKey:@"11"];
                    break;
                case 5:
                    [self.imageArr setValue:image forKey:@"5"];
                    [self.imageText setValue:wounds.wound_text forKey:@"19"];
                    [self.woundName setValue:wounds.wound_name forKey:@"12"];
                    break;
                case 6:
                    [self.imageArr setValue:image forKey:@"6"];
                    [self.imageText setValue:wounds.wound_text forKey:@"20"];
                    [self.woundName setValue:wounds.wound_name forKey:@"13"];
                    break;
                case 7:
                    [self.imageArr setValue:image forKey:@"7"];
                    [self.imageText setValue:wounds.wound_text forKey:@"21"];
                    [self.woundName setValue:wounds.wound_name forKey:@"14"];
                    break;
                default:
                    break;
            }
        }
    }
}

-(void)deleteWoundCoordinates:(NSString *)woundnum{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"WoundSelection" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K like %@ AND %K like %@", @"entry_number",entry_no,@"wound_number",woundnum];
    [fetchRequest setPredicate:predicate];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"wound_number"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects != nil && [fetchedObjects count]>0) {
        
        NSLog(@"deleting wound coordinates ");
        NSManagedObject *managedObject = fetchedObjects[0];
        [self.managedObjectContext deleteObject:managedObject];
        
    }
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Error in deleting wound coor : %@",[error localizedDescription]);
    }
    
}
-(void)saveWoundCoordinates{
    
    for(int i=0;i<[self.woundCoordinates count];i++){
        NSLog(@"saving wound coor id %@",entry_no);
        [self deleteWoundCoordinates:[self.woundNumber objectAtIndex:i]];
        NSManagedObject *insertObject = [NSEntityDescription insertNewObjectForEntityForName:@"WoundSelection" inManagedObjectContext:self.managedObjectContext];
        [insertObject setValue:entry_no forKey:@"entry_number"];
        [insertObject setValue:[self.woundCoordinates objectAtIndex:i] forKey:@"wound_coordinates"];
        [insertObject setValue:[self.woundImageName objectAtIndex:i] forKey:@"wound_type"];
        [insertObject setValue:[self.woundNumber objectAtIndex:i] forKey:@"wound_number"];
        NSError *error;
        if (![self.managedObjectContext save:&error]) {
            NSLog(@"Error in saving wound coordinates : %@",[error localizedDescription]);
        }
    }
}
-(void)fetchWoundCoordinates{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"WoundSelection" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K like %@", @"entry_number",entry_no];
    [fetchRequest setPredicate:predicate];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"wound_number"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects != nil && [fetchedObjects count]>0) {
        for (WoundSelection *wounds in fetchedObjects) {
            [self.woundCoordinates addObject:wounds.wound_coordinates];
            [self.woundImageName addObject:wounds.wound_type];
            [self.woundNumber addObject:wounds.wound_number];
        }
    }
}


-(void)saveGastrostomy:(NSString *)entryNo andCategoryid:(NSArray *)category_id andCategoryname:(NSArray *)Category_name andSelectedvalue:(NSArray *)Selected_value andOther:(NSArray *)other{
    
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"GastrostomySave" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K like %@", @"entry_number",entryNo];
    [fetchRequest setPredicate:predicate];
    
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"category_id"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSManagedObject *matches = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"There was an error in fetching");
    }else{
        
        for (GastrostomySave *theGas in fetchedObjects) {
            matches = theGas;
            [self.managedObjectContext deleteObject:matches];
            [self saveContext];
        }
    }
    for (int i=0;i<category_id.count;i++) {
        NSManagedObject *insertObject = [NSEntityDescription insertNewObjectForEntityForName:@"GastrostomySave" inManagedObjectContext:self.managedObjectContext];
        [insertObject setValue:entryNo forKey:@"entry_number"];
        [insertObject setValue:category_id[i] forKey:@"category_id"];
        [insertObject setValue:Category_name[i] forKey:@"category_name"];
        [insertObject setValue:Selected_value[i] forKey:@"selected_value"];
        [insertObject setValue:other[i] forKey:@"other_value"];
        [self saveContext];
        
    }
    
    [self fetchGastrostomySaved];
    
}
    
-( void)fetchGastrostomySaved{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"GastrostomySave" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"category_id"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"There was an error in fetching");
    }else{
        
        for (GastrostomySave *theGas in fetchedObjects) {
            
            NSLog(@"category ID: %@ Name: %@ entry_no:%@ selected_value:%@ other:%@",theGas.category_id,theGas.category_name,theGas.entry_number,theGas.selected_value,theGas.other_value);
        }
    }
}


-(NSArray *)setGastroFields:(NSString *)entryNo {
    NSMutableArray *gastroArr=[[NSMutableArray alloc]init];
    //NSMutableArray *eduotherArr=[[NSMutableArray alloc]init];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"GastrostomySave" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K like %@", @"entry_number",entryNo];
    [fetchRequest setPredicate:predicate];
    
    
//    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"category_id"
//                                                                   ascending:YES];
//    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"There was an error in fetching");
    }else{
        
        for (GastrostomySave *theGastro in fetchedObjects) {
            [gastroArr addObject:theGastro.selected_value];
        }
        for (GastrostomySave *theGastro in fetchedObjects) {
            [gastroArr addObject:theGastro.other_value];
        }
        
    }
   // NSLog(@"%@",eduArr);
    return gastroArr;
}


@end
