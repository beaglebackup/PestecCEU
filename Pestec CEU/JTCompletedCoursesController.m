//
//  ApplicatorsCoursesCompletedViewController.m
//  Pestec CEU
//
//  Created by Gabriel on 7/6/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import "JTCompletedCoursesController.h"
#import "JTCertificateViewController.h"
#import "UserCourse.h"

@interface JTCompletedCoursesController ()

@end

@implementation JTCompletedCoursesController

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

    [self loadObjects];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Data
- (void) loadObjects {
    
    // Get the course object
    [JTDatabaseManager queryForCompletedCourses:(User*)[PFUser currentUser] withCallback:^(NSArray *completedCourses, NSError *error) {
        if (error) {
            NSLog(@"error = %@",error);
            return;
        }
        
        self.objects = completedCourses;
        
        [self objectsDidLoad];

    }];
}

- (void) objectsDidLoad {
    
    if (self.objects.count < 1) {
        
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"You don't have any completed courses." message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
        
        return;
    }
    
    
    [self.tableView reloadData];
    
}


#pragma mark - UITableView Delegate & Datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}



- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"completedCourseCell";
    
    UITableViewCell *cell = (UITableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    UserCourse* userCourse = (UserCourse*)self.objects[indexPath.row];
    

    cell.textLabel.text = userCourse.course.categoryType;
    cell.detailTextLabel.text = userCourse.course.name;
    cell.tag = indexPath.row;
    
    return cell;
}




- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell* cell = [aTableView cellForRowAtIndexPath:indexPath];
    
    [self performSegueWithIdentifier:@"toCertificate" sender:cell];
    
    
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    static NSString *CellIdentifier = @"completedSectionHeaderCell";
    UITableViewCell *headerView = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (headerView == nil){
        [NSException raise:@"headerView == nil.." format:@"No cells with matching CellIdentifier loaded from your storyboard"];
    }
    
    switch (section) {
        case JTWorkerTypeApplicator:
            headerView.textLabel.text = [JTDatabaseManager workerString:JTWorkerTypeApplicator];
            break;
            
        case JTWorkerTypeFieldRep:
            headerView.textLabel.text = [JTDatabaseManager workerString:JTWorkerTypeFieldRep];
            break;
            
        case JTWorkerTypeOperator:
            headerView.textLabel.text = [JTDatabaseManager workerString:JTWorkerTypeOperator];
            break;
            
        default:
            break;
    }
    
    
    return headerView;
    
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return heightForSectionHeader;
}




#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    UITableViewCell* cell = (UITableViewCell*)sender;
    
    // Subdetails
    if ([[segue identifier] isEqualToString:@"toCertificate"])
    {
        JTCertificateViewController *certVC = [segue destinationViewController];
        
        UserCourse* userCourse = (UserCourse*)self.objects[cell.tag];
        certVC.userCourse = userCourse;
    }
//}
}



@end
