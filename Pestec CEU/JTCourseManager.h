//
//  JTTimerManager.h
//  PestecCEU
//
//  Created by Admin on 8/28/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MZTimerLabel.h"
#import "UserCourse.h"

@protocol JTCourseManagerDelegate;


@interface JTCourseManager : NSObject

+ (JTCourseManager *)shared;

@property (nonatomic, strong) UserCourse* userCourse;
@property (nonatomic, strong) MZTimerLabel* courseTimer;

- (void) setupTimer;

- (void) pauseTimerAndUpdate;

- (void) stopTimerAndSetComplete;

- (void) startTimer;

- (void) setNewUserCourse:(UserCourse*)userCourse;

- (BOOL) isCourseRead;


/*! @name Delegate */
@property (nonatomic, strong) id<JTCourseManagerDelegate> delegate;


@end

@protocol JTCourseManagerDelegate <NSObject>
@required

//- (void) userDidSetup;

@end