//
//  Type.m
//  JackOfTrades
//
//  Created by Admin on 7/7/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//
#import <Parse/PFObject+Subclass.h>
#import "User.h"

@implementation User

@dynamic firstName;
@dynamic lastName;
@dynamic license;
@dynamic position;
@dynamic courses;


+ (NSString *)firstNameKey {
    return @"firstName";
}

+ (NSString *)lastNameKey {
    return @"lastName";
}

+ (NSString *)licenseKey {
    return @"license";
}

+ (NSString *)positionKey {
    return @"position";
}

+ (NSString *)coursesKey {
    return @"courses";
}


@end
