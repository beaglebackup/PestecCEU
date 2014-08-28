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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    JTTopicButton* button = (JTTopicButton*)sender;
    
    // Subdetails
    if ([[segue identifier] isEqualToString:@"topicToCourse"])
    {
        JTCourseViewController *courseVC = [segue destinationViewController];
        courseVC.tag = [NSNumber numberWithInt:button.tag];
        courseVC.workerType = self.workerType;
    }
}

#pragma mark - JTTopicButton Delegate
- (void)didTapTopicButton:(JTTopicButton *)button {
    
    NSInteger tag = button.tag;
    
    NSLog(@"tag = %d",tag);
    
    
    [self performSegueWithIdentifier:@"topicToCourse" sender:button];
    
}


@end
