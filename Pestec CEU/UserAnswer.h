//
//  QuizAnswer.h
//  PestecCEU
//
//  Created by Admin on 8/30/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import <Parse/Parse.h>
#import "User.h"

@interface UserAnswer : PFObject <PFSubclassing>

@property (retain) NSString *text;
@property (assign) BOOL isCorrect;
@property (retain) User *user;

+ (NSString *)parseClassName;

+ (NSString *)textKey;
+ (NSString *)isCorrectKey;
+ (NSString *)userKey;


@end
