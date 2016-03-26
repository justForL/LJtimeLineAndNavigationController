//
//  ViewController.m
//  NavigationController
//
//  Created by James on 16/3/26.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "LJNewViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"按钮" style:UIBarButtonItemStylePlain target:self action:@selector(pushController)];
    
    self.navigationItem.rightBarButtonItem = item;
}


- (void)pushController {
    [self.navigationController pushViewController:[[LJNewViewController alloc]init] animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
    //push关键在于后面的动画效果选择为yes,否则效果很难看
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
@end
