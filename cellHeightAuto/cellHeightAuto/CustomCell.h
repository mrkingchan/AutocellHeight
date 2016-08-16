//
//  CustomCell.h
//  cellHeightAuto
//
//  Created by Chan on 16/8/16.
//  Copyright © 2016年 Chan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellModel.h"
@interface CustomCell : UITableViewCell
@property(nonatomic, strong) UIImageView *iconView;
@property(nonatomic, strong) UILabel *nameLabel;
@property(nonatomic, strong) UILabel *contentLabel;
@property(nonatomic, strong) UIImageView *pictureView;
@property(nonatomic, strong) UIImageView *vipView;
@property(nonatomic, strong) CellModel *model;

@end
