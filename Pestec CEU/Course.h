//
//  Topic.h
//  PestecCEU
//
//  Created by Admin on 8/28/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import <Parse/Parse.h>

@interface Course : PFObject <PFSubclassing>

@property (retain) NSString *workerType;
@property (retain) NSString *categoryType;
@property (retain) NSString *name;
@property (retain) NSNumber *tag;
@property (retain) NSArray* quizQuestions;
@property (retain) NSNumber* numPassed;

+ (NSString *)parseClassName;

+ (NSString *)workerTypeKey;
+ (NSString *)categoryTypeKey;
+ (NSString *)nameKey;
+ (NSString *)tagKey;
+ (NSString *)quizQuestionsKey;
+ (NSString *)numPassedKey;

@end
