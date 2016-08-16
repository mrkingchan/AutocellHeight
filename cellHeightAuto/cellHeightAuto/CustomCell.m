//
//  CustomCell.m
//  cellHeightAuto
//
//  Created by Chan on 16/8/16.
//  Copyright © 2016年 Chan. All rights reserved.
//

#import "CustomCell.h"
#import <Masonry.h>

@implementation CustomCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _iconView = [UIImageView  new];
        _iconView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_iconView];
        
        _nameLabel = [UILabel new];
        [self.contentView addSubview:_nameLabel];
        
        _vipView = [UIImageView new];
        [self.contentView addSubview:_vipView];
        
        _contentLabel = [UILabel new];
        _contentLabel.numberOfLines = 0;
        [self.contentView addSubview:_contentLabel];
        
        _pictureView = [UIImageView new];
        [self.contentView addSubview:_pictureView];
        [self setUI];
    }
    return  self;
}

- (void)setUI {
    //自动布局
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(10);
        make.width.equalTo(@(40));
        make.height.equalTo(@(40));
        make.top.equalTo(self.contentView.mas_top).with.offset(10);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iconView.mas_right).with.offset(10);
        make.top.equalTo(self.contentView.mas_top).with.offset(10);
        make.width.equalTo(@(100));
        make.height.equalTo(@(30));
    }];
    _nameLabel.font = [UIFont systemFontOfSize:10];
    
    [_vipView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLabel.mas_right).with.offset(10);
        make.top.equalTo(self.contentView.mas_top).with.offset(10);
        make.height.equalTo(@(13));
        make.width.equalTo(@(13));
    }];
    
    //_contentLabel暂时先不给定高度，根据内容来调整高度
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(10);
        make.right.equalTo(self.contentView.mas_right).with.offset(-10);
        make.top.equalTo(_iconView.mas_bottom).with.offset(10);
    }];
    _contentLabel.font = [UIFont systemFontOfSize:11];
    [_pictureView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(10);
        make.width.equalTo(@(80));
        make.height.equalTo(@(80));
        make.top.equalTo(_contentLabel.mas_bottom).with.offset(20);
    }];
}


- (void)setModel:(CellModel *)model {
    _model = model;
    _iconView.image = [UIImage imageNamed:model.icon];
    _nameLabel.text = model.name;
    if (model.isVip) {
        _vipView.image = [UIImage imageNamed:@"vip"];
        _vipView.hidden = NO;
    }else {
        _vipView.hidden = YES;
    }
    _contentLabel.text = model.text;
    UIFont *font = [UIFont systemFontOfSize:11];
    CGFloat contentLabelHeight = [self sizeWithText:model.text font:font maxW:self.contentView.frame.size.width - 20].height;
    if (model.picture) {
        _pictureView.hidden = NO;
        _pictureView.image = [UIImage imageNamed:model.picture];
    }else {
        _pictureView.hidden = YES;
    }
    //强制布局 下，这句代码非常重要不可缺少
    [self layoutIfNeeded];
    if (model.picture) {
        model.cellHeight = CGRectGetMaxY(_pictureView.frame) +10;
    }else {
        model.cellHeight = CGRectGetMaxY(_contentLabel.frame) +10;
    }
}

- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxW:(CGFloat)maxW
{
    NSMutableDictionary *attrs=[NSMutableDictionary dictionary];
    attrs[NSFontAttributeName]=font;
    
    CGSize maxSize=CGSizeMake(maxW, MAXFLOAT);
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}
@end
