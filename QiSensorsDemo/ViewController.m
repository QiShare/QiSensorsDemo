//
//  ViewController.m
//  QiSensorsDemo
//
//  Created by huangxianshuai on 2019/5/27.
//  Copyright © 2019 QiShare. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray<NSString *> *titles;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _titles = @[@"陀螺仪", @"加速计", @"磁力计", @"重力计", @"海拔计", @"计步器", @"距离传感器", @"环境光传感器"];
    
    [_tableView registerClass:UITableViewCell.class forCellReuseIdentifier:NSStringFromClass(UITableViewCell.class)];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(UITableViewCell.class) forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = _titles[indexPath.row];
    
    return cell;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
            [self performSegueWithIdentifier:@"showGyro" sender:nil];
            break;
        case 1:
            [self performSegueWithIdentifier:@"showAccelerometer" sender:nil];
            break;
        case 2:
            [self performSegueWithIdentifier:@"showMagnetometer" sender:nil];
            break;
        case 3:
            [self performSegueWithIdentifier:@"showGravity" sender:nil];
            break;
        case 4:
            [self performSegueWithIdentifier:@"showAltitude" sender:nil];
            break;
        case 5:
            [self performSegueWithIdentifier:@"showPedometer" sender:nil];
            break;
        case 6:
            [self performSegueWithIdentifier:@"showProximity" sender:nil];
            break;
        case 7:
            [self performSegueWithIdentifier:@"showBrightness" sender:nil];
            break;
        default:
            break;
    }
}

@end
