//
//  PFObject+Copy.m
//  PestecCEU
//
//  Created by Admin on 8/28/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import "PFObject+Copy.h"

@implementation PFObject (Copy)

- (PFObject *)copyShallow:(PFObject*)object newClass:(NSString*)newClass {
    PFObject *clone = [PFObject objectWithoutDataWithClassName:newClass
                                                      objectId:object.objectId];
    NSArray *keys = [object allKeys];
    for (NSString *key in keys) {
        [clone setObject:[object objectForKey:key] forKey:key];
    }
    return clone;
}

@end
