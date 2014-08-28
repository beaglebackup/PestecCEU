//
//  JTTopicButton.h
//  PestecCEU
//
//  Created by Admin on 8/27/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JTTopicButtonDelegate;


@interface JTTopicButton : UIButton

/*! @name Delegate */
@property (nonatomic, strong) id<JTTopicButtonDelegate> delegate;


@end

@protocol JTTopicButtonDelegate <NSObject>

@required

- (void)didTapTopicButton:(JTTopicButton *)button;

@end
