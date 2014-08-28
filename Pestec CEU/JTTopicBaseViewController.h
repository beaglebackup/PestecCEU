//
//  JTTopicBaseViewController.h
//  PestecCEU
//
//  Created by Admin on 8/27/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JTTopicButton.h"


@interface JTTopicBaseViewController : UIViewController <JTTopicButtonDelegate>

@property (nonatomic, strong) NSString* workerType;

@end
