//
//  UserCourseSet.m
//  PestecCEU
//
//  Created by Admin on 9/4/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import "UserCourseSet.h"

@implementation UserCourseSet

@dynamic categoryType;
@dynamic workerType;
@dynamic user;
@dynamic userCourses;

+ (NSString *)parseClassName {
    return @"UserCourseSet";
}

+ (NSString *)userKey {
    return @"user";
}

+ (NSString *)workerTypeKey {
    return @"workerType";
}

+ (NSString *)categoryTypeKey {
    return @"categoryType";
}

+ (NSString *)userCoursesKey {
    return @"userCourses";
}



@end
