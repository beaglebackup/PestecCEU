//
//  JTLoginViewController.h
//  PestecCEU
//
//  Created by Admin on 10/14/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JTBaseViewController.h"
#import "JTTextField.h"
#import "JTSignupViewController.h"

@protocol JTLoginViewControllerDelegate;


@interface JTLoginViewController : JTBaseViewController <JTSignupViewControllerDelegate>

@property (strong, nonatomic) IBOutlet JTTextField *usernameTextField;
@property (strong, nonatomic) IBOutlet JTTextField *passwordTextField;

- (IBAction)didTapLoginButton:(id)sender;

/*! @name Delegate */
@property (nonatomic, strong) id<JTLoginViewControllerDelegate> delegate;

@end



@protocol JTLoginViewControllerDelegate <NSObject>
@required

- (void)logInViewController:(JTLoginViewController *)logInController didLogInUser:(PFUser *)user;
- (void)logInViewController:(JTLoginViewController *)logInController didSignUpUser:(PFUser *)user;

- (void)logInViewControllerDidCancelLogIn:(JTLoginViewController *)logInController;

@end