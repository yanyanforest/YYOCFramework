//
//  CYUITVDSD_base.m
//  KHMall
//
//  Created by 198 on 16/5/21.
//  Copyright © 2016年 198. All rights reserved.
//

#import "CYUITVDSD_base.h"
#import "CYUITVCell_base.h"
#import "CYUITVHeaderFooter_base.h"
@implementation CYUITVDSD_base
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.isForbidEditing = YES;
        self.sectionHeaderHeight = 0;
        self.showSelectedState = NO;
    }
    return self;
}
-(void)setObject:(id)object{
    _object = object;
    
    if (object != nil){
        
    }
    if ( !self.tableView.tableFooterView) {
        self.tableView.tableFooterView = [[UIView alloc]init];
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.object != nil) {
        return [[self.object valueForKey:kTableCellDataSourceId]count];
    }
    return 0;
}
-(id)itemAtIndexPath:(NSIndexPath *)indexPath{
    id item;
    if (self.object) {
        item = [[[self.object valueForKey:kTableCellDataSourceId] objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
        
    }
    return item;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *sectionObject = [[self.object valueForKey:kTableCellDataSourceId] objectAtIndex:section];
    return sectionObject.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellId = self.reusedCellIdentifier;
    if (self.classesIdbyReusedCells.allKeys.count > 1 && self.classesIdbyReusedCells.allKeys.count>indexPath.section) {
        cellId = self.classesIdbyReusedCells.allKeys[indexPath.section];
    }
    CYUITVCell_base *cell = (CYUITVCell_base *)[tableView dequeueReusableCellWithIdentifier:cellId forIndexPath: indexPath];
    [cell setObject:[self itemAtIndexPath:indexPath]];
//    cell.selectionStyle = UITableViewCellSelectionStyleBlue
    
    [self settingsForCell:cell];
    return  cell;
}
- (void)settingsForCell:(CYUITVCell_base *)cell{
    if (self.tableView.separatorStyle != UITableViewCellSeparatorStyleNone) {
        if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
            cell.separatorInset = UIEdgeInsetsZero;
        }
        if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
            cell.layoutMargins = UIEdgeInsetsZero;
        }
        
        if([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
            cell.preservesSuperviewLayoutMargins = false;
            
        }
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    id item = [self itemAtIndexPath:indexPath];

    if (self.block_itemSelected) {
        self.block_itemSelected([self itemAtIndexPath:indexPath]);
    }
    if (self.block_indexPathSelected) {
        self.block_indexPathSelected(indexPath);
    }
    if (self.block_itemAtSelectedIndexPath) {
        self.block_itemAtSelectedIndexPath(item,indexPath);
    }
    if (!self.showSelectedState) {
        [tableView deselectRowAtIndexPath:indexPath animated:false];

    }
 
    
}
#pragma mark - header and footer
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (!self.classesIdBySupplementView) {
        if (tableView.style ==UITableViewStyleGrouped) {
            return [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(tableView.frame), 0.1)];
        } else {
            return nil;
        }
    } else {
        NSString *headerId;
        if (self.classesIdBySupplementView.allKeys.count == 1) {
            headerId = self.classesIdBySupplementView.allKeys[0];
            CYUITVHeaderFooter_base *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerId];
            id item = [self.object valueForKey:kTableSectionDataSourceId];
            header.object = item;
            return header;
        }
    }
    return nil;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (tableView.style == UITableViewStyleGrouped) {
        return [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(tableView.frame), 0.1)];
    } else {
        return nil;
    }
}
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return nil;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return nil;
}
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 0;
//}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (tableView.style == UITableViewStyleGrouped) {
        return 0.1;
    }
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if ([self.object valueForKey:kTableSectionDataSourceId]) {
        return self.sectionHeaderHeight + 0.1;

    } else {
        if( tableView.style == UITableViewStyleGrouped) {
            return self.sectionHeaderHeight + 0.1;
        } else {
            return 0;
            
        }
    }
    return 0;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return !self.isForbidEditing;
}
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.isForbidEditing) {
        return UITableViewCellEditingStyleNone;
    } else {
//        return UITableViewCellEditingStyleDelete|UITableViewCellEditingStyleInsert;
        return UITableViewCellEditingStyleDelete;

    }
}
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.deleteTitle;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (self.block_itemDeleteIndexPath) {
        id item = [self itemAtIndexPath:indexPath];
        self.block_itemDeleteIndexPath(item,indexPath);
    }
}
@end
