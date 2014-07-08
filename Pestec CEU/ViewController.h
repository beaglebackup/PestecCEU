//
//  ViewController.h
//  Pestec CEU
//
//  Created by Gabriel on 7/6/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

//labels
@property (strong, nonatomic) IBOutlet UILabel *pestecLogoLabel;
@property (strong, nonatomic) IBOutlet UILabel *userLabel;
@property (strong, nonatomic) IBOutlet UILabel *passwordLabel;

//textfields
@property (strong, nonatomic) IBOutlet UITextField *userTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;

//images
@property (strong, nonatomic) IBOutlet UIImageView *logoImage;

//Buttons
@property (strong, nonatomic) IBOutlet UIButton *enterButton;



@end
