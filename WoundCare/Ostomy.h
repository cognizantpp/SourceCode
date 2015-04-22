//
//  Ostomy.h
//  WoundCare
//
//  Created by keerthana on 21/04/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Ostomy : NSManagedObject

@property (nonatomic, retain) NSString * category_fields;
@property (nonatomic, retain) NSString * category_id;
@property (nonatomic, retain) NSString * category_name;

@end
