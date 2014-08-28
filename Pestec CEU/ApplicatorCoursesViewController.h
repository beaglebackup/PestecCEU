//
//  ApplicatorCoursesViewController.h
//  Pestec CEU
//
//  Created by Gabriel on 7/6/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JTTopicBaseViewController.h"

@interface ApplicatorCoursesViewController : JTTopicBaseViewController


@property (strong, nonatomic) IBOutlet UILabel *applicatorsLabel;
@property (strong, nonatomic) IBOutlet UILabel *applicatorCoursesAvailableLabel;
@property (strong, nonatomic) IBOutlet UILabel *applicatorRulesLabel;
@property (strong, nonatomic) IBOutlet UILabel *applicatorPesticideLabel;
@property (strong, nonatomic) IBOutlet UILabel *applicatorIPMLabel;




//buttons
@property (strong, nonatomic) IBOutlet UIButton *applicatorTopic1Button;
@property (strong, nonatomic) IBOutlet UIButton *applicatorTopic2Button;
@property (strong, nonatomic) IBOutlet UIButton *applicatorTopic3Button;
@property (strong, nonatomic) IBOutlet UIButton *applicatorTopic4Button;





@end
