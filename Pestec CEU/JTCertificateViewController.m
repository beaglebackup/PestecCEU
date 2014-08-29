//
//  JTCertificateViewController.m
//  PestecCEU
//
//  Created by Admin on 8/29/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import "JTCertificateViewController.h"
#import "User.h"

@interface JTCertificateViewController ()

@end

@implementation JTCertificateViewController

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (IBAction)didTapEmailButton:(id)sender {
    
    User* user = (User*)[PFUser currentUser];
    NSString* email = user.email;
    
    if (email) {
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"E-mail certificate to:" message:email delegate:self cancelButtonTitle:@"Yes please!" otherButtonTitles:nil];
        [alertView show];
    }
    else {
        
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Ants!" message:@"You didn't enter your e-mail in your profile" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
    
  

}
@end
