//
//  Type.h
//  JackOfTrades
//
//  Created by Admin on 7/7/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface User : PFUser <PFSubclassing>


@property (retain) NSString *firstName;
@property (retain) NSString *lastName;
@property (retain) NSString *license;
@property (retain) NSString *position;
@property (retain) NSArray *courses;




+ (NSString *)firstNameKey;
+ (NSString *)lastNameKey;
+ (NSString *)licenseKey;
+ (NSString *)positionKey;
+ (NSString *)coursesKey;



@end
