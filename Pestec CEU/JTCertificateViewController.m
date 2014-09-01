//
//  JTCertificateViewController.m
//  PestecCEU
//
//  Created by Admin on 8/29/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import "JTCertificateViewController.h"
#import "User.h"
#import "UIImage+PDF.h"
#import "UIImage+Extensions.h"
#import <MessageUI/MessageUI.h>

@interface JTCertificateViewController ()

@property (nonatomic, strong) UIImageView* originalSizeCertImageView;
@property (nonatomic, strong) UIImage* originalSizeCertImage;

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
    
//    CGSize certSize = self.certImageView.frame.size;
//    
//    UIImage *certImage = [UIImage imageWithPDFNamed:@"educertificatesample.pdf" atSize:CGSizeMake(certSize.width,
//                                                                                                   certSize.height)];
//    
//    self.certImageView.image = certImage;
    
    
    
    
    // Create the full-sized Cert
    self.originalSizeCertImage = [UIImage originalSizeImageWithPDFNamed:@"educertificatesample.pdf"];
    
    NSLog(@"NSStringFromCGSize(originalSizeCertImage.size = %@",NSStringFromCGSize(self.originalSizeCertImage.size));
    
    // Add all labels
    UILabel* nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(150.0f, 60.0f, 0.0f, 0.0f)];
    [nameLabel setTextAlignment:NSTextAlignmentLeft];
    [nameLabel setBackgroundColor:[UIColor clearColor]];
    [nameLabel setTextColor:[UIColor redColor]];
    [nameLabel setFont:[UIFont systemFontOfSize:28.0f]];
    [nameLabel setText:@"Ramsel Ruiz"];
    [nameLabel sizeToFit];
    
    self.originalSizeCertImageView = [[UIImageView alloc] initWithImage:self.originalSizeCertImage];
    [self.originalSizeCertImageView addSubview:nameLabel];
    [self.originalSizeCertImageView bringSubviewToFront:nameLabel];
    
    
    NSLog(@"NSStringFromCGSize(originalSizeCertImageView.size = %@",NSStringFromCGSize(self.originalSizeCertImageView.frame.size));

    
    
    // Copy the imageView and scale it down for displaty
    CGFloat scaleX = self.certView.frame.size.width / self.originalSizeCertImageView.frame.size.width;
    CGFloat scaleY = self.certView.frame.size.height / self.originalSizeCertImageView.frame.size.height;
    
    UIImageView* scaledImageView = self.originalSizeCertImageView;
    scaledImageView.transform = CGAffineTransformScale(CGAffineTransformIdentity, scaleX, scaleY);
    
    NSLog(@"NSStringFromCGSize(scaledImageView.size = %@",NSStringFromCGSize(scaledImageView.frame.size));
    NSLog(@"scaledImageView.image = %@",scaledImageView.image);
    
    CGRect scaledFrame = scaledImageView.frame;
    scaledImageView.frame = CGRectMake(0,
                                       0,
                                       scaledFrame.size.width,
                                       scaledFrame.size.height);
    
    [self.certView addSubview:scaledImageView];

    
    
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


#pragma mark - UIAlertView Delegate
//- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
//    
//    if (buttonIndex == 0) {
//        
//        UIImage* emailImage = [UIImage imageWithView:self.originalSizeCertImageView];
//        
//        MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
//        picker.mailComposeDelegate = self;
//        [picker setSubject:@"Your Certificate"];
//
//        // Attach an image to the email
//        NSData *myData = UIImagePNGRepresentation(emailImage);
//        [picker addAttachmentData:myData mimeType:@"image/png" fileName:@"coolImage.png"];
//        
//        // Fill out the email body text
//        NSString *emailBody = @"Y";
//        [picker setMessageBody:emailBody isHTML:NO];
//        
//        
//        User* user = (User*)[PFUser currentUser];
//        NSString* email = user.email;
//        [picker setToRecipients:[NSArray arrayWithObject:email]];
//        
//        [self presentViewController:picker animated:YES completion:nil];
//    }
//}

#pragma mark MFMailComposeViewControllerDelegate
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    switch(result) {
        case MFMailComposeResultCancelled:
            
            break;
        case MFMailComposeResultSaved:
            
            break;
        case MFMailComposeResultSent:
            
            break;
        case MFMailComposeResultFailed:
            
            break;
        default:
            break;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}



#pragma mark - Buttons
- (IBAction)didTapEmailButton:(id)sender {
    
    User* user = (User*)[PFUser currentUser];
    NSString* email = user.email;
    
    if (email) {
        
        UIImage* emailImage = [UIImage imageWithView:self.originalSizeCertImageView];
        
        MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
        picker.mailComposeDelegate = self;
        [picker setSubject:@"Your PestecCEU Certificate"];
        
        // Attach an image to the email
        NSData *myData = UIImagePNGRepresentation(emailImage);
        [picker addAttachmentData:myData mimeType:@"image/png" fileName:@"coolImage.png"];
        
        // Fill out the email body text
        NSString *emailBody = [NSString stringWithFormat:@"%@ - %@",self.courseName, self.categoryType];
        [picker setMessageBody:emailBody isHTML:NO];
        
        // Set the user
        User* user = (User*)[PFUser currentUser];
        NSString* email = user.email;
        [picker setToRecipients:[NSArray arrayWithObject:email]];
        
        [self presentViewController:picker animated:YES completion:nil];
        
    }
    else {
        
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Ants!" message:@"You didn't enter your e-mail in your profile" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
    
  

}
@end
