//
//  PhotoAlbumCell.h
//  PhotoAlbumTest
//
//  Created by wdyzmx on 2019/9/5.
//  Copyright © 2019 wdyzmx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoModel.h"
#import "AlbumModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PhotoAlbumCell : UITableViewCell
- (void)fillCellWithDataArray:(NSMutableArray *)dataArray indexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
