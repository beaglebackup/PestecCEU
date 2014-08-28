//
//  UserCourse.h
//  PestecCEU
//
//  Created by Admin on 8/28/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import <Parse/Parse.h>
#import "User.h"
#import "Course.h"

@interface UserCourse : PFObject <PFSubclassing>

@property (retain) User *user;
@property (retain) Course *course;
@property (retain) NSNumber *timePassed;

+ (NSString *)parseClassName;
+ (NSString *)userKey;
+ (NSString *)courseKey;

@end
