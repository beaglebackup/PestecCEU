//
//  JTTopicBaseViewController.h
//  PestecCEU
//
//  Created by Admin on 8/27/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface JTTopicBaseViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (assign) JTWorkerTypeIndex workerType;

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray* objects;


- (void) loadObjects;


@end
