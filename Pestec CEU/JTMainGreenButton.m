//
//  JTMainGreenButton.m
//  PestecCEU
//
//  Created by Admin on 10/8/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import "JTMainGreenButton.h"
#import <QuartzCore/QuartzCore.h>

@implementation JTMainGreenButton

- (void) awakeFromNib {
    
    [super awakeFromNib];
    
    CGFloat width = 4.0f;
    
    self.layer.cornerRadius = 6.0f;
    self.layer.borderWidth = width;
    self.layer.borderColor = [[UIColor colorWithWhite:1.0f alpha:0.3f] CGColor];
    CALayer *sub = [CALayer new];
    sub.frame = CGRectInset(self.bounds, width, width);
    sub.backgroundColor = [UIColor colorLimeGreen].CGColor;
    [self.layer addSublayer:sub];
    
    self.titleLabel.font = [UIFont fontWithName:kMasterDemiBoldFontName size:kJTMainButtonFontSize];
    self.titleLabel.textColor = [UIColor whiteColor];

    
}

@end
