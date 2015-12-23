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
    /*
    NSLog(@"setForeground");
    [locationManager stopMonitoringSignificantLocationChanges];
    [locationManager startUpdatingLocation];
     */
}

- (void) setBackground {
    /*
    NSLog(@"setBackground");
    [locationManager stopUpdatingLocation];
    [locationManager startMonitoringSignificantLocationChanges];
     */
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    float Lat = locationManager.location.coordinate.latitude;
    float Long = locationManager.location.coordinate.longitude;
    
    [self logWithString:[NSString stringWithFormat:@"Lat: %f Long: %f\n", Lat, Long] ];
    
    NSURL *soundUrl = [_tracklist getSoundUrlAtLongitude:Long andLatitiude:Lat ];
    if( NULL != soundUrl ){
        [self logWithString:[NSString stringWithFormat:@"%@\n", soundUrl.path ] ];
        NSLog(@"soundUrl: %@", soundUrl.absoluteString );
        _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
        [_audioPlayer play];
    }
}

- (void) logWithString: (NSString *) string {
    _textfield.text = [_textfield.text stringByAppendingString:
                       string
                       ];
}


- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"view did load");
    AVAudioSession *session = [AVAudioSession sharedInstance];
    
    NSError *setCategoryError = nil;
    if (![session setCategory:AVAudioSessionCategoryPlayback
                  withOptions:AVAudioSessionCategoryOptionMixWithOthers
                        error:&setCategoryError]) {
        // handle error
    }
    // Create tracklist, thus allowing the audioplayer to get soundUrls
    _tracklist = [[Tracklist alloc] init];
    
    
    // Start location services
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.activityType = CLActivityTypeFitness;
    locationManager.pausesLocationUpdatesAutomatically = NO;

    [locationManager requestAlwaysAuthorization];
    [locationManager startUpdatingLocation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
