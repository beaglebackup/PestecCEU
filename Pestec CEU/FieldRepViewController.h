//
//  FieldRepViewController.h
//  Pestec CEU
//
//  Created by Gabriel on 7/6/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FieldRepViewController : UIViewController

//labels
@property (strong, nonatomic) IBOutlet UILabel *fieldRepRequirementsLabel;
@property (strong, nonatomic) IBOutlet UILabel *fieldRepRulesLabel;
@property (strong, nonatomic) IBOutlet UILabel *fieldRepTechnicalLabel;
@property (strong, nonatomic) IBOutlet UILabel *fieldRepIPMLabel;
@property (strong, nonatomic) IBOutlet UILabel *fieldRepGeneralLabel;


//textviews
@property (strong, nonatomic) IBOutlet UITextView *fieldRepRequirementsTextView;
@property (strong, nonatomic) IBOutlet UITextView *fieldRepProofTextView;

//buttons

@property (strong, nonatomic) IBOutlet UIButton *fieldRepCoursesCompletedButton;
@property (strong, nonatomic) IBOutlet UIButton *fieldRepCoursesAvailableButton;





@end
