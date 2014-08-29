//
//  ApplicatorsCoursesCompletedViewController.h
//  Pestec CEU
//
//  Created by Gabriel on 7/6/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JTCompletedCoursesController : UIViewController

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray* objects;

- (void) loadObjects;

@end
