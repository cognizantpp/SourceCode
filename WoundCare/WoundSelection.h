//
//  WoundSelection.h
//  WoundCare
//
//  Created by Sangeetha on 20/04/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface WoundSelection : NSManagedObject

@property (nonatomic, retain) NSString * entry_number;
@property (nonatomic, retain) NSString * wound_coordinates;
@property (nonatomic, retain) NSString * wound_number;
@property (nonatomic, retain) NSString * wound_type;

@end
