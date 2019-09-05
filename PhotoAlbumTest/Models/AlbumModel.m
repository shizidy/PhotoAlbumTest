//
//  AlbumModel.m
//  PhotoAlbumTest
//
//  Created by wdyzmx on 2019/9/4.
//  Copyright © 2019 wdyzmx. All rights reserved.
//

#import "AlbumModel.h"

@implementation AlbumModel

-(void)setCollection:(PHAssetCollection *)collection {
    _collection = collection;
    
    if ([collection.localizedTitle isEqualToString:@"All Photos"]) {
        self.collectionTitle = @"全部相册";
    } else if ([collection.localizedTitle isEqualToString:@"Favorites"]) {
        self.collectionTitle = @"个人收藏";
    } else {
        self.collectionTitle = collection.localizedTitle;
    }
        
    // 获得某个相簿中的所有PHAsset对象
    self.assets = [PHAsset fetchAssetsInAssetCollection:collection options:nil];
    
    if (self.assets.count > 0) {
        self.firstAsset = self.assets[0];
    }
    self.collectionNumber = [NSString stringWithFormat:@"%ld", self.assets.count];
}

#pragma mark - Get方法
-(NSMutableArray<NSNumber *> *)selectRows {
    if (!_selectRows) {
        _selectRows = [NSMutableArray array];
    }
    
    return _selectRows;
}
@end
