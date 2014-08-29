//
//  LicenseTypeViewController.m
//  Pestec CEU
//
//  Created by Gabriel on 7/6/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import "LicenseTypeViewController.h"
#import "JTWorkerBaseViewController.h"

@interface LicenseTypeViewController ()

@end

@implementation LicenseTypeViewController

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
    UIButton* button = (UIButton*)sender;
    
    if ([[segue identifier] isEqualToString:@"licenseToWorker"])
    {
        JTWorkerBaseViewController *workerVC = [segue destinationViewController];
        
        workerVC.navTitle = @"CEU Requirements";
        
        switch (button.tag) {
            case JTWorkerTypeApplicator:
                workerVC.workerType = JTWorkerTypeApplicator;
                break;
            case JTWorkerTypeFieldRep:
                workerVC.workerType = JTWorkerTypeFieldRep;
                break;
            case JTWorkerTypeOperator:
                workerVC.workerType = JTWorkerTypeOperator;
                break;
                
            default:
                break;
        }
    }
}


@end
