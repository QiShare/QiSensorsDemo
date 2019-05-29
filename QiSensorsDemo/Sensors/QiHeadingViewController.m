//
//  QiHeadingViewController.m
//  QiSensorsDemo
//
//  Created by huangxianshuai on 2019/5/29.
//  Copyright © 2019 QiShare. All rights reserved.
//

#import "QiHeadingViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface QiHeadingViewController () <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;

@end

@implementation QiHeadingViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"方向传感器";
    
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    _locationManager.delegate = self;
    [_locationManager requestWhenInUseAuthorization];
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    [_locationManager startUpdatingHeading];
}

- (void)viewDidDisappear:(BOOL)animated {
    
    [super viewDidDisappear:animated];
    
    [_locationManager stopUpdatingHeading];
}


#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading {
    
    NSString *newHeadingString = [NSString stringWithFormat:@"trueHeading: %f\nmagneticHeading: %f\nheadingAccuracy: %f\nx: %f\ny: %f\nz: %f", newHeading.trueHeading, newHeading.magneticHeading, newHeading.headingAccuracy, newHeading.x, newHeading.y, newHeading.z];
    self.latestText = newHeadingString;
}


#pragma mark -

- (void)dealloc {
    
    NSLog(@"%s", __FUNCTION__);
}

@end
