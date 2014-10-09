//
//  JTTextView.m
//  PestecCEU
//
//  Created by Admin on 10/8/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import "JTTextView.h"
#import <QuartzCore/QuartzCore.h>

@implementation JTTextView

- (void) awakeFromNib {
    
    CGFloat width = 4.0f;
    
    self.layer.cornerRadius = 6.0f;
    self.layer.borderWidth = width;
    self.layer.borderColor = [[UIColor colorWithWhite:1.0f alpha:0.5f] CGColor];
    
    self.font = [UIFont fontWithName:kMasterRegularFontName size:kJTTextVoewFontSize];
    
    
    [self sizeToFit];

}

@end
