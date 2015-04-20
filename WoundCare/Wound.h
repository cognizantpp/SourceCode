//
//  Wound.h
//  WoundCare
//
//  Created by Sangeetha on 20/04/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Wound : NSManagedObject

@property (nonatomic, retain) NSString * entry_number;
@property (nonatomic, retain) NSString * wound_id;
@property (nonatomic, retain) NSString * wound_name;
@property (nonatomic, retain) NSString * wound_text;
@property (nonatomic, retain) NSData * wound_image;

@end
