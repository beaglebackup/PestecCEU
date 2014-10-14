//
//  AppDelegate.m
//  Pestec CEU
//
//  Created by Gabriel on 7/6/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import "AppDelegate.h"
#import "JTWelcomeViewController.h"
#import "User.h"
#import "Course.h"
#import "UserCourse.h"
#import "QuizAnswer.h"
#import "QuizQuestion.h"
#import "UserAnswer.h"
#import "CourseSet.h"
#import "UserCourseSet.h"


@interface AppDelegate ()

@property (nonatomic, strong) JTWelcomeViewController* welcomeController;
@property (nonatomic, strong) UINavigationController* navController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Register Parse data subclasses
    [User registerSubclass];
    [Course registerSubclass];
    [UserCourse registerSubclass];
    [QuizQuestion registerSubclass];
    [QuizAnswer registerSubclass];
    [UserAnswer registerSubclass];
    [CourseSet registerSubclass];
    [UserCourseSet registerSubclass];

    
    // Initialize Parse
    [Parse setApplicationId:@"2RpKPCSxc376LSvgHc5S6TYODqDmIzcEfrbhZsHj"
                  clientKey:@"NM3PnBTIxvTfRdswo68iXfdkfG8SgLXyXM6ptXo5"];
    
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    
    [self setupAppearance];
    
    
    self.navController = (UINavigationController*)self.window.rootViewController;
    self.welcomeController = (JTWelcomeViewController*)[self.navController.viewControllers objectAtIndex:0];
    
    
    // Admin
//    [JTDatabaseManager addQuizQuestionsToCourses];
//    [JTDatabaseManager addQuizAnswersToQuizQuestions];      
//    [JTDatabaseManager copyClass:@"QuizQuestions" toClass:@"QuizQuestion"];
//    [JTDatabaseManager copyClass:@"QuizAnswers" toClass:@"QuizAnswer"];
//    [JTDatabaseManager copyClass:@"UserAnswers" toClass:@"UserAnswer"];


    
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}



- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    

    
//    [[JTCourseManager shared] pauseAndUpdateTimer];

}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark - Login/Signup

- (void)presentLoginViewControllerAnimated:(BOOL)animated withDismissButton:(BOOL)withDismissButton {
    [self.welcomeController performSegueWithIdentifier:@"welcomeToLogin" sender:nil];
}


- (void)userDidLogIn:(PFUser*)user {
    [self proceedToMainInterface:user];
}


- (void)proceedToMainInterface:(PFUser *)user {
    
    // Present the main interface
    [self.welcomeController performSegueWithIdentifier:@"welcomeToMain" sender:nil];
    
    
}

#pragma mark JTLoginViewController Delegate

- (void)logInViewController:(JTLoginViewController *)logInController didLogInUser:(PFUser *)user {
    
    [self.welcomeController.presentedViewController dismissViewControllerAnimated:YES completion:^{
        [self userDidLogIn:user];
    }];
}



- (void)logInViewController:(JTLoginViewController *)logInController didSignUpUser:(PFUser *)user {
    
    [self.welcomeController.presentedViewController dismissViewControllerAnimated:YES completion:^{
        [self userDidLogIn:user];
    }];
    
}

- (void)logInViewControllerDidCancelLogIn:(JTLoginViewController *)logInController {
    
}



#pragma mark - ()
- (void) setupAppearance {
    // Navigation bar appearance (background and title)
    
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], NSForegroundColorAttributeName, [UIFont boldSystemFontOfSize:20.0f], NSFontAttributeName, nil]];
    
    if([UINavigationBar instancesRespondToSelector:@selector(barTintColor)]){ //iOS7
        [[UINavigationBar appearance] setBarTintColor:[UIColor colorLightBeige]];
    }
    else {
        [[UINavigationBar appearance] setBackgroundColor:[UIColor colorLightBeige]];
        
    }
    // Navigation bar buttons appearance
    
    //    [[UIBarButtonItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorLightBeige], NSForegroundColorAttributeName, [UIFont systemFontOfSize:18.0f], NSFontAttributeName, nil]];
}



@end
