//
//  QiAccelerometerViewController.m
//  QiSensorsDemo
//
//  Created by huangxianshuai on 2019/5/27.
//  Copyright © 2019 QiShare. All rights reserved.
//

#import "QiAccelerometerViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface QiAccelerometerViewController ()

@property (nonatomic, strong) CMMotionManager *motionManager;

@end

@implementation QiAccelerometerViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"加速计";
    
    _motionManager = [[CMMotionManager alloc] init];
    if (_motionManager.isAccelerometerAvailable) {
        _motionManager.accelerometerUpdateInterval = .25;
        self.latestText = @"移动/晃动手机进行测试";
    } else {
        self.latestText = @"加速计不可用";
    }
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    __weak typeof(self) weakSelf = self;
    [_motionManager startAccelerometerUpdatesToQueue:NSOperationQueue.mainQueue withHandler:^(CMAccelerometerData * _Nullable accelerometerData, NSError * _Nullable error) {
        if (!error) {
            CMAcceleration acceleration = accelerometerData.acceleration;
            NSString *accelerationString = [NSString stringWithFormat:@"x: %f\ny: %f\nz: %f", acceleration.x, acceleration.y, acceleration.z];
            weakSelf.latestText = accelerationString;
        }
        else {
            weakSelf.latestText = @"加速计数据更新出现【错误】";
        }
    }];
}


#pragma mark -

- (void)dealloc {
    
    NSLog(@"%s", __FUNCTION__);
}

@end
