//
//  ReviewAssessmentSave.h
//  WoundCare
//
//  Created by Uthra on 22/04/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ReviewAssessmentSave : NSManagedObject

@property (nonatomic, retain) NSString * category_id;
@property (nonatomic, retain) NSString * category_name;
@property (nonatomic, retain) NSString * entry_number;
@property (nonatomic, retain) NSString * other_value;
@property (nonatomic, retain) NSString * score;
@property (nonatomic, retain) NSString * selected_value;

@end
