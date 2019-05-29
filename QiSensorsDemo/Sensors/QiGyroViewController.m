//
//  QiGyroViewController.m
//  QiSensorsDemo
//
//  Created by huangxianshuai on 2019/5/27.
//  Copyright © 2019 QiShare. All rights reserved.
//

#import "QiGyroViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface QiGyroViewController ()

@property (nonatomic, strong) CMMotionManager *motionManager;

@end

@implementation QiGyroViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"陀螺仪";
    
    _motionManager = [[CMMotionManager alloc] init];
    if (_motionManager.isGyroAvailable) {
        _motionManager.gyroUpdateInterval = .25;
        self.latestText = @"转动手机进行测试";
    } else {
        self.latestText = @"陀螺仪不可用";
    }
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    __weak typeof(self) weakSelf = self;
    [_motionManager startGyroUpdatesToQueue:NSOperationQueue.mainQueue withHandler:^(CMGyroData * _Nullable gyroData, NSError * _Nullable error) {
        if (!error) {
            CMRotationRate rotationRate = gyroData.rotationRate;
            NSString *rotationRateString = [NSString stringWithFormat:@"x: %f\ny: %f\nz: %f", rotationRate.x, rotationRate.y, rotationRate.z];
            weakSelf.latestText = rotationRateString;
        }
        else {
            weakSelf.latestText = @"陀螺仪数据更新出现【错误】";
        }
    }];
}


#pragma mark -

- (void)dealloc {
    
    NSLog(@"%s", __FUNCTION__);
}

@end
