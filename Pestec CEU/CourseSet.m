//
//  CourseSet.m
//  PestecCEU
//
//  Created by Admin on 9/3/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import "CourseSet.h"

@implementation CourseSet

@dynamic categoryType;
@dynamic workerType;
@dynamic order;
@dynamic courses;

+ (NSString *)parseClassName {
    return @"CourseSet";
}

+ (NSString *)categoryTypeKey {
    return @"categoryType";
}

+ (NSString *)workerTypeKey {
    return @"workerType";
}

+ (NSString *)orderKey {
    return @"order";
}

+ (NSString *)coursesKey {
    return @"courses";
}



@end
