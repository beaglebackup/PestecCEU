//
//  UserCourseSet.h
//  PestecCEU
//
//  Created by Admin on 9/4/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import <Parse/Parse.h>

@interface UserCourseSet : PFObject <PFSubclassing>


@property (retain) User *user;
@property (retain) NSArray *userCourses;
@property (retain) NSString *categoryType;
@property (retain) NSString *workerType;


+ (NSString *)parseClassName;

+ (NSString *)userKey;
+ (NSString *)workerTypeKey;
+ (NSString *)categoryTypeKey;
+ (NSString *)userCoursesKey;

@end

