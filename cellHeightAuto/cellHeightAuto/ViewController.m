//
//  ViewController.m
//  cellHeightAuto
//
//  Created by Chan on 16/8/16.
//  Copyright © 2016年 Chan. All rights reserved.
//

#import "ViewController.h"
#import "CellModel.h"
#import "CustomCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>{
    UITableView *_tableView;
    NSMutableArray *_data;
    NSMutableArray * _models;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _data = [NSMutableArray arrayWithContentsOfFile:[[NSBundle  mainBundle] pathForResource:@"statuses.plist" ofType:nil]];
    _models = [NSMutableArray new];
    for (NSDictionary *dic in _data) {
        CellModel *model = [CellModel  new];
        [model setValuesForKeysWithDictionary:dic];
        [_models addObject:model];
    }
    [self setUI];
}

#pragma mark - 初始化UI
- (void)setUI {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen  mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height -  64) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

#pragma mark - uitableViewdelegate &datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return  _models.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *kcellID = @"cell";
    CustomCell * cell = [tableView dequeueReusableCellWithIdentifier:kcellID];
    if (!cell) {
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kcellID];
    }
    cell.model = _models[indexPath.section];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CellModel * model = _models [indexPath.section];
    return model.cellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}
@end
