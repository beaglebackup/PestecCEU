//
//  JTQuizViewController.m
//  PestecCEU
//
//  Created by Admin on 8/28/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import "JTQuizViewController.h"
#import "JTQuizAnswerTableViewCell.h"
#import "QuizQuestion.h"
#import "QuizAnswer.h"
#import "JGProgressHUD.h"
#import "JTCourseManager.h"


@interface JTQuizViewController ()

@property (nonatomic, strong) JGProgressHUD* progressHUD;

@property (nonatomic, strong) NSArray* objects;
@property (nonatomic, strong) NSMutableArray* selectedAnswers;

@property (nonatomic, strong) NSMutableArray* gradedAnswers;

@property (assign) BOOL highlightUnanswered;

@end

@implementation JTQuizViewController

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
    
    // Set state
    _highlightUnanswered = NO;
    
    // Nav title
    self.title = [NSString stringWithFormat:@"%@ Quiz",self.course.name];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self loadObjects];
    
}

- (NSMutableArray*) selectedAnswers {
    if (!_selectedAnswers) {
        _selectedAnswers = [[NSMutableArray alloc] initWithCapacity:_objects.count];
        for (int i = 0; i < _objects.count; i++ )
        {
            _selectedAnswers[i] = [NSNull null];
        }
    }
    return _selectedAnswers;
}


- (NSMutableArray*) gradedAnswers {
    if (!_gradedAnswers) {
        _gradedAnswers = [[NSMutableArray alloc] initWithCapacity:_objects.count];
        for (int i = 0; i < _objects.count; i++ )
        {
            _gradedAnswers[i] = [NSNull null];
        }
    }
    return _gradedAnswers;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Data
- (void) loadObjects {
    
    
    // Get the course object
    [JTDatabaseManager queryForQuizQuestions:self.course withCallback:^(NSArray *quizQuestions, NSError *error) {
        if (error) {
            NSLog(@"error = %@",error);
            return;
        }
        
        self.objects = quizQuestions;
        
        NSLog(@"self.objects = %@",self.objects);
        
        [self objectsDidLoad];

    }];
    
}


- (void) objectsDidLoad {
    
    
    [self.tableView reloadData];
    
}


#pragma mark - UITableView Delegate & Datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.objects.count;
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section {
    
    QuizQuestion* quizQuestion = (QuizQuestion*)self.objects[section];
    
    return quizQuestion.answerObjects.count;
}



- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"quizAnswerCell";
    
    JTQuizAnswerTableViewCell *cell = (JTQuizAnswerTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[JTQuizAnswerTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    QuizQuestion* quizQuestion = (QuizQuestion*)self.objects[indexPath.section];
    QuizAnswer* quizAnswer = quizQuestion.answerObjects[indexPath.row];
    
    
    cell.textLabel.text = quizAnswer.text;
    cell.answerObjectId = quizAnswer.objectId;
  
    // Set defaults
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.textLabel.textColor = [UIColor blackColor];
    
    
    // Check if it's selected, and if there is a selection, mark the selected cell
    NSString* selectedAnswerId = self.selectedAnswers[indexPath.section];

     if (![selectedAnswerId isEqual:[NSNull null]] && [selectedAnswerId isEqualToString:quizAnswer.objectId]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        cell.textLabel.textColor = [UIColor blueColor];
    }
    
  
    
    return cell;
}

- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JTQuizAnswerTableViewCell* cell = (JTQuizAnswerTableViewCell*)[aTableView cellForRowAtIndexPath:indexPath];
    
    // Set it in the caching array
    [self.selectedAnswers replaceObjectAtIndex:indexPath.section withObject:cell.answerObjectId];
    
    [self.tableView reloadData];
    
}



- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    static NSString *CellIdentifier = @"quizQuestionSectionCell";
    UITableViewCell *headerView = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (headerView == nil){
        [NSException raise:@"headerView == nil.." format:@"No cells with matching CellIdentifier loaded from your storyboard"];
    }
    
    QuizQuestion* quizQuestion = (QuizQuestion*)self.objects[section];
    
    headerView.textLabel.text = quizQuestion.text;
    headerView.textLabel.textColor = [UIColor blackColor];
    
    
    // Highlight unanswered questions if flagged
    NSString* selectedAnswerId = self.selectedAnswers[section];

    if (_highlightUnanswered && [selectedAnswerId isEqual:[NSNull null]]) {
        headerView.textLabel.textColor = [UIColor redColor];
    }


    return headerView;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return heightForSectionHeader;
}


