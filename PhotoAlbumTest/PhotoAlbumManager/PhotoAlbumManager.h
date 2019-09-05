//
//  PhotoAlbumManager.h
//  PhotoAlbumTest
//
//  Created by wdyzmx on 2019/9/4.
//  Copyright © 2019 wdyzmx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PhotoModel.h"
#import "AlbumModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PhotoAlbumManager : NSObject
@property (nonatomic, strong) NSMutableArray *assetCollectionList;

+ (instancetype)shareInstance;

-(void)getThumbnailImages:(void(^)(NSMutableArray<AlbumModel *> *albumArray))albumArray;
@end

NS_ASSUME_NONNULL_END
