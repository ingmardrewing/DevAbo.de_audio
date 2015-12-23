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
    NSTimer *timer;
    UIBackgroundTaskIdentifier bgTask;
}
@end

@implementation ViewController

- (void) setForeground {
    [self->locationManager stopUpdatingLocation];
}

- (void) setBackground {
    [self->locationManager stopUpdatingLocation];
    
    UIApplication *app = [UIApplication sharedApplication];
    
    bgTask = [app beginBackgroundTaskWithExpirationHandler:^{
        [app endBackgroundTask:bgTask];
        bgTask =  UIBackgroundTaskInvalid;
    }];
    
    self->timer = [NSTimer scheduledTimerWithTimeInterval:15 // seconds
                                                  target:self->locationManager
                                                selector:@selector(startUpdatingLocation)
                                                userInfo:nil
                                                 repeats:YES];
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    float Lat = locationManager.location.coordinate.latitude;
    float Long = locationManager.location.coordinate.longitude;
    [self logWithString:[NSString stringWithFormat:@"Lat: %f Long: %f\n", Lat, Long] ];
    NSURL *soundUrl = [_tracklist getSoundUrlAtLongitude:Long andLatitiude:Lat ];
    if( NULL != soundUrl ){
        [self playSoundUrl:soundUrl];
    }
}

- (void)playSoundUrl:(NSURL *)soundUrl {
    [self logWithString:[NSString stringWithFormat:@"%@\n", soundUrl.path ] ];
    NSLog(@"soundUrl: %@", soundUrl.absoluteString );
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    [_audioPlayer play];
}

- (void) logWithString: (NSString *) string {
    _textfield.text = [_textfield.text stringByAppendingString:string ];
}

- (void)create_location_manager {
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.activityType = CLActivityTypeFitness;
    locationManager.pausesLocationUpdatesAutomatically = NO;
    [locationManager requestAlwaysAuthorization];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    AVAudioSession *session = [AVAudioSession sharedInstance];
    
    NSError *setCategoryError = nil;
    if (![session setCategory:AVAudioSessionCategoryPlayback
                  withOptions:AVAudioSessionCategoryOptionMixWithOthers
                        error:&setCategoryError]) {
    }
    
    _tracklist = [[Tracklist alloc] init];
    
    [self create_location_manager];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
