//
//  PhotoModel.m
//  PhotoAlbumTest
//
//  Created by wdyzmx on 2019/9/4.
//  Copyright © 2019 wdyzmx. All rights reserved.
//

#import "PhotoModel.h"

@implementation PhotoModel
- (void)setAsset:(PHAsset *)asset {
    _asset = asset;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        PHImageRequestOptions *options = [[PHImageRequestOptions alloc] init];
        //同步获取图片，只会返回一张
        options.synchronous = YES;
        options.deliveryMode = PHImageRequestOptionsDeliveryModeOpportunistic;
        options.resizeMode = PHImageRequestOptionsResizeModeFast;
        //获取原图
        [[PHCachingImageManager defaultManager] requestImageForAsset:asset targetSize:PHImageManagerMaximumSize contentMode:PHImageContentModeDefault options:options resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
            self.highDefinitionImage = result;
            dispatch_async(dispatch_get_main_queue(), ^{
                if (self.getHighDefinitionImageAction) {
                    self.getHighDefinitionImageAction();
                }
            });
        }];
        
        PHImageRequestOptions *options2 = [[PHImageRequestOptions alloc] init];
        options2.synchronous = YES;
        CGFloat imageWidth = 80;
        [[PHCachingImageManager defaultManager] requestImageForAsset:asset targetSize:CGSizeMake(imageWidth * [UIScreen mainScreen].scale, imageWidth * [UIScreen mainScreen].scale) contentMode:PHImageContentModeDefault options:options2 resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
            self.iconImage = result;
            dispatch_async(dispatch_get_main_queue(), ^{
                if (self.getIconImageAction) {
                    self.getIconImageAction();
                }
            });
        }];
    });
}
@end
