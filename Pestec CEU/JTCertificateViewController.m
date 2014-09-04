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
    
    CGFloat labelFontSize = 22.0f;

    
    User* user = (User*)[PFUser currentUser];
    
    
    // Create the full-sized Cert
    self.originalSizeCertImage = [UIImage originalSizeImageWithPDFNamed:@"educertificatesample.pdf"];
    self.originalSizeCertImageView = [[UIImageView alloc] initWithImage:self.originalSizeCertImage];

    NSLog(@"NSStringFromCGSize(originalSizeCertImage.size = %@",NSStringFromCGSize(self.originalSizeCertImage.size));
    
    // Add all labels
    UILabel* nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(170.0f, 175.0f, 0.0f, 0.0f)];
    [nameLabel setTextAlignment:NSTextAlignmentLeft];
    [nameLabel setBackgroundColor:[UIColor clearColor]];
    [nameLabel setTextColor:[UIColor redColor]];
    [nameLabel setFont:[UIFont systemFontOfSize:labelFontSize]];
    [nameLabel setText:[NSString stringWithFormat:@"%@ %@",user.firstName, user.lastName]];
    [nameLabel sizeToFit];
    [self.originalSizeCertImageView addSubview:nameLabel];
    [self.originalSizeCertImageView bringSubviewToFront:nameLabel];
    
    
    UILabel* licenseNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(590.0f, 175.0f, 0.0f, 0.0f)];
    [licenseNumLabel setTextAlignment:NSTextAlignmentLeft];
    [licenseNumLabel setBackgroundColor:[UIColor clearColor]];
    [licenseNumLabel setTextColor:[UIColor redColor]];
    [licenseNumLabel setFont:[UIFont systemFontOfSize:labelFontSize]];
    [licenseNumLabel setText:[NSString stringWithFormat:@"%@",user.license]];
    [licenseNumLabel sizeToFit];
    [self.originalSizeCertImageView addSubview:licenseNumLabel];
    [self.originalSizeCertImageView bringSubviewToFront:licenseNumLabel];
    
    
    UILabel* activityTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(170.0f, 205.0f, 0.0f, 0.0f)];
    [activityTitleLabel setTextAlignment:NSTextAlignmentLeft];
    [activityTitleLabel setBackgroundColor:[UIColor clearColor]];
    [activityTitleLabel setTextColor:[UIColor redColor]];
    [activityTitleLabel setFont:[UIFont systemFontOfSize:labelFontSize]];
    [activityTitleLabel setText:[NSString stringWithFormat:@"%@ - %@",self.userCourseSet.workerType, self.userCourseSet.categoryType]];
    [activityTitleLabel sizeToFit];
    [self.originalSizeCertImageView addSubview:activityTitleLabel];
    [self.originalSizeCertImageView bringSubviewToFront:activityTitleLabel];

   

    
    UILabel* activityDateLabel = [[UILabel alloc] initWithFrame:CGRectMake(590.0f, 205.0f, 0.0f, 0.0f)];
    [activityDateLabel setTextAlignment:NSTextAlignmentLeft];
    [activityDateLabel setBackgroundColor:[UIColor clearColor]];
    [activityDateLabel setTextColor:[UIColor redColor]];
    [activityDateLabel setFont:[UIFont systemFontOfSize:labelFontSize]];
    [activityDateLabel setText:[NSString stringWithFormat:@"%@", [NSDateFormatter localizedStringFromDate:self.userCourseSet.updatedAt
                                                dateStyle:NSDateFormatterShortStyle
                                                timeStyle:NSDateFormatterNoStyle]]];
    [activityDateLabel sizeToFit];
    [self.originalSizeCertImageView addSubview:activityDateLabel];
    [self.originalSizeCertImageView bringSubviewToFront:activityDateLabel];
    
    
    
    UILabel* hoursAttendedLabel = [[UILabel alloc] initWithFrame:CGRectMake(400.0f, 255.0f, 0.0f, 0.0f)];
    [hoursAttendedLabel setTextAlignment:NSTextAlignmentLeft];
    [hoursAttendedLabel setBackgroundColor:[UIColor clearColor]];
    [hoursAttendedLabel setTextColor:[UIColor redColor]];
    [hoursAttendedLabel setFont:[UIFont systemFontOfSize:labelFontSize]];
    [hoursAttendedLabel setText:[NSString stringWithFormat:@"%@",[NSNumber numberWithInteger:self.userCourseSet.userCourses.count]]];
    [hoursAttendedLabel sizeToFit];
    [self.originalSizeCertImageView addSubview:hoursAttendedLabel];
    [self.originalSizeCertImageView bringSubviewToFront:hoursAttendedLabel];
    
    
    UILabel* hoursEarnedLabel = [[UILabel alloc] initWithFrame:CGRectMake(450.0f, 255.0f, 0.0f, 0.0f)];
    [hoursEarnedLabel setTextAlignment:NSTextAlignmentLeft];
    [hoursEarnedLabel setBackgroundColor:[UIColor clearColor]];
    [hoursEarnedLabel setTextColor:[UIColor redColor]];
    [hoursEarnedLabel setFont:[UIFont systemFontOfSize:labelFontSize]];
    [hoursEarnedLabel setText:[NSString stringWithFormat:@"%@",[NSNumber numberWithInteger:self.userCourseSet.userCourses.count]]];
    [hoursEarnedLabel sizeToFit];
    [self.originalSizeCertImageView addSubview:hoursEarnedLabel];
    [self.originalSizeCertImageView bringSubviewToFront:hoursEarnedLabel];
    
    
    UILabel* sigDataLabel = [[UILabel alloc] initWithFrame:CGRectMake(600.0f, 440.0f, 0.0f, 0.0f)];
    [sigDataLabel setTextAlignment:NSTextAlignmentLeft];
    [sigDataLabel setBackgroundColor:[UIColor clearColor]];
    [sigDataLabel setTextColor:[UIColor redColor]];
    [sigDataLabel setFont:[UIFont systemFontOfSize:labelFontSize]];
    [sigDataLabel setText:[NSDateFormatter localizedStringFromDate:[NSDate date]
                                                         dateStyle:NSDateFormatterShortStyle
                                                         timeStyle:NSDateFormatterNoStyle]];
    [sigDataLabel sizeToFit];
    [self.originalSizeCertImageView addSubview:sigDataLabel];
    [self.originalSizeCertImageView bringSubviewToFront:sigDataLabel];

    
    
    
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
        {
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"E-mail sent successfully." message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
        }
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
        [picker addAttachmentData:myData mimeType:@"image/png" fileName:@"pestec_cert.png"];
        
        // Fill out the email body text
        NSString *emailBody = [NSString stringWithFormat:@"%@ - %@",self.userCourseSet.workerType, self.userCourseSet.categoryType];
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
