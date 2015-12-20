//
//  ViewController.m
//  DevAbo.de
//
//  Created by Ingmar Drewing on 20/12/15.
//  Copyright © 2015 Ingmar Drewing. All rights reserved.
//

#import "Tracklist.h"
#import "ViewController.h"
@import CoreLocation;
@import AVFoundation;

@interface ViewController (){
    AVAudioPlayer *_audioPlayer;
    Tracklist *_tracklist;
    CLLocationManager *locationManager;
}

@end

@implementation ViewController

- (void) setForeground {
    NSLog(@"setForeground");
    [locationManager stopMonitoringSignificantLocationChanges];
    [locationManager startUpdatingLocation];
}

- (void) setBackground {
    NSLog(@"setBackground");
    [locationManager stopUpdatingLocation];
    [locationManager startMonitoringSignificantLocationChanges];
}

- (IBAction)Play:(id)sender {
    NSLog(@"pushed play");
    [_audioPlayer play];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    NSLog(@"locationManager called");

    float Lat = locationManager.location.coordinate.latitude;
    float Long = locationManager.location.coordinate.longitude;
    NSLog(@"Lat : %f  Long : %f",Lat,Long);
}


- (void)viewDidLoad {
    [super viewDidLoad];

    
    // Start location services
    locationManager = [[CLLocationManager alloc] init];
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    // Only report to location manager if the user has traveled 1000 meters
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy =kCLLocationAccuracyHundredMeters;
    locationManager.delegate = self;
    locationManager.activityType = CLActivityTypeFitness;
    
    [locationManager requestAlwaysAuthorization];
    [locationManager startMonitoringSignificantLocationChanges];
//    [locationManager startUpdatingLocation];


    // Create tracklist, thus allowing the audioplayer to get soundUrls
    _tracklist = [[Tracklist alloc] init];
    
    // Create audio player object and initialize with URL to sound
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[_tracklist getSoundUrl]
                                                          error:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
