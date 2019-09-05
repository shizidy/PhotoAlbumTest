//
//  ViewController.m
//  PhotoAlbumTest
//
//  Created by wdyzmx on 2019/9/4.
//  Copyright © 2019 wdyzmx. All rights reserved.
//

#import "ViewController.h"
#import "AuthorizedStatusManager.h"
#import "PhotoAlbumViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 100/2, 200, 100, 50);
    [self.view addSubview:button];
    [button setTitle:@"相册" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    button2.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 100/2, 200 + 100, 100, 50);
    [self.view addSubview:button2];
    [button2 setTitle:@"相机" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(buttonAction2:) forControlEvents:UIControlEventTouchUpInside];
    
    // Do any additional setup after loading the view.
}

- (void)buttonAction:(UIButton *)btn {
    [AuthorizedStatusManager checkPhotoStatusWithViewController:self authorized:^{
        PhotoAlbumViewController *viewController = [[PhotoAlbumViewController alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
        [self presentViewController:nav animated:YES completion:nil];
    }];
}

- (void)buttonAction2:(UIButton *)btn {
    
}




@end
