//
//  QiProximityViewController.m
//  QiSensorsDemo
//
//  Created by huangxianshuai on 2019/5/27.
//  Copyright © 2019 QiShare. All rights reserved.
//

#import "QiProximityViewController.h"

@implementation QiProximityViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"距离感应器";
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(proximityStateChanged:) name:UIDeviceProximityStateDidChangeNotification object:nil];
    self.latestText = @"用物体靠近/远离正面听筒处的距离传感器进行测试";
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    if ([UIDevice currentDevice].isProximityMonitoringEnabled == NO) {
        [UIDevice currentDevice].proximityMonitoringEnabled = YES;
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    if ([UIDevice currentDevice].isProximityMonitoringEnabled) {
        [UIDevice currentDevice].proximityMonitoringEnabled = NO;
    }
}


#pragma mark - Notification functions

- (void)proximityStateChanged:(id)sender {
    
    if ([UIDevice currentDevice].proximityState) {
        self.latestText = @"有物体【靠近】距离传感器";
    } else {
        self.latestText = @"有物体【远离】距离传感器";
    }
}


#pragma mark -

- (void)dealloc {
    
    NSLog(@"%s", __FUNCTION__);
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceProximityStateDidChangeNotification object:nil];
}

@end
