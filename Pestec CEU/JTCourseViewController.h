//
//  ApplicatorRulesCourseTopic1ViewController.h
//  Pestec CEU
//
//  Created by Gabriel on 7/6/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MZTimerLabel.h"
#import "Course.h"

@interface JTCourseViewController : UIViewController


@property (nonatomic, strong) Course* course;

@property (nonatomic, strong) NSString* workerType;
@property (nonatomic, strong) NSNumber* tag;




//label
@property (strong, nonatomic) IBOutlet UILabel *workerLabel;
@property (strong, nonatomic) IBOutlet UILabel *categoryLabel;
@property (strong, nonatomic) IBOutlet MZTimerLabel *courseTimer;

//textview
@property (strong, nonatomic) IBOutlet UITextView *applicatorsTopic1TextView;


//Buttons
@property (strong, nonatomic) IBOutlet UIButton *applicatorsTopic1SaveExitButton;
@property (strong, nonatomic) IBOutlet UIButton *applicatorsTopic1QuizButton;


@end
