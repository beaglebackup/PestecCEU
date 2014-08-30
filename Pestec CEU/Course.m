//
//  Topic.m
//  PestecCEU
//
//  Created by Admin on 8/28/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import "Course.h"

@implementation Course

@dynamic workerType;
@dynamic categoryType;
@dynamic name;
@dynamic tag;
@dynamic quizQuestions;

+ (NSString *)parseClassName {
    return @"Course";
}

+ (NSString *)workerTypeKey {
    return @"workerType";
}

+ (NSString *)categoryTypeKey {
    return @"categoryType";
}

+ (NSString *)nameKey {
    return @"name";
}

+ (NSString *)tagKey {
    return @"tag";
}

+ (NSString *)quizQuestionsKey {
    return @"quizQuestions";
}

@end
