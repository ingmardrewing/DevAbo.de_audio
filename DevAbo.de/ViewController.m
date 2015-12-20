//
//  ViewController.m
//  DevAbo.de
//
//  Created by Ingmar Drewing on 20/12/15.
//  Copyright © 2015 Ingmar Drewing. All rights reserved.
//

#import "ViewController.h"
@import AVFoundation;

@interface ViewController (){
    AVAudioPlayer *_audioPlayer;
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
    NSLog(@"view did load");
    NSString *path = [NSString stringWithFormat:@"%@/test.mp3", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundUrl = [NSURL fileURLWithPath:path];
    
    // Create audio player object and initialize with URL to sound
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
