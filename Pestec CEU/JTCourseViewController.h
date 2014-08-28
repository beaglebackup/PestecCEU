//
//  ApplicatorRulesCourseTopic1ViewController.h
//  Pestec CEU
//
//  Created by Gabriel on 7/6/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JTCourseViewController : UIViewController


@property (nonatomic, strong) NSString* workerType;
@property (nonatomic, strong) NSNumber* tag;




//label
@property (strong, nonatomic) IBOutlet UILabel *applicatorsTopic1Label;
@property (strong, nonatomic) IBOutlet UILabel *applicatorsTopic1RulesLabel;
@property (strong, nonatomic) IBOutlet UILabel *applicatorsTopic1TimeLabel;

//textview
@property (strong, nonatomic) IBOutlet UITextView *applicatorsTopic1TextView;


//Buttons
@property (strong, nonatomic) IBOutlet UIButton *applicatorsTopic1SaveExitButton;
@property (strong, nonatomic) IBOutlet UIButton *applicatorsTopic1QuizButton;


@end
