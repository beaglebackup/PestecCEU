//
//  JTSubLabel.m
//  PestecCEU
//
//  Created by Admin on 10/8/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import "JTSubLabel.h"

@implementation JTSubLabel

- (void) awakeFromNib {
    
    self.font = [UIFont fontWithName:kMasterBoldFontName size:kJTSubLabelFontSize];
    self.textColor = [UIColor colorMarineBlue];
    
    [self sizeToFit];

}


@end
