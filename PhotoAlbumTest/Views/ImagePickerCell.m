//
//  ImagePickerCell.m
//  PhotoAlbumTest
//
//  Created by wdyzmx on 2019/9/5.
//  Copyright © 2019 wdyzmx. All rights reserved.
//

#import "ImagePickerCell.h"
#define kScreenWidth  [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height

@interface ImagePickerCell ()
@property (nonatomic, strong) UIImageView *iconImgView;
@end

@implementation ImagePickerCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.iconImgView];
    }
    return self;
}

- (void)fillCellWithDataArray:(NSMutableArray *)dataArray indexPath:(NSIndexPath *)indexPath {
    PHImageRequestOptions *options = [[PHImageRequestOptions alloc] init];
    options.synchronous = YES;
    CGFloat imageWidth = ([UIScreen mainScreen].bounds.size.width - 3) / 4;
    [[PHCachingImageManager defaultManager] requestImageForAsset:dataArray[indexPath.item] targetSize:CGSizeMake(imageWidth * [UIScreen mainScreen].scale, imageWidth * [UIScreen mainScreen].scale) contentMode:PHImageContentModeDefault options:options resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
        self.iconImgView.image = result;
    }];
}

-(UIImageView *)iconImgView {
    if (!_iconImgView) {
        _iconImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, (kScreenWidth - 3) / 4, (kScreenWidth - 3) / 4)];
        _iconImgView.contentMode = UIViewContentModeScaleAspectFill;
        _iconImgView.layer.masksToBounds = YES;
    }
    return _iconImgView;
}

@end
