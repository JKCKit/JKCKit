//
//  JKCTestTableViewController.m
//  Demo
//
//  Created by yct on 2018/9/10.
//  Copyright © 2018年 JKC. All rights reserved.
//

#import "JKCTestTableViewController.h"
#import "JKCTestTableViewCell.h"
#import "JKCKit.h"
@interface JKCTestTableViewController ()

@end

@implementation JKCTestTableViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    UISlider *s = [[UISlider alloc] initWithFrame:CGRectMake(50, self.view.center.y, self.view.width - 50, 50)];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:3 inSection:0];
    JKCTestTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"JKCTestTableViewCell" forIndexPath:indexPath];
    
    JKCWeakObject(self);
    [s jkc_addActionBlock:^(UISlider *sender) {
        JKCStrongObject(self);
        cell.contentLabel.font = [UIFont systemFontOfSize:100 * sender.value];
        NSLog(@"tableView: %@ \n Cell:%@ \n indexPath:%@", self.tableView, cell, indexPath);
        if (indexPath) {
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }
    } forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:s];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
    
    // Uncomment the following line to preserve selection between presentations.
     self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//     self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"JKCTestTableViewCell" bundle:nil] forCellReuseIdentifier:@"JKCTestTableViewCell"];
    
    JKCWeakObject(self)
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"refresh" style:UIBarButtonItemStylePlain actionBlock:^(id sender) {
        JKCStrongObject(self)
        [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:2 inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
    }];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)contents {
    return @[@"efsdfjkldsajflksadjf;sadsfsdf",
             @"efsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjf",
             @"efsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjf",
             @"efsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjf",
             @"efsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjfefsdfjkldsajflksadjf",];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return [self contents].count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    JKCTestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JKCTestTableViewCell" forIndexPath:indexPath];
    cell.tableView = tableView;
    NSMutableAttributedString *mutableAttString = [[NSMutableAttributedString alloc] initWithString:[self contents][indexPath.row]];
    NSMutableParagraphStyle *npgStyle = [[NSMutableParagraphStyle alloc] init];
    npgStyle.alignment = NSTextAlignmentJustified;
    npgStyle.paragraphSpacing = 11.0;
    npgStyle.paragraphSpacingBefore = 10.0;
    npgStyle.firstLineHeadIndent = 0.0;
    npgStyle.headIndent = 0.0;
    npgStyle.lineSpacing = 0.0;
    npgStyle.lineHeightMultiple = 0.0;
    NSDictionary *dic = @{
                          NSForegroundColorAttributeName:[UIColor blackColor],
                          NSFontAttributeName           :cell.contentLabel.font,
                          NSParagraphStyleAttributeName :npgStyle,
                          NSUnderlineStyleAttributeName :[NSNumber numberWithInteger:NSUnderlineStyleNone]
                          };
    [mutableAttString setAttributes:dic range:NSMakeRange(0, mutableAttString.length)];
    
    cell.contentLabel.attributedText = mutableAttString;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 10.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
