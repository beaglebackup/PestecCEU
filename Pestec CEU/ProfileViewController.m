//
//  ProfileViewController.m
//  Pestec CEU
//
//  Created by Gabriel on 7/6/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import "ProfileViewController.h"
#import "User.h"
#import "DAKeyboardControl.h"
#import "JGProgressHUD.h"



@interface ProfileViewController ()

@property (nonatomic, strong) JGProgressHUD* progressHUD;


@end

@implementation ProfileViewController



- (id)initWithCoder:(NSCoder*)decoder {
    self = [super initWithCoder:decoder];
    if (self) {
        
    }

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    // Dismiss keyboard on scroll
    [self.view addKeyboardPanningWithFrameBasedActionHandler:^(CGRect keyboardFrameInView, BOOL opening, BOOL closing) {
        /*
         Try not to call "self" inside this block (retain cycle).
         But if you do, make sure to remove DAKeyboardControl
         when you are done with the view controller by calling:
         [self.view removeKeyboardControl];
         */
    } constraintBasedActionHandler:nil];
    

    // Fill fields with existing data
    User* user = (User*)[PFUser currentUser];
    
    if (user.firstName) _firstNameTextField.text = user.firstName;
    if (user.lastName) _lastNameTextField.text = user.lastName;
    if (user.license) _licenseTextField.text = user.license;
    if (user.position) _positionTextField.text = user.position;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//
//- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    [self.scrollView endEditing:YES];
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//#pragma mark - UITextField Delegate
//-(BOOL) textFieldShouldReturn: (UITextField *) textField {
//    [textField resignFirstResponder];
//    return YES;
//}

#pragma mark - UITextField Delegate
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y - 30.0f);
    [_scrollView setContentOffset:scrollPoint animated:YES];
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    [_scrollView setContentOffset:CGPointZero animated:YES];
    
}

//#pragma mark - UIScrollView Delegate
//- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
//{
//    
//    [_firstNameTextField resignFirstResponder];
//    [_lastNameTextField resignFirstResponder];
//    [_licenseTextField resignFirstResponder];
//    [_positionTextField resignFirstResponder];
//
//}


#pragma mark - Actions
- (IBAction)didTapSave:(id)sender {
    
    // Loading HUD
    self.progressHUD = [JGProgressHUD progressHUDWithStyle:JGProgressHUDStyleLight];
    self.progressHUD.textLabel.text = @"Saving Profile";
    [self.progressHUD showInView:self.view];

    
    [JTDatabaseManager updateUserProfile:[PFUser currentUser] firstName:_firstNameTextField.text lastName:_lastNameTextField.text license:_licenseTextField.text position:_positionTextField.text withCallback:^(BOOL succeeded, NSError *error) {
        
        [self.progressHUD dismissAnimated:YES];
        
        if (error) {
            NSLog(@"error = %@",error);
            return;
        }

        
    }];

}

- (IBAction)didTapEdit:(id)sender {
    
}
@end
