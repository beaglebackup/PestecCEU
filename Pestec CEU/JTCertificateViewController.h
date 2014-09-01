//
//  JTCertificateViewController.h
//  PestecCEU
//
//  Created by Admin on 8/29/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserCourse.h"

@interface JTCertificateViewController : UIViewController <UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UIButton *emailButton;

@property (strong, nonatomic) IBOutlet UIView *certView;

@property (strong, nonatomic) UserCourse* userCourse;

//@property (strong, nonatomic) NSString* courseName;
//@property (strong, nonatomic) NSString* categoryType;


- (IBAction)didTapEmailButton:(id)sender;

@end
