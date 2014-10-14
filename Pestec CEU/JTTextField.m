//
//  JTTextField.m
//  PestecCEU
//
//  Created by Admin on 10/14/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import "JTTextField.h"

@implementation JTTextField

- (void) awakeFromNib {
    
//    CGFloat width = 4.0f;
//    
//    self.layer.cornerRadius = 6.0f;
//    self.layer.borderWidth = width;
//    self.layer.borderColor = [[UIColor colorWithWhite:1.0f alpha:0.5f] CGColor];
    
    self.font = [UIFont fontWithName:kMasterRegularFontName size:kJTTextVoewFontSize];
    
    
    CGFloat width = 4.0f;
    
    self.layer.cornerRadius = 6.0f;
    self.layer.borderWidth = width;
    self.layer.borderColor = [[UIColor colorWithWhite:1.0f alpha:0.3f] CGColor];
    CALayer *sub = [CALayer new];
    sub.frame = CGRectInset(self.bounds, width, width);
    sub.backgroundColor = [UIColor whiteColor].CGColor;
    [self.layer addSublayer:sub];

}


@end
