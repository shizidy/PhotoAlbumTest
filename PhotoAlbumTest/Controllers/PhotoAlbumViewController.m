//
//  PhotoAlbumViewController.m
//  PhotoAlbumTest
//
//  Created by wdyzmx on 2019/9/4.
//  Copyright © 2019 wdyzmx. All rights reserved.
//

#import "PhotoAlbumViewController.h"
#import "PhotoPickerViewController.h"
#import "PhotoAlbumManager.h"
#import "PhotoAlbumCell.h"

@interface PhotoAlbumViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *albumArray;
@end

@implementation PhotoAlbumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.tableView];
    [[PhotoAlbumManager shareInstance] getThumbnailImages:^(NSMutableArray<AlbumModel *> * _Nonnull albumArray) {
        self.albumArray = albumArray;
        [self.tableView reloadData];
    }];
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.albumArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PhotoAlbumCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([PhotoAlbumCell class]) forIndexPath:indexPath];
    [cell fillCellWithDataArray:self.albumArray indexPath:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PhotoPickerViewController *viewController = [[PhotoPickerViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
    viewController.albumModel = self.albumArray[indexPath.row];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        [_tableView registerClass:[PhotoAlbumCell class] forCellReuseIdentifier:NSStringFromClass([PhotoAlbumCell class])];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.tableFooterView = [[UIView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
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
