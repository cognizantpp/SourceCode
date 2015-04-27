//
//  WoundReason.h
//  WoundCare
//
//  Created by keerthana on 23/04/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface WoundReason : NSManagedObject

@property (nonatomic, retain) NSString * category_fields;
@property (nonatomic, retain) NSString * category_id;
@property (nonatomic, retain) NSString * category_name;

@end
