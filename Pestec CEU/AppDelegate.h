//
//  AppDelegate.h
//  Pestec CEU
//
//  Created by Gabriel on 7/6/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

- (void)presentLoginViewControllerAnimated:(BOOL)animated withDismissButton:(BOOL)withDismissButton;
- (void)userHasLoggedIn;
- (void)logOut;



@end
