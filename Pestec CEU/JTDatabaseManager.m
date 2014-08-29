//
//  JTDatabaseManager.m
//  JackOfTrades
//
//  Created by Admin on 7/7/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import "JTDatabaseManager.h"
#import "User.h"
#import "Course.h"

@interface JTDatabaseManager ()

@property (nonatomic, assign) UIBackgroundTaskIdentifier backgroundUpdateTask;

- (void) beginBackgroundUpdateTask;
- (void) endBackgroundUpdateTask;

@end


@implementation JTDatabaseManager

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

#pragma mark - Reads
+ (void)queryForCourses:(NSString*)workerType withCallback:(void(^)(NSArray* courses, NSError *error))callback {

    PFQuery* coursesQuery = [PFQuery queryWithClassName:[Course parseClassName]];
    [coursesQuery whereKey:[Course workerTypeKey] equalTo:workerType];
    
    [coursesQuery orderByAscending:[Course tagKey]];
    
    [coursesQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        callback(objects, error);
    }];
}


+ (void)queryForCourse:(NSNumber*)tag workerType:(NSString*)workerType withCallback:(void(^)(Course *course, NSError *error))callback {
    
    
    
    
    PFQuery* courseQuery = [PFQuery queryWithClassName:[Course parseClassName]];
    [courseQuery whereKey:[Course tagKey] equalTo:tag];
    [courseQuery whereKey:[Course workerTypeKey] equalTo:workerType];
    
    [courseQuery getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        
        callback((Course*)object, error);
        
    }];
}


+ (void)queryForUserCourse:(Course*)course user:(User*)user withCallback:(void(^)(UserCourse *course, NSError *error))callback {
 
    PFQuery* userCourseQuery = [PFQuery queryWithClassName:[UserCourse parseClassName]];
    [userCourseQuery whereKey:[UserCourse userKey] equalTo:user];
    [userCourseQuery whereKey:[UserCourse courseKey] equalTo:course];
    
    [userCourseQuery getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        callback((UserCourse*)object, error);
    }];
}

+ (void)queryForCompletedCourses:(User*)user withCallback:(void(^)(NSArray *completedCourses, NSError *error))callback {

    PFQuery* completedCourses = [PFQuery queryWithClassName:[UserCourse parseClassName]];
    [completedCourses whereKey:[UserCourse userKey] equalTo:user];
    [completedCourses whereKey:[UserCourse statusKey] equalTo:[NSNumber numberWithInt:JTCourseStatusCompleted]];
    
    [completedCourses includeKey:[UserCourse courseKey]];
    
    [completedCourses findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        callback(objects, error);
    }];

}


#pragma mark - Creates
+ (void)createUserCourse:(Course*)course user:(User*)user withCallback:(void(^)(UserCourse *course, NSError *error))callback {
    
    UserCourse* userCourse = [UserCourse object];
    userCourse.course = course;
    userCourse.user = user;
    userCourse.status = [NSNumber numberWithInt:JTCourseStatusStarted];
    userCourse.timePassed = [NSNumber numberWithFloat:0.0f];
    
    [userCourse saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        
        // Add the Course to the User
        NSMutableArray* coursesForUser = [user.courses mutableCopy];
        
        if (!coursesForUser) {
            coursesForUser = [NSMutableArray new];
        }
        
        [coursesForUser addObject:course];
        user.courses = coursesForUser;
        
        [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            callback(userCourse, error);
        }];
        
        
    }];
    
}

#pragma mark - Updates
+ (void)updateUserProfile:(User*)user firstName:(NSString*)firstName lastName:(NSString*)lastName license:(NSString*)license position:(NSString*)position withCallback:(void(^)(BOOL succeeded, NSError *error))callback {
    
    user.firstName = firstName;
    user.lastName = lastName;
    user.license = license;
    user.position = position;
    
//    [user setObject:firstName forKey:[User firstNameKey]];
//    [user setObject:lastName forKey:[User lastNameKey]];
//    [user setObject:license forKey:[User licenseKey]];
//    [user setObject:position forKey:[User positionKey]];
    
    [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        callback(succeeded,error);
    }];
}

//- (void)updateUserCourse:(UserCourse*)userCourse withTime:(NSNumber*)time withCallback:(void(^)(BOOL succeeded, NSError *error))callback {
//
//    // Do this in a background task to make sure it saves if called in applicationDidEnterBackground
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        
//        [self beginBackgroundUpdateTask];
//        
//        userCourse.timePassed = time;
//        
//        [userCourse saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//            callback(succeeded,error);
//            
//            [self endBackgroundUpdateTask];
//        }];
//    });
//}

- (void)update:(PFObject*)object withCallback:(void(^)(BOOL succeeded, NSError *error))callback {
    // Do this in a background task to make sure it saves if called in applicationDidEnterBackground
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        [self beginBackgroundUpdateTask];
        
        [object saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            callback(succeeded,error);
            
            [self endBackgroundUpdateTask];
        }];
    });

}

#pragma mark - Utility
+ (BOOL)user:(User*)user hasCourse:(Course*)course {
    
    __block BOOL hasCourse = NO;
    
    NSArray* courses = user.courses;
    
    [courses enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        Course* courseUser = (Course*)obj;
        
        if ([course.objectId isEqualToString:courseUser.objectId]) {
            hasCourse = YES;
            *stop = YES;
        }
    }];
  
    return hasCourse;
    
}

+ (NSString*)workerString:(JTWorkerTypeIndex)workerType {
    
    
    switch (workerType) {
        case JTWorkerTypeApplicator:
            return @"Applicator";
            break;
        case JTWorkerTypeFieldRep:
            return @"Field Rep";
            break;
        case JTWorkerTypeOperator:
            return @"Operator";
            break;
            
        default:
            return nil;
            break;
    }
    
}


#pragma mark - Background Tasks
- (void) beginBackgroundUpdateTask
{
    self.backgroundUpdateTask = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        [self endBackgroundUpdateTask];
    }];
}

- (void) endBackgroundUpdateTask
{
    [[UIApplication sharedApplication] endBackgroundTask: self.backgroundUpdateTask];
    self.backgroundUpdateTask = UIBackgroundTaskInvalid;
}


#pragma mark - Admin
+ (void)copyClass:(NSString*)originalClass toClass:(NSString*)newClass {
    
    PFQuery* classQuery = [PFQuery queryWithClassName:originalClass];
    [classQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        if (objects) {
            
            
            [objects enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                
                PFObject* object = (PFObject*)obj;
                PFObject *clone = [PFObject objectWithClassName:newClass];
                NSArray *keys = [object allKeys];
                for (NSString *key in keys) {
                    [clone setObject:[object objectForKey:key] forKey:key];
                }
                
                [clone saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                    
                    if (succeeded) {
                        
                    }
                    else {
                        
                    }
                    
                }];
            }];
        }
    }];
}





@end
