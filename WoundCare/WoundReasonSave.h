//
//  WoundReasonSave.h
//  WoundCare
//
//  Created by Sujitha on 30/04/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface WoundReasonSave : NSManagedObject

@property (nonatomic, retain) NSString * category_id;
@property (nonatomic, retain) NSString * category_name;
@property (nonatomic, retain) NSString * entry_number;
@property (nonatomic, retain) NSString * other_value;
@property (nonatomic, retain) NSString * selected_value;
@property (nonatomic, retain) NSString * wound_id;
@property (nonatomic, retain) NSString * wound_name;

@end
