//
//  ApplicatorRulesCourseTopic1ViewController.m
//  Pestec CEU
//
//  Created by Gabriel on 7/6/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import "JTCourseViewController.h"
#import "MZTimerLabel.h"
#import "User.h"
#import "UserCourse.h"
#import "NSNumber+NSTimeInterval.h"

@interface JTCourseViewController ()

@property (nonatomic, strong) User* user;
@property (nonatomic, strong) UserCourse* userCourse;

@end

@implementation JTCourseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.user = (User*)[PFUser currentUser];
    
    NSLog(@"_workerType = %@",_workerType);
    NSLog(@"_tag = %@",_tag);
    
    
    [self loadObjects];

    // Do any additional setup after loading the view.
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    NSNumber* timePassed = [NSNumber numberWithNSTimeInterval:[self.courseTimer getTimeCounted]];
    
    NSLog(@"timePassed = %@",timePassed);
    
    [JTDatabaseManager updateUserCourse:self.userCourse withTime:timePassed withCallback:^(BOOL succeeded, NSError *error) {
        
        if (error) {
            NSLog(@"error = %@",error);
            return;
        }
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) loadObjects {
    
    // Get the course object
    [JTDatabaseManager queryForCourse:self.tag workerType:self.workerType withCallback:^(Course *course, NSError *error) {
        if (error) {
            NSLog(@"error = %@",error);
            return;
        }
        
        self.course = course;
        
        // Does the user have the course
        if ([JTDatabaseManager user:self.user hasCourse:self.course]) {
            
            // Get the UserCourse object
            [JTDatabaseManager queryForUserCourse:self.course user:self.user withCallback:^(UserCourse *course, NSError *error) {
                if (error) {
                    
                    NSLog(@"error = %@",error);
                    return;
                }
                
                self.userCourse = course;
                
                [self objectsDidLoad];
            }];
        }
        
        // ELSE create a new UserCourse
        else {
            [JTDatabaseManager createUserCourse:self.course user:self.user withCallback:^(UserCourse *course, NSError *error) {
                if (error) {
                    NSLog(@"error = %@",error);
                    return;
                }
                
                self.userCourse = course;
                
                [self objectsDidLoad];
            }];
        }
    }];
}

- (void) objectsDidLoad {
    
    NSTimeInterval timeInterval = [self.userCourse.timePassed NSTimeIntervalValue];
    
    NSLog(@"timeInterval = %f",timeInterval);
    
    [self.courseTimer setStopWatchTime:timeInterval];
    
    [self.courseTimer start];
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
