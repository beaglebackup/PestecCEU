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
#import "JGProgressHUD.h"
#import "JTCourseManager.h"
#import "NSNumber+NSTimeInterval.h"
#import "JTQuizViewController.h"

//#define courseLength 3600




@interface JTCourseViewController ()

@property (nonatomic, strong) JGProgressHUD* progressHUD;

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
    
//    NSLog(@"self.workerType = %u",self.workerType);
//    NSLog(@"self.tag = %@",self.tag);
    
    self.transparentBGView.backgroundColor = [UIColor colorWithWhite:1.0f alpha:0.8f];


    
    // Loading HUD
    [self.view bringSubviewToFront:self.loadingView];
    self.loadingView.hidden = NO;
    self.progressHUD = [JGProgressHUD progressHUDWithStyle:JGProgressHUDStyleLight];
    self.progressHUD.textLabel.text = @"Loading Course";
    [self.progressHUD showInView:self.view];

    
    // Setup JTCourseManager
    [[JTCourseManager shared] setCourseTimer:self.courseTimer];
    self.courseTimer.delegate = self;
    
  

    
    // Register for Notifications
    [self registerForNotifications];
}


- (void) viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    // Load Data
    [self loadObjects];
    
}
- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    [[JTCourseManager shared] pauseTimerAndUpdate];
    
//    NSNumber* timePassed = [NSNumber numberWithNSTimeInterval:[[[JTCourseManager shared] courseTimer] getTimeCounted]];
//    [JTDatabaseManager updateUserCourse:[[JTCourseManager shared] userCourse] withTime:timePassed withCallback:^(BOOL succeeded, NSError *error) {
//        
//        if (error) {
//            NSLog(@"error = %@",error);
//            return;
//        }
//    }];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Data
- (void) loadObjects {
    
    // Get the course object
//    NSString* workerString = [JTDatabaseManager workerString:self.workerType];
//    [JTDatabaseManager queryForCourse:self.tag workerType:workerString withCallback:^(Course *course, NSError *error) {
//        if (error) {
//            NSLog(@"error = %@",error);
//            return;
//        }
    
//        self.course = course;
    
        
        
        // Does the user have the course
        if ([JTDatabaseManager user:(User*)[PFUser currentUser] hasCourse:self.course]) {
            
            // Get the UserCourse object
            [JTDatabaseManager queryForUserCourse:self.course user:(User*)[PFUser currentUser] withCallback:^(UserCourse *course, NSError *error) {
                if (error) {
                    
                    NSLog(@"error = %@",error);
                    return;
                }
                
                [[JTCourseManager shared] setUserCourse:course];
                                
                [self objectsDidLoad];
            }];
        }
        
        // ELSE create a new UserCourse
        else {
            
            [JTDatabaseManager createUserCourse:self.course user:(User*)[PFUser currentUser] withCallback:^(UserCourse *course, NSError *error) {
                
                
                if (error) {
                    NSLog(@"error = %@",error);
                    return;
                }
                
                [[JTCourseManager shared] setNewUserCourse:course];
                
                
                [self objectsDidLoad];
            }];
        }
        
        
//    }];
}

- (void) objectsDidLoad {
    
    [self.progressHUD dismissAnimated:YES];
    self.loadingView.hidden = YES;
    
    
    [[JTCourseManager shared] setupTimer];
    
    
    [self setQuizButtonState];

//    NSTimeInterval timeInterval = [[JTCourseManager shared].userCourse.timePassed NSTimeIntervalValue];
//    
//    NSLog(@"timeInterval = %f",timeInterval);
//    
//    [[JTCourseManager shared].courseTimer setStopWatchTime:timeInterval];
//    [[JTCourseManager shared].courseTimer start];
    
    
}

#pragma mark - NSNotifications
- (void) registerForNotifications {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidEnterBackground) name:UIApplicationDidEnterBackgroundNotification object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidBecomeActive) name:UIApplicationDidBecomeActiveNotification object:nil];
}

- (void) applicationDidEnterBackground {
    
    [[JTCourseManager shared] pauseTimerAndUpdate];

}

- (void) applicationDidBecomeActive {
    
    [[JTCourseManager shared] startTimer];

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

#pragma mark - MZTimerLabel Delegate
-(void)timerLabel:(MZTimerLabel*)timerLabel countingTo:(NSTimeInterval)time timertype:(MZTimerLabelType)timerType {
    
    if (time >= courseLength) {
        
        NSInteger courseStatus = [[[[JTCourseManager shared] userCourse] status] integerValue];

        if (courseStatus < JTCourseStatusRead) {
            
            // Show alert if userCourse.status is not yet read
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Congratulations!" message:@"You can now take the quiz." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
            
            
            // Stop the timer and set the course status as read
            [[JTCourseManager shared] stopTimerAndSetComplete];
        }

        
        // Set quiz button state
        [self setQuizButtonState];
        
       
    }
    
}


//courseToQuiz

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([[segue identifier] isEqualToString:@"courseToQuiz"])
    {
        JTQuizViewController *quizVC = [segue destinationViewController];
        
        NSLog(@"self.course = %@",self.course);
        
        quizVC.course = self.course;
    }
}


#pragma mark - ()


#pragma mark - Buttons
- (IBAction)didTapQuizButton:(id)sender {
    
    if ([[JTCourseManager shared] isCourseRead]) {
        [self performSegueWithIdentifier:@"courseToQuiz" sender:sender];
    }
    else {
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Keep Studying!" message:@"You can only take the quiz after 60 minutes of study." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
}

- (void) setQuizButtonState {
    
    // Set color based on the course status
    if ([[JTCourseManager shared] isCourseRead]) {
        [self.quizButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }
    else {
        [self.quizButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }
}

@end
