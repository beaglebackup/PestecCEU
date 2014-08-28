//
//  ProfileViewController.h
//  Pestec CEU
//
//  Created by Gabriel on 7/6/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController <UITextFieldDelegate, UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

//labels
@property (strong, nonatomic) IBOutlet UILabel *userProfileLabel;
@property (strong, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *lastNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *licenseLabel;
@property (strong, nonatomic) IBOutlet UILabel *positionLabel;


//textfields
@property (strong, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *licenseTextField;
@property (strong, nonatomic) IBOutlet UITextField *positionTextField;


//buttons
@property (strong, nonatomic) IBOutlet UIButton *saveButton;
@property (strong, nonatomic) IBOutlet UIButton *editButton;
@property (strong, nonatomic) IBOutlet UIButton *backButton;

- (IBAction)didTapSave:(id)sender;
- (IBAction)didTapEdit:(id)sender;



@end
