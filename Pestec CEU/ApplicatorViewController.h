//
//  ApplicatorViewController.h
//  Pestec CEU
//
//  Created by Gabriel on 7/6/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ApplicatorViewController : UIViewController

//scollview


//labels
@property (strong, nonatomic) IBOutlet UILabel *applicatorRequirementsLabel;
@property (strong, nonatomic) IBOutlet UILabel *applicatorRulesLabel;
@property (strong, nonatomic) IBOutlet UILabel *applicatorPesticideLabel;
@property (strong, nonatomic) IBOutlet UILabel *applicatorIPMLabel;


//textview
@property (strong, nonatomic) IBOutlet UITextView *applicatorRequirementsTextView;
@property (strong, nonatomic) IBOutlet UITextView *applicatorProofTextView;

//buttons
@property (strong, nonatomic) IBOutlet UIButton *applicatorCoursesAvailableButton;
@property (strong, nonatomic) IBOutlet UIButton *applicatorCoursesCompletedButton;




@end
