//
//  FieldRepCoursesViewController.h
//  Pestec CEU
//
//  Created by Gabriel on 7/6/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JTTopicBaseViewController.h"
@interface FieldRepCoursesViewController : JTTopicBaseViewController

@property (strong, nonatomic) IBOutlet UILabel *fieldRepLabel;
@property (strong, nonatomic) IBOutlet UILabel *fieldRepCoursesAvailableLabel;
@property (strong, nonatomic) IBOutlet UILabel *fieldRepRulesLabel;
@property (strong, nonatomic) IBOutlet UILabel *fieldRepTechnicalLabel;
@property (strong, nonatomic) IBOutlet UILabel *fieldRepIPMLabel;
@property (strong, nonatomic) IBOutlet UILabel *fieldRepGeneralLabel;


@end
