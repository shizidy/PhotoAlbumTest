//
//  PhotoPickerViewController.h
//  PhotoAlbumTest
//
//  Created by wdyzmx on 2019/9/4.
//  Copyright © 2019 wdyzmx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlbumModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface PhotoPickerViewController : UIViewController
@property (nonatomic, strong) AlbumModel *albumModel;
@end

NS_ASSUME_NONNULL_END
