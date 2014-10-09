//
//  JTQuizViewController.h
//  PestecCEU
//
//  Created by Admin on 8/28/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Course.h"
#import "JTBaseViewController.h"

@interface JTQuizViewController : JTBaseViewController <UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate>


@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong ,nonatomic) Course* course;
- (IBAction)didTapSubmitButton:(id)sender;

@end
