//
//  JKCWKWebViewProgressViewController.m
//  Demo
//
//  Created by yct on 2018/9/4.
//  Copyright © 2018年 JKC. All rights reserved.
//

#import "JKCWKWebViewProgressViewController.h"
#import <WebKit/WebKit.h>
#import "JKCKit.h"

@interface JKCWKWebViewProgressViewController1 : UIViewController
@property (strong, nonatomic) WKWebView *wkwebView;
@end


@interface JKCWKWebViewProgressViewController ()
@property (strong, nonatomic) WKWebView *wkwebView;

@end

@implementation JKCWKWebViewProgressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WKWebView.showProgressView = YES;
    [self.wkwebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];
    self.wkwebView.showProgressView = NO;
    self.wkwebView.progressView.progressTintColor = [UIColor orangeColor];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"instanceProgressView" style:UIBarButtonItemStylePlain actionBlock:^(id sender) {
        [self.navigationController pushViewController:[JKCWKWebViewProgressViewController1 new] animated:YES];
    }];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)pushInstanceProgressView {
//    [self.navigationController pushViewController:[JKCWKWebViewProgressViewController1 new] animated:YES];
}

- (WKWebView *)wkwebView {
    if (!_wkwebView) {
        _wkwebView = [[WKWebView alloc] init];
        [self.view addSubview:_wkwebView];
        _wkwebView.translatesAutoresizingMaskIntoConstraints = NO;
        if (@available(iOS 11.0, *)) {
            NSLayoutConstraint *constraintT = [NSLayoutConstraint constraintWithItem:_wkwebView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
            
            NSLayoutConstraint *constraintL = [NSLayoutConstraint constraintWithItem:_wkwebView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
            
            NSLayoutConstraint *constraintB = [NSLayoutConstraint constraintWithItem:_wkwebView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
            
            NSLayoutConstraint *constraintR = [NSLayoutConstraint constraintWithItem:_wkwebView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
            [self.view addConstraints:@[constraintT, constraintL, constraintB, constraintR]];
        } else {
            NSArray *constraintH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-64-[_wkwebView]-0-|" options:kNilOptions metrics:nil views:NSDictionaryOfVariableBindings(_wkwebView)];
            NSArray *constraintV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-64-[_wkwebView]-0-|" options:kNilOptions metrics:nil views:NSDictionaryOfVariableBindings(_wkwebView)];
            NSMutableArray *constraints = [NSMutableArray arrayWithArray:constraintH];
            [constraints addObjectsFromArray:constraintV];
            [self.view addConstraints:constraints];
        }
    }
    return _wkwebView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    NSLog(@"%s", __FUNCTION__);
}

@end



@implementation JKCWKWebViewProgressViewController1
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.wkwebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];
    self.wkwebView.showProgressView = NO;
    self.wkwebView.progressView.progressTintColor = [UIColor purpleColor];
}

- (void)pushInstanceProgressView {
    
}

- (WKWebView *)wkwebView {
    if (!_wkwebView) {
        _wkwebView = [[WKWebView alloc] init];
        [self.view addSubview:_wkwebView];
        _wkwebView.translatesAutoresizingMaskIntoConstraints = NO;
        if (@available(iOS 11.0, *)) {
            NSLayoutConstraint *constraintT = [NSLayoutConstraint constraintWithItem:_wkwebView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
            
            NSLayoutConstraint *constraintL = [NSLayoutConstraint constraintWithItem:_wkwebView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
            
            NSLayoutConstraint *constraintB = [NSLayoutConstraint constraintWithItem:_wkwebView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
            
            NSLayoutConstraint *constraintR = [NSLayoutConstraint constraintWithItem:_wkwebView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
            [self.view addConstraints:@[constraintT, constraintL, constraintB, constraintR]];
        } else {
            NSArray *constraintH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-64-[_wkwebView]-0-|" options:kNilOptions metrics:nil views:NSDictionaryOfVariableBindings(_wkwebView)];
            NSArray *constraintV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-64-[_wkwebView]-0-|" options:kNilOptions metrics:nil views:NSDictionaryOfVariableBindings(_wkwebView)];
            NSMutableArray *constraints = [NSMutableArray arrayWithArray:constraintH];
            [constraints addObjectsFromArray:constraintV];
            [self.view addConstraints:constraints];
        }
    }
    return _wkwebView;
}

- (void)dealloc
{
    NSLog(@"%s", __FUNCTION__);
}
@end
