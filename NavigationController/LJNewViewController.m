//
//  LJNewViewController.m
//  NavigationController
//
//  Created by James on 16/3/26.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "LJNewViewController.h"
#import "YYWebImage.h"
#import "UINavigation+Extension/UINavigationController+Extension.h"
#import "UIView+Extension/UIView+Extension.h"
@interface LJNewViewController ()<UITableViewDelegate, UITableViewDataSource>


@end

@implementation LJNewViewController {
    UIView                   *_headerView;
    UIImageView              *_imageView;
    UIStatusBarStyle          _barStyle;
}

#define kHeaderViewHeight 200
//可重用cell标示
static NSString *tableViewCellID = @"tableViewCellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置view的背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 禁止调整顶部缩进
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //调用prepareTableView
    [self prepareTableView];
    //抵用prepareHeaderView
    [self prepareHeaderView];
    
}
/**
 *  准备tableView
 */
- (void)prepareTableView {
    UITableView *tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];

    //设置tableView的代理,数据源
    tableView.delegate = self;
    tableView.dataSource = self;
    //注册cell!!!
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:tableViewCellID];
    
    //设置tableView的表格向下偏移和滚动条的向下偏移
    tableView.contentInset = UIEdgeInsetsMake(kHeaderViewHeight, 0, 0, 0);
    tableView.scrollIndicatorInsets = tableView.contentInset;
    
    [self.view addSubview:tableView];
}
/**
 *  准备HeaderView
 */
- (void)prepareHeaderView {
    _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, kHeaderViewHeight)];
    _headerView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:_headerView];
    
    _imageView = [[UIImageView alloc]initWithFrame:_headerView.bounds];
    _imageView.backgroundColor = [UIColor blueColor];
    //设置imageView拉伸模式为等比例拉伸
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    //剪裁多余的拉伸图片,不设置将非常难看
    _imageView.clipsToBounds = YES;
    
    //图片url
    NSURL *url = [NSURL URLWithString:@"http://www.who.int/entity/campaigns/immunization-week/2015/large-web-banner.jpg?ua=1"];
    
    //加载图片并设置
    [_imageView yy_setImageWithURL:url options: YYWebImageOptionShowNetworkActivity];
    [_headerView addSubview: _imageView];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return _barStyle;
}

#pragma mark - scrollViewDelegate
//滑动时,会持续调用这个方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    //找到临界值,便于判断上拉移动 下拉放大
    CGFloat offSet = scrollView.contentOffset.y + scrollView.contentInset.top;
    
    NSLog(@"%f",offSet);
    

    if (offSet <= 0) {   //下拉放大
        _headerView.lj_y = 0;
        _headerView.lj_height = -scrollView.contentOffset.y;
        _imageView.alpha = 1;
    }else {  //上拉移动
        //固定高度
        _headerView.lj_height = kHeaderViewHeight;
        
        //移动顶部视图
        CGFloat min = kHeaderViewHeight - 64;
        _headerView.lj_y = - MIN(min, offSet);
        
        //透明度处理
        CGFloat progress = offSet / min;
        _imageView.alpha = 1 - progress;
        
        //设置状态栏颜色
        _barStyle = (_imageView.alpha < 0.5 )? UIStatusBarStyleDefault : UIStatusBarStyleLightContent;
        
        //更新状态栏
        [self.navigationController setNeedsStatusBarAppearanceUpdate];
    }
    
    _imageView.lj_height = _headerView.lj_height;
    
}
#pragma mark - UITableViewDelegate, UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //使用indexpath方法找重用cell,必须先注册cell,否则会crash
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewCellID forIndexPath:indexPath];
    
    cell.textLabel.text = @(indexPath.row).description;
    
    return cell;
}
@end