#pragma mark - UIAlertView Delegate
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 0) {
        _highlightUnanswered = YES;
        [self.tableView reloadData];
    }
}


#pragma mark - Buttons

- (IBAction)didTapSubmitButton:(id)sender {

    self.progressHUD = [JGProgressHUD progressHUDWithStyle:JGProgressHUDStyleLight];
    self.progressHUD.textLabel.text = @"Grading Course";
    [self.progressHUD showInView:self.view];
    
    
    // Reset flag
    _highlightUnanswered = NO;
    
    
    
    // Check if all questions are answered
    __block BOOL shouldGrade = YES;
    
    NSLog(@"self.selectedAnswers = %@",self.selectedAnswers);

    [self.selectedAnswers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        if ([obj isEqual:[NSNull null]]) {
            
            // Show alert if userCourse.status is not yet read
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Wait!" message:@"You have not answered all the questions!" delegate:self cancelButtonTitle:@"Highlight Unanswered" otherButtonTitles:nil];
            [alertView show];
            
            shouldGrade = NO;
            
            *stop = YES;
            
            [self.progressHUD dismiss];
        }
    }];
    
    
    if (!shouldGrade) {
        return;
    }
    
    
    // Check answers if everything checked out above
    __block NSInteger gotCorrect = 0;
    
    [self.selectedAnswers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        // Get correct answer
        QuizQuestion* questionObject = self.objects[idx];
        NSArray* answerObjects = questionObject.answerObjects;
        __block NSString* correctAnswerId;
        [answerObjects enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            
            QuizAnswer* answer = (QuizAnswer*)obj;
            if (answer.isAnswer) {
                
                correctAnswerId = answer.objectId;
                *stop = YES;
            }
        }];
        
        NSString* selectedAnswerId = (NSString*)obj;
        
    
        // Compare answers
        if ([selectedAnswerId isEqualToString:correctAnswerId]) {
            [self.gradedAnswers replaceObjectAtIndex:idx withObject:[NSNumber numberWithBool:YES]];

            gotCorrect++;
        }
        else {
            [self.gradedAnswers replaceObjectAtIndex:idx withObject:[NSNumber numberWithBool:NO]];
        }
        
    }];
    
    [self.progressHUD dismiss];

    
    // Check if passed
    NSInteger numToPass = [self.course.numPassed integerValue];
    
    if (gotCorrect >= numToPass) {
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"You Passed!" message:[NSString stringWithFormat:@"You got %d correct out of %d", gotCorrect, self.objects.count] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
        
        
        // Save to db
        UserCourse* userCourse = [[JTCourseManager shared] userCourse];
        userCourse.status = [NSNumber numberWithInt:JTCourseStatusCompleted];
        
        JTDatabaseManager* databaseManager = [[JTDatabaseManager alloc] init];
        [databaseManager update:userCourse withCallback:^(BOOL succeeded, NSError *error) {
            
            if (error) {
                NSLog(@"error = %@",error);
                
                // FIXME: NEED TO STORE TO USER DEFAULTS AND SAVE LATER
            }
            
        }];
        
    }
    else {
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Your Didn't Pass" message:[NSString stringWithFormat:@"You got %d correct out of %d", gotCorrect, self.objects.count] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
    
}


@end
