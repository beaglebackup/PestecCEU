//
//  JTTimerManager.m
//  PestecCEU
//
//  Created by Admin on 8/28/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import "JTCourseManager.h"
#import "NSNumber+NSTimeInterval.h"



@interface JTCourseManager ()


@end

@implementation JTCourseManager

static JTCourseManager *instance = nil;

+ (JTCourseManager *)shared {
    
	@synchronized (self) {
		if (instance == nil){
            instance = [[self alloc] init];
    
        }
	}
	
	return instance;
}

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)pauseTimerAndUpdate {

    // Pause timer
    [self.courseTimer pause];
    
    // Get time and save
    NSTimeInterval timeIntervalPassed = [[[JTCourseManager shared] courseTimer] getTimeCounted];
    
    // Fixes but in MZTimerLabel - it keeps going even after pause
    if (timeIntervalPassed > courseLength) {
        timeIntervalPassed = courseLength;
    }
    
    NSNumber* timePassed = [NSNumber numberWithNSTimeInterval:timeIntervalPassed];

    self.userCourse.timePassed = timePassed;

    
    JTDatabaseManager* databaseManager = [[JTDatabaseManager alloc] init];
    [databaseManager update:self.userCourse withCallback:^(BOOL succeeded, NSError *error) {
        
        if (error) {
            NSLog(@"error = %@",error);
            return;
        }
    }];

}

- (void) setupTimer {
    
    NSTimeInterval timeInterval = [self.userCourse.timePassed NSTimeIntervalValue];
    
    [self.courseTimer setStopWatchTime:timeInterval];
    
    [self startTimer];

}

- (void) startTimer {
    
    NSTimeInterval passedTime = [self.courseTimer getTimeCounted];
    
    if (passedTime != passedTime) { // Check for nan
        passedTime = 0;
    }
    
    NSLog(@"passedTime = %f",passedTime);
    NSLog(@"courseLength = %d",courseLength);

    
    // Start timer only if less than courseLenght
    if (passedTime < courseLength) {
        [self.courseTimer start];
    }
}

- (void) stopTimerAndSetComplete {
    
    [self.courseTimer pause];
    
    NSLog(@"[self.courseTimer getTimeCounted] = %f",[self.courseTimer getTimeCounted]);
    
    self.userCourse.status = [NSNumber numberWithInt:JTCourseStatusRead];
    self.userCourse.timePassed = [NSNumber numberWithNSTimeInterval:courseLength];
    
    
    JTDatabaseManager* databaseManager = [[JTDatabaseManager alloc] init];
    [databaseManager update:self.userCourse withCallback:^(BOOL succeeded, NSError *error) {
        
        if (error) {
            NSLog(@"error = %@",error);
            return;
        }
    }];
    
}

- (void)setNewUserCourse:(UserCourse*)userCourse {
    
    // Reset timer
    [self.courseTimer reset];
    
    // Save userCourse
    [self setUserCourse:userCourse];
}

- (BOOL)isCourseRead {
        
    
    if ([self.userCourse.status integerValue] >= JTCourseStatusRead) {
        return YES;
        
    }
    
    return NO;
}




@end
