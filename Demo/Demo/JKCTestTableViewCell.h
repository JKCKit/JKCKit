//
//  JKCTestTableViewCell.h
//  Demo
//
//  Created by yct on 2018/9/10.
//  Copyright © 2018年 JKC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JKCTestTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (nonatomic, weak) UITableView *tableView;
@end
