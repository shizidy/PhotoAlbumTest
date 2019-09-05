//
//  PhotoAlbumCell.m
//  PhotoAlbumTest
//
//  Created by wdyzmx on 2019/9/5.
//  Copyright © 2019 wdyzmx. All rights reserved.
//

#import "PhotoAlbumCell.h"

@interface PhotoAlbumCell ()
@property (nonatomic, strong) UIImageView *iconImgView;
@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation PhotoAlbumCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setSubviews];
        [self setSubviewsConstraints];
    }
    return self;
}

- (void)setSubviews {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    _iconImgView = [[UIImageView alloc] init];
    [self.contentView addSubview:_iconImgView];
    _iconImgView.contentMode = UIViewContentModeScaleAspectFill;
    _iconImgView.layer.masksToBounds = YES;
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    _titleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_titleLabel];
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.font = [UIFont systemFontOfSize:16];
}

- (void)setSubviewsConstraints {
    _iconImgView.frame = CGRectMake(0, 0, 80, 80);
    _titleLabel.frame = CGRectMake(CGRectGetMaxX(_iconImgView.frame) + 10, 0, 100, 80);
}

- (void)fillCellWithDataArray:(NSMutableArray *)dataArray indexPath:(nonnull NSIndexPath *)indexPath {
    AlbumModel *model = dataArray[indexPath.row];
    _titleLabel.text = model.collectionTitle;
    
    PhotoModel *model2 = [[PhotoModel alloc] init];
    __weak typeof(PhotoModel *)weakModel2 = model2;
    weakModel2.asset = model.firstAsset;
    weakModel2.getIconImageAction = ^{
        self.iconImgView.image = weakModel2.iconImage;
    };
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
