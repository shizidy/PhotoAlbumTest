//
//  PhotoModel.h
//  PhotoAlbumTest
//
//  Created by wdyzmx on 2019/9/4.
//  Copyright © 2019 wdyzmx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Photos/Photos.h>

NS_ASSUME_NONNULL_BEGIN
@interface PhotoModel : NSObject
@property (nonatomic, strong) PHAsset *asset;
@property (nonatomic, strong) UIImage *highDefinitionImage;
@property (nonatomic, strong) UIImage *iconImage;
@property (nonatomic, copy) void(^getHighDefinitionImageAction)(void);
@property (nonatomic, copy) void(^getIconImageAction)(void);
@end

NS_ASSUME_NONNULL_END
