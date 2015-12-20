//
//  ViewController.m
//  DevAbo.de
//
//  Created by Ingmar Drewing on 20/12/15.
//  Copyright © 2015 Ingmar Drewing. All rights reserved.
//

#import "Tracklist.h"
#import "ViewController.h"
@import AVFoundation;

@interface ViewController (){
    AVAudioPlayer *_audioPlayer;
    Tracklist *_tracklist;
}

@end

@implementation ViewController

- (IBAction)Play:(id)sender {
    NSLog(@"pushed play");
    [_audioPlayer play];
}

- (IBAction)locate:(id)sender {
    NSLog(@"pushed location");
}

- (void)viewDidLoad
{
    [super viewDidLoad];

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
