//
//  JTTopicBaseViewController.m
//  PestecCEU
//
//  Created by Admin on 8/27/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import "JTTopicBaseViewController.h"
#import "JTCourseViewController.h"
#import "JTTopicTableViewCell.h"
#import "JTCertificateViewController.h"
#import "CourseSet.h"
#import "UserCourseSet.h"

@interface JTTopicBaseViewController ()


@property (nonatomic, strong) NSArray* userCourseSets;

@property (nonatomic, strong) NSMutableArray* sectionCompletedTracker;


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

- (NSMutableArray*) sectionCompletedTracker {
    if (!_sectionCompletedTracker) {
        _sectionCompletedTracker = [[NSMutableArray alloc] initWithCapacity:_objects.count];
        for (int i = 0; i < _objects.count; i++ )
        {
            _sectionCompletedTracker[i] = [NSNumber numberWithBool:NO];
        }
    }
    return _sectionCompletedTracker;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set the title
    NSString* workerString = [JTDatabaseManager workerString:self.workerType];
    self.title = [NSString stringWithFormat:@"%@ Courses", workerString];
    
    // UITableView
    self.tableView.sectionFooterHeight = 0.0;
    
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self loadObjects];

}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    [self loadUserCourses];
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
    [JTDatabaseManager queryForCourseSets:workerString withCallback:^(NSArray *courseSets, NSError *error) {
        
        if (error) {
            NSLog(@"error = %@",error);
            return;
        }
        
        NSLog(@"courseSets = %@",courseSets);
        
        
        // Order courses
        __block NSMutableArray* orderedCourseSets = [[NSMutableArray alloc] initWithCapacity:[courseSets count]];
        
        [courseSets enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            
            CourseSet* courseSet = (CourseSet*)obj;
            NSArray* courses = courseSet.courses;
            NSArray* orderedCourses = [courses sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
                NSNumber *first = [(Course*)a tag];
                NSNumber *second = [(Course*)b tag];
                return [first compare:second];
            }];
            
            courseSet.courses = orderedCourses;
            
            [orderedCourseSets insertObject:courseSet atIndex:idx];
            
        }];
        
        
        self.objects = orderedCourseSets;
        
        [self objectsDidLoad];
    }];
    
    


}

- (void) loadUserCourses {

    // Get the userCourses
    NSString* workerString = [JTDatabaseManager workerString:self.workerType];
    [JTDatabaseManager queryForUserCourseSets:workerString user:(User*)[PFUser currentUser] withCallback:^(NSArray *userCourseSets, NSError *error) {
        
        if (error) {
            NSLog(@"error = %@",error);
            return;
        }
        
        self.userCourseSets = userCourseSets;
        
        
        // Fill in sectionCompletedTracker
        // 1. First enumerate courseSets (objects)
        [self.objects enumerateObjectsUsingBlock:^(id obj, NSUInteger idxSection, BOOL *stop) {
            
            CourseSet* courseSet = (CourseSet*)obj;
            
            // 2. Enumerate UserCourseSets to find if there's a userCourse that matches this cell's course
            [self.userCourseSets enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                
                UserCourseSet* userCourseSet = (UserCourseSet*)obj;
                
                if ([courseSet.categoryType isEqualToString:userCourseSet.categoryType]) {
                    
                    __block NSInteger completedCount = 0;
                    
                    // 3. Enumerate all the courses and check if corresponding userCourse.status = completed
                    [courseSet.courses enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                        
                        Course* course = (Course*)obj;
                        
                        // 3. Enumerate all the userCourses
                        [userCourseSet.userCourses enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                            
                            UserCourse* userCourse = (UserCourse*)obj;
                            
                            // Check if there's a userCourse that matches this course && it's status is completed
                            if ([userCourse.course.objectId isEqualToString:course.objectId] && ([userCourse.status integerValue] == JTCourseStatusCompleted)) {
                                
                                completedCount++;
                            }
                        }];
                    }];
                
                    // NOW FINALLY check if total completed topics equals number of topics in this course
                    if (completedCount >= courseSet.courses.count) {
                        self.sectionCompletedTracker[idxSection] = [NSNumber numberWithBool:YES];
                    }
                }
            }];
        }];

        
        
        // AND RELOAD!
        [self.tableView reloadData];

    }];
    
}

- (void) objectsDidLoad {
    
    [self.tableView reloadData];
    
    [self loadUserCourses];
}





#pragma mark - UITableView Delegate & Datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    NSLog(@"self.objects.count = %lu",(unsigned long)self.objects.count);

    return self.objects.count;
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section {
    
    CourseSet* courseSet = (CourseSet*)self.objects[section];
    
    NSLog(@"courseSet.courses.count = %lu",(unsigned long)courseSet.courses.count);
    
    NSInteger courseCount = courseSet.courses.count;
    
    
    // If section is completed add a row for the cert
    if ([self.sectionCompletedTracker[section] boolValue]) {
        
        courseCount++;
    }

    
    return courseCount;
    
}



- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    


    CourseSet* courseSet = (CourseSet*)self.objects[indexPath.section];

    
    // Check if this should be a certificateCell
    if (indexPath.row > (courseSet.courses.count - 1)) {
        
        static NSString *cellIdentifier = @"topicCertCell";
        
        JTTopicTableViewCell *cell = (JTTopicTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        if (cell == nil) {
            cell = [[JTTopicTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        
        cell.section = indexPath.section;
        cell.tag = indexPath.row;

        
        cell.textLabel.text = @"Course Completed";
        cell.detailTextLabel.text = @"Click for certificate";
        return cell;
    }
    
    
    
    
    // A regular cell
    static NSString *cellIdentifier = @"topicCell";
    
    JTTopicTableViewCell *cell = (JTTopicTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[JTTopicTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.section = indexPath.section;
    cell.tag = indexPath.row;
    

    
    Course* course = courseSet.courses[indexPath.row];

    cell.textLabel.text = course.name;
    
    // Set the course status
    if (self.userCourseSets.count > 0) {
        
        __block NSString* status;
        
        // Enumerate UserCourseSets to find if there's a userCourse that matches this cell's course
        [self.userCourseSets enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            
            UserCourseSet* userCourseSet = (UserCourseSet*)obj;
            
            if ([courseSet.categoryType isEqualToString:userCourseSet.categoryType]) {
                
                // If we've found a category match then enumerate the userCourses
                [userCourseSet.userCourses enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                    
                    UserCourse* userCourse = (UserCourse*)obj;
                    
                    if ([userCourse.course.objectId isEqualToString:course.objectId]) {
                        
                        NSInteger statusEnum = [userCourse.status integerValue];
                        
                        switch (statusEnum) {
                            case JTCourseStatusStarted: {
                                status = @"Reading";
                                cell.detailTextLabel.textColor = [UIColor grayColor];
                            }
                                break;
                                
                            case JTCourseStatusRead:
                            {
                                status = @"Quiz";
                                cell.detailTextLabel.textColor = [UIColor darkGrayColor];
                            }
                                break;
                            
                            case JTCourseStatusCompleted:
                            {
                                status = @"Completed";
                                cell.detailTextLabel.textColor = [UIColor blackColor];
                            }
                                break;
                                
                            default:
                                status = @"Not Started";
                                break;
                        }
                        
                    }
                }];
            }
        
            
        }];
        
        
        cell.detailTextLabel.text = status;
    }
//    else {
//        cell.detailTextLabel.text = @"Not Started"; // default for all
//    }
    
    return cell;
}




- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell* cell = [aTableView cellForRowAtIndexPath:indexPath];
    CourseSet* courseSet = (CourseSet*)self.objects[indexPath.section];
    

    // Check if this should be a certificateCell
    if (indexPath.row > (courseSet.courses.count - 1)) {
        [self performSegueWithIdentifier:@"topicToCert" sender:cell];
        return;
    }

    
    [self performSegueWithIdentifier:@"topicToCourse" sender:cell];
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    static NSString *CellIdentifier = @"topicSectionHeaderCell";
    UITableViewCell *headerView = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (headerView == nil){
        [NSException raise:@"headerView == nil.." format:@"No cells with matching CellIdentifier loaded from your storyboard"];
    }
    
    CourseSet* courseSet = (CourseSet*)self.objects[section];
    
    headerView.textLabel.text = courseSet.categoryType;
    
    
   


//    
//    switch (section) {
//        case 0:
//            headerView.textLabel.text = @"Rules & Regulations";
//            break;
//            
//        case 1:
//            headerView.textLabel.text = @"Pesticide";
//            break;
//            
//        case 2:
//            headerView.textLabel.text = @"IPM";
//            break;
//            
//        default:
//            break;
//    }
    
    
    return headerView;
    
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return heightForSectionHeader;
}



#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    JTTopicTableViewCell* cell = (JTTopicTableViewCell*)sender;
    
    // Subdetails
    if ([[segue identifier] isEqualToString:@"topicToCourse"])
    {
        JTCourseViewController *courseVC = [segue destinationViewController];
        
        CourseSet* courseSet = (CourseSet*)self.objects[cell.section];
        courseVC.course = courseSet.courses[cell.tag];
    }
    else if ([[segue identifier] isEqualToString:@"topicToCert"]) {
        
        JTCertificateViewController *certVC = [segue destinationViewController];
        
        // Get the userCourseSet
        CourseSet* courseSet = (CourseSet*)self.objects[cell.section];
        
        [self.userCourseSets enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            
            UserCourseSet* userCourseSet = (UserCourseSet*)obj;
            if ([courseSet.categoryType isEqualToString:userCourseSet.categoryType]) {
                certVC.userCourseSet = userCourseSet;
                *stop = YES;
            }
        }];
    }        
}



@end
