//
//  CellModel.h
//  cellHeightAuto
//
//  Created by Chan on 16/8/16.
//  Copyright © 2016年 Chan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CellModel : NSObject

@property(nonatomic, strong) NSString * text;
@property(nonatomic, strong) NSString *icon;
@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *picture;
@property(nonatomic, getter=isVip) BOOL vip;

@property(nonatomic, assign ) CGFloat cellHeight;

+ (instancetype)CellmodelWithdic:(NSDictionary *)dic;

@end
