//
//  ViewController.h
//  ImageChanger
//
//  Created by wangwei on 14/12/22.
//  Copyright (c) 2014年 example. All rights reserved.
//

#import <UIKit/UIKit.h>

#define CHANGE_BUTTON_HEIGHT 50
#define IMAGE_VIEW_MARGIN 10
#define IMAGE_VIEW_HEIGHT 300

@interface ViewController : UIViewController

@property UIView *contentView;
@property UIImageView *imageView;
@property UIButton *changeButton;
@property (assign) BOOL isActive;

- (void)changeImage:(id)sender;

@end

