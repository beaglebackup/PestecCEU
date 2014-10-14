//
//  JTSignupViewController.h
//  PestecCEU
//
//  Created by Admin on 10/14/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JTBaseViewController.h"
#import "JTTextField.h"

@protocol JTSignupViewControllerDelegate;


@interface JTSignupViewController : JTBaseViewController

@property (strong, nonatomic) IBOutlet JTTextField *usernameTextField;
@property (strong, nonatomic) IBOutlet JTTextField *passwordTextField;
@property (strong, nonatomic) IBOutlet JTTextField *emailTextField;

- (IBAction)didTapSignupButton:(id)sender;

- (IBAction)didTapBackButton:(id)sender;

/*! @name Delegate */
@property (nonatomic, strong) id<JTSignupViewControllerDelegate> delegate;

@end



@protocol JTSignupViewControllerDelegate <NSObject>
@required

- (void)signUpViewController:(JTSignupViewController *)signUpController didSignUpUser:(PFUser *)user;

- (void)signUpViewController:(JTSignupViewController *)signUpController didTapBackButton:(id)sender;

@end
