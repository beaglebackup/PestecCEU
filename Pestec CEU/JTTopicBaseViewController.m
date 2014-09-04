//
//  JTTopicBaseViewController.m
//  PestecCEU
//
//  Created by Admin on 8/27/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import "JTTopicBaseViewController.h"
#import "JTCourseViewController.h"

@interface JTTopicBaseViewController ()



@end

@implementation JTTopicBaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set the title
    NSString* workerString = [JTDatabaseManager workerString:self.workerType];
    self.title = [NSString stringWithFormat:@"%@ Courses", workerString];
    
    // UITableView
    self.tableView.sectionFooterHeight = 0.0;


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Data
- (void) loadObjects {

    
    // Get the course object
    NSString* workerString = [JTDatabaseManager workerString:self.workerType];
    [JTDatabaseManager queryForCourses:workerString withCallback:^(NSArray *courses, NSError *error) {
        if (error) {
            NSLog(@"error = %@",error);
            return;
        }
        
        self.objects = courses;
        
        [self objectsDidLoad];
        
    }];
}


- (void) objectsDidLoad {
    
    
    [self.tableView reloadData];
    
}



@end
