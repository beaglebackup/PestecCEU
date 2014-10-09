//
//  JTWorkerBaseViewController.m
//  PestecCEU
//
//  Created by Admin on 8/28/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import "JTWorkerBaseViewController.h"
#import "JTTopicBaseViewController.h"

@interface JTWorkerBaseViewController ()

@end

@implementation JTWorkerBaseViewController

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
    
    self.title = self.navTitle;


//    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0.0, 0.0, 320.0, 44.0)];
//    [label setBackgroundColor:[UIColor clearColor]];
//    [label setNumberOfLines:0];
//    [label setTextColor:[UIColor whiteColor]];
//    [label setTextAlignment:NSTextAlignmentCenter];
//    [label setText:self.navTitle];
//    self.navigationItem.titleView = label;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIButton* button = (UIButton*)sender;
    
    if ([[segue identifier] isEqualToString:@"workerToTopics"])
    {
        JTTopicBaseViewController *topicVC = [segue destinationViewController];

        switch (button.tag) {
            case JTWorkerTypeApplicator:
                topicVC.workerType = JTWorkerTypeApplicator;
                break;
            case JTWorkerTypeFieldRep:
                topicVC.workerType = JTWorkerTypeFieldRep;
                break;
            case JTWorkerTypeOperator:
                topicVC.workerType = JTWorkerTypeOperator;
                break;
                
            default:
                break;
        }
    }
}

@end
