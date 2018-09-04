//
//  UIControlBlockViewController.m
//  Demo
//
//  Created by yct on 2018/9/3.
//  Copyright © 2018年 JKC. All rights reserved.
//

#import "UIControlBlockViewController.h"
#import "JKCKit.h"
@interface UIControlBlockViewController ()

@property (weak, nonatomic) IBOutlet UIButton *button;
@end

@implementation UIControlBlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.button jkc_addActionBlock:^(id sender) {
        NSLog(@"tap");
    } forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
