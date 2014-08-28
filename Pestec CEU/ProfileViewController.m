//
//  ProfileViewController.m
//  Pestec CEU
//
//  Created by Gabriel on 7/6/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import "ProfileViewController.h"
#import "User.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

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
    
    // Set delegates
    _firstNameTextField.delegate = self;
    _lastNameTextField.delegate = self;
    _licenseTextField.delegate = self;
    _positionTextField.delegate =self;
    
    _scrollView.delegate = self;
    

    // Fill fields with existing data
    User* user = (User*)[PFUser currentUser];
    
    if (user.firstName) _firstNameTextField.text = user.firstName;
    if (user.lastName) _lastNameTextField.text = user.lastName;
    if (user.firstName) _licenseTextField.text = user.license;
    if (user.firstName) _positionTextField.text = user.position;
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

#pragma mark - UIScrollView Delegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    
    [_firstNameTextField resignFirstResponder];
    [_lastNameTextField resignFirstResponder];
    [_licenseTextField resignFirstResponder];
    [_positionTextField resignFirstResponder];

}


#pragma mark - Actions
- (IBAction)didTapSave:(id)sender {
    
    [JTDatabaseManager updateUserProfile:[PFUser currentUser] firstName:_firstNameTextField.text lastName:_lastNameTextField.text license:_lastNameTextField.text position:_positionTextField.text withCallback:^(BOOL succeeded, NSError *error) {
        
        if (succeeded) {
            
            
        }
        
    }];

}

- (IBAction)didTapEdit:(id)sender {
    
}
@end
