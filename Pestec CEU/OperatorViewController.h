//
//  OperatorViewController.h
//  Pestec CEU
//
//  Created by Gabriel on 7/6/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JTWorkerBaseViewController.h"

@interface OperatorViewController : JTWorkerBaseViewController

//labels
@property (strong, nonatomic) IBOutlet UILabel *operatorRequirementsLabel;
@property (strong, nonatomic) IBOutlet UILabel *operatorRulesLabel;
@property (strong, nonatomic) IBOutlet UILabel *operatorTechnicalLabel;
@property (strong, nonatomic) IBOutlet UILabel *operatorIPMLabel;
@property (strong, nonatomic) IBOutlet UILabel *operatorGeneralLabel;




//textviews
@property (strong, nonatomic) IBOutlet UITextView *operatorRequirementTextView;
@property (strong, nonatomic) IBOutlet UITextView *operatorProofTextView;


//buttons
@property (strong, nonatomic) IBOutlet UIButton *operatorCoursesAvailableButton;
@property (strong, nonatomic) IBOutlet UIButton *operatorCoursesCompletedButton;



@end
