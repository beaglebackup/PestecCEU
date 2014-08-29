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

@interface JTCourseViewController : UIViewController <MZTimerLabelDelegate>


@property (nonatomic, strong) Course* course;

@property (assign) JTWorkerTypeIndex workerType;
@property (nonatomic, strong) NSNumber* tag;


@property (strong, nonatomic) IBOutlet UIView *loadingView;


//label
@property (strong, nonatomic) IBOutlet UILabel *workerLabel;
@property (strong, nonatomic) IBOutlet UILabel *categoryLabel;
@property (strong, nonatomic) IBOutlet MZTimerLabel *courseTimer;

//textview
@property (strong, nonatomic) IBOutlet UITextView *textView;


//Buttons
@property (strong, nonatomic) IBOutlet UIButton *saveButton;
@property (strong, nonatomic) IBOutlet UIButton *quizButton;

- (IBAction)didTapSaveButton:(id)sender;
- (IBAction)didTapQuizButton:(id)sender;

@end
