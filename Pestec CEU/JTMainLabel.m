//
//  JTMainLabel.m
//  PestecCEU
//
//  Created by Admin on 10/8/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import "JTMainLabel.h"

@implementation JTMainLabel

- (void) awakeFromNib {
    
    self.font = [UIFont fontWithName:kMasterBoldFontName size:kJTMainButtonFontSize];
    self.textColor = [UIColor colorMarineBlue];
    
    [self sizeToFit];
}


@end
