//
//  JTDatabaseManager.h
//  JackOfTrades
//
//  Created by Admin on 7/7/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserCourse.h"


@interface JTDatabaseManager : NSObject


#pragma mark - Reads
+ (void)queryForCourse:(NSNumber*)tag workerType:(NSString*)workerType withCallback:(void(^)(Course *course, NSError *error))callback;
+ (void)queryForUserCourse:(Course*)course user:(User*)user withCallback:(void(^)(UserCourse *course, NSError *error))callback;


#pragma mark - Creates
+ (void)createUserCourse:(Course*)course user:(User*)user withCallback:(void(^)(UserCourse *course, NSError *error))callback;


#pragma mark - Updates
+ (void)updateUserProfile:(PFUser*)user firstName:(NSString*)firstName lastName:(NSString*)lastName license:(NSString*)license position:(NSString*)position withCallback:(void(^)(BOOL succeeded, NSError *error))callback;
+ (void)updateUserCourse:(UserCourse*)userCourse withTime:(NSNumber*)time withCallback:(void(^)(BOOL succeeded, NSError *error))callback;


#pragma mark - Utility
+ (BOOL)user:(User*)user hasCourse:(Course*)course;


#pragma mark - Admin
+ (void)copyClass:(NSString*)originalClass toClass:(NSString*)newClass;

@end
