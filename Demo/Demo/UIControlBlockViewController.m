//
//  UIControlBlockViewController.m
//  Demo
//
//  Created by yct on 2018/9/3.
//  Copyright © 2018年 JKC. All rights reserved.
//

#import "UIControlBlockViewController.h"
#import "JKCKit.h"
#import "JKCTestTableViewController.h"
@interface UIControlBlockViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UISlider *fontSslider;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@end

@implementation UIControlBlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.button jkc_addActionBlock:^(id sender) {
        NSLog(@"tap");
    } forControlEvents:UIControlEventTouchUpInside];
    
    [self.navigationController pushViewController:[JKCTestTableViewController new] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)fontSliderAction:(UISlider *)sender {
    self.label.font = [UIFont systemFontOfSize:100 * sender.value];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    return cell;
}

@end
