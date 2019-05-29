//
//  QiMagnetometerViewController.m
//  QiSensorsDemo
//
//  Created by huangxianshuai on 2019/5/27.
//  Copyright © 2019 QiShare. All rights reserved.
//

#import "QiMagnetometerViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface QiMagnetometerViewController ()

@property (nonatomic, strong) CMMotionManager *motionManager;

@end

@implementation QiMagnetometerViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"磁力计";
    
    _motionManager = [[CMMotionManager alloc] init];
    if (_motionManager.isMagnetometerAvailable) {
        _motionManager.magnetometerUpdateInterval = .25;
        self.latestText = @"改变手机附近磁场进行测试";
    } else {
        self.latestText = @"磁力计不可用";
    }
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    __weak typeof(self) weakSelf = self;
    [_motionManager startMagnetometerUpdatesToQueue:NSOperationQueue.mainQueue withHandler:^(CMMagnetometerData * _Nullable magnetometerData, NSError * _Nullable error) {
        if (!error) {
            CMMagneticField magneticField = magnetometerData.magneticField;
            NSString *magneticFieldString = [NSString stringWithFormat:@"x: %f\ny: %f\nz: %f", magneticField.x, magneticField.y, magneticField.z];
            weakSelf.latestText = magneticFieldString;
        }
        else {
            weakSelf.latestText = @"磁力计数据更新出现【错误】";
        }
    }];
}


#pragma mark -

- (void)dealloc {
    
    NSLog(@"%s", __FUNCTION__);
}

@end
