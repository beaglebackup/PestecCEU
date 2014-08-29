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

/**
 What stage the user is at in the course
 '1' -- Reading
 '2' -- Completed reading, taking quiz
 '3' -- Completed quiz
 @see JTCourseStatusIndex
 */
@property (retain) NSNumber *status;

+ (NSString *)parseClassName;
+ (NSString *)userKey;
+ (NSString *)courseKey;
+ (NSString *)statusKey;

@end
