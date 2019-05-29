//
//  QiGravityViewController.m
//  QiSensorsDemo
//
//  Created by huangxianshuai on 2019/5/27.
//  Copyright © 2019 QiShare. All rights reserved.
//

#import "QiGravityViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface QiGravityViewController ()

@property (nonatomic, strong) CMMotionManager *motionManager;

@end

@implementation QiGravityViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"重力计";
    
    _motionManager = [[CMMotionManager alloc] init];
    if (_motionManager.isDeviceMotionAvailable) {
        _motionManager.deviceMotionUpdateInterval = .25;
        self.latestText = @"改变手机的重力进行测试";
    } else {
        self.latestText = @"重力计不可用";
    }
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    __weak typeof(self) weakSelf = self;
    [_motionManager startDeviceMotionUpdatesToQueue:NSOperationQueue.mainQueue withHandler:^(CMDeviceMotion * _Nullable motion, NSError * _Nullable error) {
        if (!error) {
            NSString *gravityString = [NSString stringWithFormat:@"x: %f\ny: %f\nz: %f", motion.gravity.x, motion.gravity.y, motion.gravity.z];
            weakSelf.latestText = gravityString;
        }
        else {
            weakSelf.latestText = @"重力计数据更新出现【错误】";
        }
    }];
}


#pragma mark -

- (void)dealloc {
    
    NSLog(@"%s", __FUNCTION__);
}

@end
