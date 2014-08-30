//
//  UserAnswer.m
//  PestecCEU
//
//  Created by Admin on 8/30/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import "QuizAnswer.h"

@implementation QuizAnswer

@dynamic text;
@dynamic isAnswer;

+ (NSString *)parseClassName {
    return @"QuizAnswer";
}

+ (NSString *)textKey {
    return @"text";
}

+ (NSString *)isAnswerKey {
    return @"isAnswer";
}

@end
