//
//  QuizQuestion.h
//  PestecCEU
//
//  Created by Admin on 8/30/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import <Parse/Parse.h>

@interface QuizQuestion : PFObject <PFSubclassing>

@property (retain) NSString *text;
@property (retain) NSString *type;
@property (retain) NSNumber *order;
@property (retain) NSArray *answerObjects;


+ (NSString *)parseClassName;

+ (NSString *)textKey;
+ (NSString *)typeKey;
+ (NSString *)answerObjectsKey;
+ (NSString *)orderKey;

@end
