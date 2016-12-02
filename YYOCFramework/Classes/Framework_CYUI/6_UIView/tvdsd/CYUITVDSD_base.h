//
//  CYUITVDSD_base.h
//  KHMall
//
//  Created by 198 on 16/5/21.
//  Copyright © 2016年 198. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CYBlock.h"
#define kTableCellDataSourceId @"content"
#define kTableSectionDataSourceId @"header"
#define kTableSectionSystemTitleDataSourceId @"headerTitle"//系统显示的titles

typedef enum CYTableViewCellSelectionType{
    CYTableViewCell_SelectionTypeNone,
    CYTableViewCell_SelectionTypeSingleSelection,
    CYTableViewCell_SelectionTypeMultipleSelection
}CYTableViewCell_SelectionType;
@interface CYUITVDSD_base : NSObject<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)CYBlock_Object block_itemSelected;
@property(nonatomic,strong)CYBlock_Object block_indexPathSelected;
@property(nonatomic,strong)CYBlock_ObjectIndexpath block_itemAtSelectedIndexPath;
@property(nonatomic,strong)CYBlock_ObjectIndexpath block_itemDeleteIndexPath;
@property(nonatomic,strong)NSString *deleteTitle;//删除的文字
@property(nonatomic,strong)NSDictionary *classesIdbyReusedCells;
@property(nonatomic,strong)NSString *reusedCellIdentifier;
@property(nonatomic,strong)id object;//tableView的数据[content:[[]]]
@property(nonatomic,assign)CYTableViewCell_SelectionType selectionType;//cell的单选或者多选
@property(nonatomic,strong)NSArray *defaultSelected;
@property(nonatomic,strong)NSArray *defaultSelectedObject;
@property(nonatomic,assign)BOOL showSelectedState;
@property(nonatomic,assign)BOOL isForbidEditing;//是否禁止编辑
@property(nonatomic,strong)NSDictionary *classesIdBySupplementView;
@property(nonatomic,assign)CGFloat sectionHeaderHeight;
@end
