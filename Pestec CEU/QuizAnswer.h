//
//  UserAnswer.h
//  PestecCEU
//
//  Created by Admin on 8/30/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import <Parse/Parse.h>

@interface QuizAnswer : PFObject <PFSubclassing>

@property (retain) NSString *text;
@property (assign) BOOL isAnswer;

+ (NSString *)parseClassName;

+ (NSString *)textKey;
+ (NSString *)isAnswerKey;

@end
