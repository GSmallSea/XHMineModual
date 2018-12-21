//
//  XHViewController.m
//  MineModual
//
//  Created by gxiao_hai@163.com on 12/21/2018.
//  Copyright (c) 2018 gxiao_hai@163.com. All rights reserved.
//

#import "XHViewController.h"
#import "userConst.h"

@interface XHViewController ()<UserCenterTableViewDelegate>

@property (nonatomic,strong) UserCenterTableView * tableView;
@property (nonatomic,strong) NSArray *datas;
@property (nonatomic,strong) UserTableViewDataSource *tDataSource;

@end

@implementation XHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tDataSource = [[UserTableViewDataSource alloc] initWithViewModelArray:self.datas configureBlock:^(UserCenterTableViewCell *cell, UserCenterItemViewModel *viewItem) {
        NSLog(@"");
        
        if (viewItem.itemModel.celltype == CellTypeSystemAccessoryNone) {
            [cell configureAccessoryNoneCellWithViewModel:viewItem];
        }else if (viewItem.itemModel.celltype == CellTypeSystemAccessorySwitch) {
            [cell configureAccessorySwitchCellWithViewModel:viewItem];
            viewItem.switchValueDidChangeBlock = ^(BOOL isOn) {
                NSLog(@"%u",isOn);
            };
        }else if (viewItem.itemModel.celltype == CellTypeSystemAccessoryDisclosureIndicator) {
            [cell configureAccessoryDisclosureIndicatorCellWithViewModel:viewItem];
        }else if (viewItem.itemModel.celltype == CellTypeSystemAccessoryTitle){
            [cell configureAccessoryTitleCellWithViewModel:viewItem];
        }else if (viewItem.itemModel.celltype == CellTypeSystemAccessoryLogout){
            [cell configureAccessoryLogoutTableViewCellWithViewModel:viewItem];
        }else{
            [cell configureAccessoryDisclosureIndicatorCellWithViewModel:viewItem];
        }
        
        
    }];
    [self.view addSubview:self.tableView];
	// Do any additional setup after loading the view, typically from a nib.
}

- (UserCenterTableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UserCenterTableView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64) style:UITableViewStyleGrouped];
        _tableView.tdelegate = self;
        _tableView.tDataSource = self.tDataSource;
    }
    return _tableView;
}
- (void)didSelectViewModel:(UserCenterItemViewModel *)viewModel atIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"%@",viewModel.itemModel.funcName);
}


- (NSArray *)datas{
    
    UserCenterItemModel *items = [UserCenterItemModel itemModel];
    items.funcName = @"相册";
    items.funcImage = [UIImage imageNamed:@"MoreSetting"];
    //    items.detailImage = [UIImage imageNamed:@"MoreSetting"];
    items.detailTitle = @"相册";
    
    UserCenterItemViewModel *itemViewModel = [[UserCenterItemViewModel alloc] initWithItem:items];
    itemViewModel.indicatorLeftImageAndLabelGap = 0;
    
    UserCenterItemModel *item2 = [UserCenterItemModel itemModel];
    item2.funcName = @"收藏";
    item2.funcImage = [UIImage imageNamed:@"MoreMyAlbum"];
    UserCenterItemViewModel *itemViewModel2 = [[UserCenterItemViewModel alloc] initWithItem:item2];
    itemViewModel2.bottomViewLeftGap = 0;
    itemViewModel2.isRedDot = YES;
    
    UserCenterSectionModel *section1 = [[UserCenterSectionModel alloc] initWithItemViewModels:@[itemViewModel,itemViewModel2]];
    
    
    UserCenterItemModel *item_1 = [UserCenterItemModel itemModel];
    item_1.funcName = @"收藏";
    item_1.funcImage = [UIImage imageNamed:@"MoreMyAlbum"];
    UserCenterItemViewModel *itemViewModel_1 = [[UserCenterItemViewModel alloc] initWithItem:item_1];
    
    
    UserCenterItemModel *item_2 = [UserCenterItemModel itemModel];
    item_2.funcName = @"扫一扫";
    item_2.funcImage = [UIImage imageNamed:@"MoreMyAlbum"];
    item_2.celltype = CellTypeSystemAccessorySwitch;
    UserCenterItemViewModel *itemViewModel_2 = [[UserCenterItemViewModel alloc] initWithItem:item_2];
    
    
    UserCenterItemModel *item_3 = [UserCenterItemModel itemModel];
    item_3.funcName = @"扫一扫";
    item_3.funcImage = [UIImage imageNamed:@"MoreMyAlbum"];
    item_3.celltype = CellTypeSystemAccessoryTitle;
    item_3.detailTitle = @"扫一扫";
    item_3.detailTextColor = [UIColor lightGrayColor];
    UserCenterItemViewModel *itemViewModel_3 = [[UserCenterItemViewModel alloc] initWithItem:item_3];
    itemViewModel_3.bottomViewLeftGap = 0;
    
    UserCenterItemModel *item_4 = [UserCenterItemModel itemModel];
    item_4.funcName = @"附近";
    item_4.funcImage = [UIImage imageNamed:@"MoreMyAlbum"];
    item_4.detailTitle = @"扫一扫";
    item_4.detailImage = [UIImage imageNamed:@"MoreMyAlbum"];
    item_4.detailTextColor = [UIColor lightGrayColor];
    UserCenterItemViewModel *itemViewModel_4 = [[UserCenterItemViewModel alloc] initWithItem:item_4];
    
    
    UserCenterItemModel *item_5 = [UserCenterItemModel itemModel];
    item_5.funcName = @"附近";
    item_5.funcImage = [UIImage imageNamed:@"MoreMyAlbum"];
    item_5.detailTitle = @"扫一扫";
    item_5.detailImage = [UIImage imageNamed:@"MoreMyAlbum"];
    item_5.detailTextColor = [UIColor lightGrayColor];
    UserCenterItemViewModel *itemViewModel_5 = [[UserCenterItemViewModel alloc] initWithItem:item_5];
    itemViewModel_5.isImageFirst = YES;
    
    
    
    UserCenterItemModel *item_6 = [UserCenterItemModel itemModel];
    item_6.funcName = @"附近";
    item_6.funcImage = [UIImage imageNamed:@"MoreMyAlbum"];
    item_6.detailImage = [UIImage imageNamed:@"MoreMyAlbum"];
    item_6.detailTextColor = [UIColor lightGrayColor];
    UserCenterItemViewModel *itemViewModel_6 = [[UserCenterItemViewModel alloc] initWithItem:item_6];
    itemViewModel_6.bottomViewLeftGap = 0;
    itemViewModel_6.indicatorLeftImageAndLabelGap = 0;
    
    
    UserCenterSectionModel *sections2 = [[UserCenterSectionModel alloc] initWithItemViewModels:@[itemViewModel_1,itemViewModel_2,itemViewModel_3,itemViewModel_4,itemViewModel_5,itemViewModel_6]];
    
    UserCenterItemModel *itemLoyout = [UserCenterItemModel itemModel];
    itemLoyout.celltype = CellTypeSystemAccessoryLogout;
    UserCenterItemViewModel *itemLoyoutViewModel = [[UserCenterItemViewModel alloc] initWithItem:itemLoyout];
    
    UserCenterSectionModel *sections3 = [[UserCenterSectionModel alloc] initWithItemViewModels:@[itemLoyoutViewModel]];
    sections3.sectionHeaderHeight = 30;
    
    return @[section1,sections2,sections3];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
