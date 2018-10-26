//
//  ViewController.m
//  Demo
//
//  Created by yct on 2018/8/29.
//  Copyright © 2018年 JKC. All rights reserved.
//

#import "ViewController.h"
#import "JKCKit.h"
@interface Test : NSObject
JKCSingletonH(Instance)
@end

@implementation Test

JKCSingletonM(Instance);

JKCSetupSingletonMethod {
    JKCLog(@"%s", __FUNCTION__);
}

@end

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [Test shareInstance];
}


#pragma mark -
- (NSArray *)tableViewTitles {
    return @[@"UIControl+Block",
             @"UIAlert+Block",
             @"UIAlert+UIActivityIndicatorView",
             @"UIAlert+UIProgressView",
             @"WKWebview+UIProgressView",
             @"NSTimer+JKCBlock",
             @"UIColor+JKCUtils"];
}

#pragma mark -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self tableViewTitles].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = [self tableViewTitles][indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0: {
            [self performSegueWithIdentifier:@"UIControl+Block" sender:nil];
        }
            break;
        case 1: {
            UIAlertController *alertController = [UIAlertController jkc_alertControllerWithTitle:@"title" message:@"message" preferredStyle:UIAlertControllerStyleAlert cancelAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                NSLog(@"Cancel");
            }], [UIAlertAction actionWithTitle:@"Default" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                NSLog(@"Default");
            }], [UIAlertAction actionWithTitle:@"Destructive" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                NSLog(@"Destructive");
            }], nil];
            [self presentViewController:alertController animated:YES completion:nil];
        }
            break;
        case 2: {
            UIAlertController *alertController = [UIAlertController jkc_showLoadingAlertWithTitle:@"Title" message:@"message"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [alertController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
            });
        }
            break;
        case 3: {
            [UIAlertController jkc_showProgressAlertWithTitle:@"Tips" message:@"Downloading..." handler:^(UIProgressView *progressView, UIAlertController *alertController) {
                [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
                    if (progressView.progress < 1.0f) {
                        [progressView setProgress:progressView.progress += 0.1 animated:YES];
                    } else {
                        [alertController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
                        [timer invalidate];
                        NSLog(@"Download Finish");
                    }
                }];
            }];
        }
            break;
        case 4: {
            [self performSegueWithIdentifier:@"WKWebView+UIProgressView" sender:nil];
        }
            break;
        case 5: {
            int __block i = 0;
            [NSTimer jkc_scheduledTimerWithTimeInterval:1.0f userInfo:@{@"a":@"b"} repeats:YES actionBlock:^(NSTimer *timer) {
                NSLog(@"%@ \n %@",timer, timer.userInfo);
                if (i > 5) {
                    [timer invalidate];
                }
                i++;
            }];
        }
            break;
        case 6: {
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            cell.backgroundColor = [UIColor jkc_colorWithHexString:@"0x7FFF00"];
        }
            break;
    }
}
@end
