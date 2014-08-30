//
//  JTDatabaseManager.h
//  JackOfTrades
//
//  Created by Admin on 7/7/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserCourse.h"
#import "JTCEUConstants.h"

@interface JTDatabaseManager : NSObject


#pragma mark - Reads
+ (void)queryForCourses:(NSString*)workerType withCallback:(void(^)(NSArray* courses, NSError *error))callback;
+ (void)queryForCourse:(NSNumber*)tag workerType:(NSString*)workerType withCallback:(void(^)(Course *course, NSError *error))callback;
+ (void)queryForUserCourse:(Course*)course user:(User*)user withCallback:(void(^)(UserCourse *course, NSError *error))callback;
+ (void)queryForCompletedCourses:(User*)user withCallback:(void(^)(NSArray *completedCourses, NSError *error))callback;
+ (void)queryForQuizQuestions:(Course*)course withCallback:(void(^)(NSArray *quizQuestions, NSError *error))callback;

#pragma mark - Creates
+ (void)createUserCourse:(Course*)course user:(User*)user withCallback:(void(^)(UserCourse *course, NSError *error))callback;


#pragma mark - Updates
+ (void)updateUserProfile:(PFUser*)user firstName:(NSString*)firstName lastName:(NSString*)lastName license:(NSString*)license position:(NSString*)position withCallback:(void(^)(BOOL succeeded, NSError *error))callback;

- (void)update:(PFObject*)object withCallback:(void(^)(BOOL succeeded, NSError *error))callback;

#pragma mark - Utility
+ (BOOL)user:(User*)user hasCourse:(Course*)course;
+ (NSString*)workerString:(JTWorkerTypeIndex)workerType;

#pragma mark - Admin
+ (void)copyClass:(NSString*)originalClass toClass:(NSString*)newClass;

@end
