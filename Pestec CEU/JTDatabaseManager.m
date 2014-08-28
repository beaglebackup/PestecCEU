//
//  JTDatabaseManager.m
//  JackOfTrades
//
//  Created by Admin on 7/7/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import "JTDatabaseManager.h"
#import "User.h"

@implementation JTDatabaseManager

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

#pragma mark - Queries
//+ (void)queryForTypesWithCallback:(void(^)(NSArray *types, NSError *error))callback{
//    
//    PFQuery *typeQuery = [Type query];
//    
//    [typeQuery orderByAscending:[Type nameKey]];
//    [typeQuery includeKey:[Type subtypesKey]];
//
//    [typeQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//        if (objects) {
//            
//            NSLog(@"DB -- queryForTypesWithCallback -- self.object.count = %lu",(unsigned long)objects.count);
//
//            callback(objects,nil);
//        }
//        else {
//            
//            NSLog(@"DB -- queryForTypesWithCallback -- error = %@",error);
//
//            
//            callback(nil,error);
//        }
//    }];
//}
//
//+ (void)queryForSubtypes:(NSString*)type withCallback:(void(^)(NSArray *types, NSError *error))callback{
//    
//    PFQuery *subtypeQuery = [Subtype query];
//    
//    NSLog(@"queryForSubtypes -- type = %@",type);
//    
//    [subtypeQuery whereKey:[Subtype parentStringKey] equalTo:type];
//    
//    // Only include basic keys
//    NSArray* keys = [NSArray arrayWithObjects:[Subtype nameKey],
//                                             [Subtype parentStringKey],
//                                             nil];
//    [subtypeQuery selectKeys:keys];
//    
//    [subtypeQuery includeKey:[Subtype textPointerKey]];
//    
//    [subtypeQuery orderByAscending:[Subtype nameKey]];
//    
//    [subtypeQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//        if (objects) {
//            callback(objects,nil);
//        }
//    }];
//}
//
//
//+ (void)getAllKeysForSubtype:(Subtype*)subtype withCallback:(void(^)(Subtype* theSubtype, NSError *error))callback{
//    
//    // Requery without any key restraints (get all keys)
//    PFQuery *subtypeQuery = [Subtype query];
//    
//    [subtypeQuery includeKey:[Subtype textPointerKey]];
//    
//    [subtypeQuery getObjectInBackgroundWithId:[subtype objectId] block:^(PFObject *object, NSError *error) {
//        
//    
//        callback(object, error);
//    }];
//
//    
// 
//}


#pragma mark - Updates
+ (void)updateUserProfile:(PFUser*)user firstName:(NSString*)firstName lastName:(NSString*)lastName license:(NSString*)license position:(NSString*)position withCallback:(void(^)(BOOL succeeded, NSError *error))callback {
    
    [user setObject:firstName forKey:[User firstNameKey]];
    [user setObject:lastName forKey:[User lastNameKey]];
    [user setObject:license forKey:[User licenseKey]];
    [user setObject:position forKey:[User positionKey]];
    
    [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        callback(succeeded,error);
    }];

    
}


@end
