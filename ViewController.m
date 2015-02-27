//
//  ViewController.m
//  ImageChanger
//
//  Created by wangwei on 14/12/22.
//  Copyright (c) 2014年 example. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //contentView
    CGFloat contentViewY = [self getContentViewYCoordinate];
    self.contentView = [[UIView alloc] initWithFrame:CGRectMake(0, contentViewY, self.view.bounds.size.width, self.view.bounds.size.height - contentViewY)];
    [self.view addSubview:self.contentView];
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    //changeButton
    self.changeButton = [[UIButton alloc] initWithFrame:CGRectMake(0, [self getChangeButtonYCoordinate], self.view.bounds.size.width, CHANGE_BUTTON_HEIGHT)];
    [self.contentView addSubview:self.changeButton];
    self.changeButton.backgroundColor = [UIColor greenColor];
    [self.changeButton setTitle:@"更换图片" forState:UIControlStateNormal];
    [self.changeButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [self.changeButton addTarget:self action:@selector(changeImage:) forControlEvents:UIControlEventTouchDown];
    
    //imageView
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(IMAGE_VIEW_MARGIN, (self.contentView.bounds.size.height - CHANGE_BUTTON_HEIGHT - IMAGE_VIEW_HEIGHT) / 2, self.contentView.bounds.size.width - IMAGE_VIEW_MARGIN * 2, IMAGE_VIEW_HEIGHT)];
    [self.contentView addSubview:self.imageView];
    self.imageView.backgroundColor = [UIColor clearColor];
    [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)getContentViewYCoordinate {
    CGRect statusRect = [[UIApplication sharedApplication] statusBarFrame];
    CGFloat navigationBarHeight = 0;
    
    // 如果存在导航栏
    if (!self.navigationController.navigationBarHidden) {
        CGRect navigationBarRect = [[[self navigationController] navigationBar] bounds];
        navigationBarHeight = navigationBarRect.size.height;
    }
    
    return (statusRect.size.height + navigationBarHeight);
}

- (CGFloat)getChangeButtonYCoordinate {
    CGRect contentViewRect = [self.contentView bounds];
    return contentViewRect.size.height - CHANGE_BUTTON_HEIGHT;
}

- (void)changeImage:(id)sender {
    if (self.isActive) {
        self.imageView.image = [UIImage imageNamed:@"1"];
    } else {
        self.imageView.image = [UIImage imageNamed:@"2"];
//        NSArray *searchPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//        
//        NSString *documentFolderPath;
//        if ([searchPath count] > 0) {
//            documentFolderPath = [searchPath objectAtIndex:0];
//        } else {
//            documentFolderPath = @"";
//        }
//        NSUInteger strlen = [documentFolderPath length];
//        if ([documentFolderPath characterAtIndex:strlen - 1] != '/') {
//            documentFolderPath = [documentFolderPath stringByAppendingString:@"/"];
//        }
//        
//        NSString *localFilePath = [documentFolderPath stringByAppendingString:@"download.png"];
//        //NSLog(@"++++++%@", localFilePath);
//        self.imageView.image = [UIImage imageWithContentsOfFile:localFilePath];
//        if (self.imageView.image == nil) {
//            NSLog(@"then download.png file does not exist!");
//        }
    }
    
    self.isActive = !self.isActive;
}

@end
