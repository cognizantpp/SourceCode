//
//  CoreDataHelper.m
//  SampleDB
//
//  Created by Sangeetha on 16/03/15.
//  Copyright (c) 2015 Sangeetha. All rights reserved.
//

#import "CoreDataHelper.h"
#import "Login.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>
#import "AssignmentsViewController.h"

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
            NSLog(@"user %@",theUser.userName);
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

-(BOOL)validateEntryNumber:(NSString *)entryNo{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"PatientDetails" inManagedObjectContext:self.managedObjectContext];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K like %@",@"entry_number",entryNo];
    [fetchRequest setEntity:entity];
    [fetchRequest setPredicate:predicate];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]initWithKey:@"entry_number" ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        return YES;
    }
    else{
        return NO;
    }
    
}

-(void)insertNewPatients:(NSDictionary*)newPatient{
    CoreDataHelper *coreDataHelper = [CoreDataHelper sharedInstance];
    NSManagedObject *insertObject = [NSEntityDescription insertNewObjectForEntityForName:@"PatientDetails" inManagedObjectContext:self.managedObjectContext];
    [insertObject setValue:[newPatient valueForKey:@"entry_number"] forKey:@"entry_number"];
    [insertObject setValue:[newPatient valueForKey:@"patient_name"] forKey:@"patient_name"];
    [insertObject setValue:[newPatient valueForKey:@"consult_type"] forKey:@"consult_type"];
    [insertObject setValue:[newPatient valueForKey:@"room_number"] forKey:@"room_number"];
    [insertObject setValue:@"fresh" forKey:@"chart_status"];
    [insertObject setValue:[newPatient valueForKey:@"admit_dt"] forKey:@"admit_dt"];
    [insertObject setValue:[newPatient valueForKey:@"facility_name"] forKey:@"facility_name"];
    [insertObject setValue:@"user1" forKey:@"staff_userid"];//coreDataHelper.gblstaffId
    [insertObject setValue:@"Mintu" forKey:@"staff_name"];//coreDataHelper.gblstaffName
    
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Error in saving new Patient : %@",[error localizedDescription]);
    }
}


-(PatientDetails*) getAssignmentsList:(NSString *)staffId{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"PatientDetails" inManagedObjectContext:self.managedObjectContext];
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

/*+(NSManagedObjectContext *)managedObject
{
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    return appDelegate.managedObjectContext;
    
}*/
@end
