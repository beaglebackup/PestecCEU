//
//  JTBaseViewController.m
//  PestecCEU
//
//  Created by Admin on 10/8/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import "JTBaseViewController.h"

@implementation JTBaseViewController

- (void)awakeFromNib {
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:kJTBackgroundImage]]];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    self.transparentBGView = [[UIView alloc] initWithFrame:screenRect];
    self.transparentBGView.backgroundColor = [UIColor colorWithWhite:1.0f alpha:0.7f];
    [self.view addSubview:self.transparentBGView];
    [self.view sendSubviewToBack:self.transparentBGView];
    
}

@end
