//
//  ApplicatorCoursesViewController.m
//  Pestec CEU
//
//  Created by Gabriel on 7/6/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import "JTApplicatorCoursesViewController.h"
#import "JTCourseViewController.h"


@interface JTApplicatorCoursesViewController ()


@end

@implementation JTApplicatorCoursesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
        
    [self loadObjects];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableView Delegate & Datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return numSectionsApplicatorVC;
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section {

    switch (section) {
        case JTApplicatorVCSectionRules:
            return numRowsApplicatorRules;
            break;
            
        case JTApplicatorVCSectionPesticide:
            return numRowsApplicatorPesticide;
            break;
            
        case JTApplicatorVCSectionIPM:
            return numRowsApplicatorIPM;
            break;
            
        default:
            return 0;
            break;
    }
}



- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"topicCell";
    
    UITableViewCell *cell = (UITableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    Course* course;

    switch (indexPath.section) {
        case JTApplicatorVCSectionRules:
            course = (Course*)self.objects[indexPath.row];
            break;
            
        case JTApplicatorVCSectionPesticide:
            course = (Course*)self.objects[indexPath.row + numRowsApplicatorRules];
            break;
            
        case JTApplicatorVCSectionIPM:
            course = (Course*)self.objects[indexPath.row + numRowsApplicatorRules + numRowsApplicatorPesticide];
            break;
            
        default:
            return 0;
            break;
    }
    
    cell.textLabel.text = course.name;
    cell.tag = indexPath.row + 1; // Course tags start at 1
    
    return cell;
}




- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell* cell = [aTableView cellForRowAtIndexPath:indexPath];
    
    [self performSegueWithIdentifier:@"topicToCourse" sender:cell];

    
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    static NSString *CellIdentifier = @"topicSectionHeaderCell";
    UITableViewCell *headerView = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (headerView == nil){
        [NSException raise:@"headerView == nil.." format:@"No cells with matching CellIdentifier loaded from your storyboard"];
    }
    
    switch (section) {
        case 0:
            headerView.textLabel.text = @"Rules & Regulations";
            break;
            
        case 1:
            headerView.textLabel.text = @"Pesticide";
            break;
            
        case 2:
            headerView.textLabel.text = @"IPM";
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
    if ([[segue identifier] isEqualToString:@"topicToCourse"])
    {
        JTCourseViewController *courseVC = [segue destinationViewController];
        courseVC.tag = [NSNumber numberWithInt:cell.tag];
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
