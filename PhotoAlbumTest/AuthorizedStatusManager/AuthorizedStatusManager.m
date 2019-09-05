//
//  AuthorizedStatusManager.m
//  PhotoAlbumTest
//
//  Created by wdyzmx on 2019/9/5.
//  Copyright © 2019 wdyzmx. All rights reserved.
//

#import "AuthorizedStatusManager.h"
#import <Photos/Photos.h>

@implementation AuthorizedStatusManager

+ (void)checkPhotoStatusWithViewController:(id)viewController authorized:(void (^)(void))authorized {
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (status == PHAuthorizationStatusAuthorized) {
                authorized();
            } else {
                UIAlertController *alertViewController = [UIAlertController alertControllerWithTitle:@"访问相册" message:@"您还没有打开相册权限" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"去打开" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                    if ([[UIApplication sharedApplication] canOpenURL:url]) {
                        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
                            //
                        }];
                    }
                }];
                UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                    NSLog(@"点击了取消");
                }];
                
                [alertViewController addAction:action1];
                [alertViewController addAction:action2];
                //相当于之前的[actionSheet show];
                [viewController presentViewController:alertViewController animated:YES completion:nil];
            }
        });
    }];
}


@end
