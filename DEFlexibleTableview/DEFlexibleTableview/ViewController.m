//
//  ViewController.m
//  DEFlexibleTableview
//
//  Created by Decade on 15/12/17.
//  Copyright © 2015年 decade. All rights reserved.
//

#import "ViewController.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGH [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, assign) NSInteger selectCellindex;
@property (nonatomic, assign) BOOL isFlex;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *myTableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGH) style:UITableViewStylePlain];
    myTableview.separatorColor = [UIColor clearColor];
    myTableview.delegate = self;
    myTableview.dataSource = self;
    [self.view addSubview:myTableview];
}

#pragma mark -
#pragma mark -------------------- UITableView DataSource ---------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.selectCellindex && self.selectCellindex == indexPath.row) {
        return 155;
    }else{
        return 55;
    }
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuseIdentifier"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor colorWithRed:0.06 * indexPath.row green:0.04 * indexPath.row blue:0.07 * indexPath.row alpha:1];
    cell.textLabel.text = [NSString stringWithFormat:@"Cell%li", indexPath.row];
    cell.textLabel.textColor = [UIColor yellowColor];
    return cell;
}

#pragma mark -
#pragma mark -------------------- UITableView Delegate ---------------------

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@">>>%li", indexPath.row);
    if (self.selectCellindex == indexPath.row) {
        self.selectCellindex = 0;
    }else{
        self.selectCellindex = indexPath.row;
    }
    NSIndexPath *theSelectindexpath = [NSIndexPath indexPathForRow:self.selectCellindex inSection:0];
    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:theSelectindexpath] withRowAnimation:UITableViewRowAnimationNone];
}

@end
