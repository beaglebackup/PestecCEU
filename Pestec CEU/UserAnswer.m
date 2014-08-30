//
//  QuizAnswer.m
//  PestecCEU
//
//  Created by Admin on 8/30/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import "UserAnswer.h"

@implementation UserAnswer

@dynamic text;
@dynamic isCorrect;
@dynamic user;

+ (NSString *)parseClassName {
    return @"UserAnswer";
}

+ (NSString *)textKey {
    return @"text";
}

+ (NSString *)isCorrectKey {
    return @"isCorrect";
}

+ (NSString *)userKey {
    return @"user";
}


@end
