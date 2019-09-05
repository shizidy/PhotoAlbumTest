//
//  PhotoPickerViewController.m
//  PhotoAlbumTest
//
//  Created by wdyzmx on 2019/9/4.
//  Copyright © 2019 wdyzmx. All rights reserved.
//

#import "PhotoPickerViewController.h"
#import "ImagePickerCell.h"

@interface PhotoPickerViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *photoArray;
@end

@implementation PhotoPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    // Do any additional setup after loading the view.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.photoArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ImagePickerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([ImagePickerCell class]) forIndexPath:indexPath];
    [cell fillCellWithDataArray:self.photoArray indexPath:indexPath];
    return cell;
}

-(UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.minimumLineSpacing = 1;
        layout.minimumInteritemSpacing = 1;
        layout.itemSize = CGSizeMake(([UIScreen mainScreen].bounds.size.width - 3)/4, ([UIScreen mainScreen].bounds.size.width - 3)/4);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.scrollEnabled = YES;
        _collectionView.alwaysBounceVertical = YES;
        
        [_collectionView registerClass:[ImagePickerCell class] forCellWithReuseIdentifier:NSStringFromClass([ImagePickerCell class])];
        
    }
    
    return _collectionView;
}

- (void)setAlbumModel:(AlbumModel *)albumModel {
    _albumModel = albumModel;
    self.photoArray = [NSMutableArray array];
    for (PHAsset *asset in albumModel.assets) {
        [self.photoArray addObject:asset];
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
