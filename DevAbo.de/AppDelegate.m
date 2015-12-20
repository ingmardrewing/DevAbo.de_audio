//
//  AppDelegate.m
//  DevAbo.de
//
//  Created by Ingmar Drewing on 20/12/15.
//  Copyright © 2015 Ingmar Drewing. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
@import AVFoundation;

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSError *sessionError = nil;
    NSError *activationError = nil;
    [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayback error:&sessionError];
    [[AVAudioSession sharedInstance] setActive: YES error: &activationError];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    ViewController *rootViewController = window.rootViewController;
    [rootViewController setBackground];
}

- (void)willEnterForeground:(UIApplication *)application {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    ViewController *rootViewController = window.rootViewController;
    [rootViewController setForeground];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    ViewController *rootViewController = window.rootViewController;
    [rootViewController setForeground];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
