//
//  QiPedometerViewController.m
//  QiSensorsDemo
//
//  Created by huangxianshuai on 2019/5/28.
//  Copyright © 2019 QiShare. All rights reserved.
//

#import "QiPedometerViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface QiPedometerViewController ()

@property (nonatomic, strong) CMPedometer *pedometer;

@end

@implementation QiPedometerViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"计步器";
    
    if (![CMPedometer isStepCountingAvailable]) {
        self.latestText = @"计步器不可用";
    }
    else {
        _pedometer = [[CMPedometer alloc] init];
        self.latestText = @"带着手机运动进行测试";
    }
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    __weak typeof(self) weakSelf = self;
    [_pedometer startPedometerUpdatesFromDate:[NSDate date] withHandler:^(CMPedometerData * _Nullable pedometerData, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSString *pedometerString = [NSString stringWithFormat:@"distance: %@\ncurrentPace: %@\ncurrentCadence: %@\nnumberOfSteps: %@\nfloorsAscended: %@\nfloorsDescended: %@\naverageActivePace: %@", pedometerData.distance, pedometerData.currentPace, pedometerData.currentCadence, pedometerData.numberOfSteps, pedometerData.floorsAscended, pedometerData.floorsDescended, pedometerData.averageActivePace];
            weakSelf.latestText = pedometerString;
        });
    }];
    
    [_pedometer startPedometerEventUpdatesWithHandler:^(CMPedometerEvent * _Nullable pedometerEvent, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (pedometerEvent.type == CMPedometerEventTypePause) {
                weakSelf.latestText = @"计步器暂停";
            } else {
                weakSelf.latestText = @"计步器恢复";
            }
        });
    }];
}


#pragma mark -

- (void)dealloc {
    
    NSLog(@"%s", __FUNCTION__);
}

@end
