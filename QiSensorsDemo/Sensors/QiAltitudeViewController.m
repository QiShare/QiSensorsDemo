//
//  QiAltitudeViewController.m
//  QiSensorsDemo
//
//  Created by huangxianshuai on 2019/5/27.
//  Copyright © 2019 QiShare. All rights reserved.
//

#import "QiAltitudeViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface QiAltitudeViewController () <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;

@end

@implementation QiAltitudeViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"海拔计";
    
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    _locationManager.delegate = self;
    [_locationManager requestAlwaysAuthorization];
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    [_locationManager startUpdatingLocation];
}


#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading {
    
    NSString *newHeadingString = [NSString stringWithFormat:@"x: %f\ny: %f\nz: %f", newHeading.x, newHeading.y, newHeading.z];
    self.latestText = newHeadingString;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    
    CLLocation *location = locations.lastObject;
    
    NSString *locationString = [NSString stringWithFormat:@"altitude: %f\naccuracy: %f", location.altitude, location.verticalAccuracy];
    self.latestText = locationString;
}

- (void)dealloc {
    
    NSLog(@"%s", __FUNCTION__);
}

@end
