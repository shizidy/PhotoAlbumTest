//
//  AuthorizedStatusManager.h
//  PhotoAlbumTest
//
//  Created by wdyzmx on 2019/9/5.
//  Copyright © 2019 wdyzmx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AuthorizedStatusManager : NSObject

+ (void)checkPhotoStatusWithViewController:(UIViewController *)viewController authorized:(void(^)(void))authorized;

@end

NS_ASSUME_NONNULL_END
