//
//  CellModel.m
//  cellHeightAuto
//
//  Created by Chan on 16/8/16.
//  Copyright © 2016年 Chan. All rights reserved.
//

#import "CellModel.h"

@implementation CellModel
+ (instancetype)CellmodelWithdic:(NSDictionary *)dic {
    CellModel *model = [self new];
    [model setValuesForKeysWithDictionary:dic];
    return model;
}

@end
