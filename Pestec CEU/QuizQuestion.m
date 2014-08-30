//
//  QuizQuestion.m
//  PestecCEU
//
//  Created by Admin on 8/30/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import "QuizQuestion.h"

@implementation QuizQuestion

@dynamic text;
@dynamic type;
@dynamic answerObjects;
@dynamic order;



+ (NSString *)parseClassName {
    return @"QuizQuestion";
}

+ (NSString *)textKey {
    return @"text";
}

+ (NSString *)typeKey {
    return @"text";
}

+ (NSString *)answerObjectsKey {
    return @"answerObjects";
}

+ (NSString *)orderKey {
    return @"order";
}


@end
