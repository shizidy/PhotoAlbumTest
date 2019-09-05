//
//  ImagePickerCell.h
//  PhotoAlbumTest
//
//  Created by wdyzmx on 2019/9/5.
//  Copyright © 2019 wdyzmx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImagePickerCell : UICollectionViewCell
- (void)fillCellWithDataArray:(NSMutableArray *)dataArray indexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
