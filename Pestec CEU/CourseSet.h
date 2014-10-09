//
//  CourseSet.h
//  PestecCEU
//
//  Created by Admin on 9/3/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import <Parse/Parse.h>

@interface CourseSet : PFObject <PFSubclassing>


@property (retain) NSString *categoryType;
@property (retain) NSString *workerType;
@property (retain) NSNumber *order;
@property (retain) NSArray *courses;


+ (NSString *)parseClassName;

+ (NSString *)categoryTypeKey;
+ (NSString *)workerTypeKey;
+ (NSString *)orderKey;
+ (NSString *)coursesKey;

@end
