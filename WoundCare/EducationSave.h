//
//  EducationSave.h
//  WoundCare
//
//  Created by Uthra on 07/04/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface EducationSave : NSManagedObject

@property (nonatomic, retain) NSString * category_id;
@property (nonatomic, retain) NSString * category_name;
@property (nonatomic, retain) NSString * entry_number;
@property (nonatomic, retain) NSString * other_value;
@property (nonatomic, retain) NSString * selected_value;

@end
