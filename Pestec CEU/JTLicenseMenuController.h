//
//  LicenseTypeViewController.h
//  Pestec CEU
//
//  Created by Gabriel on 7/6/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JTBaseViewController.h"

@interface JTLicenseMenuController : JTBaseViewController

//labels
@property (strong, nonatomic) IBOutlet UILabel *licenseTypeLabel;

//buttons
@property (strong, nonatomic) IBOutlet UIButton *userProfileButton;
@property (strong, nonatomic) IBOutlet UIButton *applicatorLicenseButton;
@property (strong, nonatomic) IBOutlet UIButton *fieldRepLicenseButton;
@property (strong, nonatomic) IBOutlet UIButton *operatorLicenseButton;




@end
