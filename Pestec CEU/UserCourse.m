//
//  UserCourse.m
//  PestecCEU
//
//  Created by Admin on 8/28/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import "UserCourse.h"

@implementation UserCourse

@dynamic user;
@dynamic course;
@dynamic timePassed;

+ (NSString *)parseClassName {
    return @"UserCourse";
}

+ (NSString *)userKey {
    return @"user";
}

+ (NSString *)courseKey {
    return @"course";
}



@end
